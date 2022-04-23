package com.sixsixsix516.manager.core.factory;

import com.sixsixsix516.common.core.utils.LogUtils;
import com.sixsixsix516.common.model.system.SysOperationLog;
import com.sixsixsix516.manager.service.SysLoginInfoService;
import com.sixsixsix516.manager.service.SysOperationLogService;
import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.core.utils.ip.AddressUtils;
import com.sixsixsix516.common.core.utils.ip.IpUtils;
import com.sixsixsix516.common.core.utils.spring.SpringUtils;
import com.sixsixsix516.common.model.system.SysLoginInfo;
import eu.bitwalker.useragentutils.UserAgent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.TimerTask;

/**
 * 异步工厂（产生任务用）
 *
 * @author SUN
 */
public class AsyncFactory {
	private static final Logger sys_user_logger = LoggerFactory.getLogger("sys-user");

	/**
	 * 记录登陆信息
	 *
	 * @param username 用户名
	 * @param status   状态
	 * @param message  消息
	 * @param args     列表
	 * @return 任务task
	 */
	public static TimerTask recordLogininfor(final String username, final String status, final String message,
											 final Object... args) {
		final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
		final String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
		return new TimerTask() {
			@Override
			public void run() {
				String address = AddressUtils.getRealAddressByIP(ip);
				String s = LogUtils.getBlock(ip) +
						address +
						LogUtils.getBlock(username) +
						LogUtils.getBlock(status) +
						LogUtils.getBlock(message);
				// 打印信息到日志
				sys_user_logger.info(s, args);
				// 获取客户端操作系统
				String os = userAgent.getOperatingSystem().getName();
				// 获取客户端浏览器
				String browser = userAgent.getBrowser().getName();
				// 封装对象
				SysLoginInfo sysLoginInfo = new SysLoginInfo();
				sysLoginInfo.setUserName(username);
				sysLoginInfo.setIpaddr(ip);
				sysLoginInfo.setLoginLocation(address);
				sysLoginInfo.setBrowser(browser);
				sysLoginInfo.setOs(os);
				sysLoginInfo.setLoginTime(new Date());
				sysLoginInfo.setMsg(message);
				// 日志状态
				if (Constants.LOGIN_SUCCESS.equals(status) || Constants.LOGOUT.equals(status)) {
					sysLoginInfo.setStatus(Constants.SUCCESS);
				} else if (Constants.LOGIN_FAIL.equals(status)) {
					sysLoginInfo.setStatus(Constants.FAIL);
				}
				// 插入数据
				SpringUtils.getBean(SysLoginInfoService.class).insertLoginInfo(sysLoginInfo);
			}
		};
	}

	/**
	 * 操作日志记录
	 *
	 * @param operLog 操作日志信息
	 * @return 任务task
	 */
	public static TimerTask record(final SysOperationLog operLog) {
		return new TimerTask() {
			@Override
			public void run() {
				// 远程查询操作地点
				operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
				SpringUtils.getBean(SysOperationLogService.class).insertOperationLog(operLog);
			}
		};
	}
}
