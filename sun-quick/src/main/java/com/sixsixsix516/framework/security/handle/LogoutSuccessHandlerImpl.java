package com.sixsixsix516.framework.security.handle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixsixsix516.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import com.alibaba.fastjson.JSON;
import com.sixsixsix516.framework.constant.Constants;
import com.sixsixsix516.model.system.LoginUser;
import com.sixsixsix516.framework.utils.ServletUtils;
import com.sixsixsix516.framework.utils.StringUtils;
import com.sixsixsix516.framework.manager.AsyncManager;
import com.sixsixsix516.framework.manager.factory.AsyncFactory;
import com.sixsixsix516.framework.web.service.TokenService;

/**
 * 自定义退出处理类 返回成功
 *
 * @author SUN
 */
@Configuration
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {

	@Autowired
	private TokenService tokenService;

	/**
	 * 退出处理
	 */
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		LoginUser loginUser = tokenService.getLoginUser(request);
		if (StringUtils.isNotNull(loginUser)) {
			String userName = loginUser.getUsername();
			// 删除用户缓存记录
			tokenService.delLoginUser(loginUser.getToken());
			// 记录用户退出日志
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(userName, Constants.LOGOUT, "退出成功"));
		}
		ServletUtils.renderString(response, JSON.toJSONString(Result.ok("退出成功")));
	}
}
