package com.sixsixsix516.controller.system.monitor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.sixsixsix516.vo.Result;
import com.sixsixsix516.framework.service.SysUserOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.framework.annotation.Log;
import com.sixsixsix516.framework.constant.Constants;
import com.sixsixsix516.model.system.LoginUser;
import com.sixsixsix516.framework.core.redis.RedisCache;
import com.sixsixsix516.framework.enums.BusinessType;
import com.sixsixsix516.framework.utils.StringUtils;
import com.sixsixsix516.model.system.SysUserOnline;

/**
 * 在线用户监控
 *
 * @author SUN
 */
@RestController
@RequestMapping("/monitor/online")
public class SysUserOnlineController {

	@Autowired
	private SysUserOnlineService userOnlineService;

	@Autowired
	private RedisCache redisCache;

	@PreAuthorize("@ss.hasPermi('monitor:online:list')")
	@GetMapping("/list")
	public Result list(String ipaddr, String userName) {
		Collection<String> keys = redisCache.keys(Constants.LOGIN_TOKEN_KEY + "*");
		List<SysUserOnline> userOnlineList = new ArrayList<SysUserOnline>();
		for (String key : keys) {
			LoginUser user = redisCache.getCacheObject(key);
			if (StringUtils.isNotEmpty(ipaddr) && StringUtils.isNotEmpty(userName)) {
				if (StringUtils.equals(ipaddr, user.getIpaddr()) && StringUtils.equals(userName, user.getUsername())) {
					userOnlineList.add(userOnlineService.selectOnlineByInfo(ipaddr, userName, user));
				}
			} else if (StringUtils.isNotEmpty(ipaddr)) {
				if (StringUtils.equals(ipaddr, user.getIpaddr())) {
					userOnlineList.add(userOnlineService.selectOnlineByIpaddr(ipaddr, user));
				}
			} else if (StringUtils.isNotEmpty(userName) && StringUtils.isNotNull(user.getUser())) {
				if (StringUtils.equals(userName, user.getUsername())) {
					userOnlineList.add(userOnlineService.selectOnlineByUserName(userName, user));
				}
			} else {
				userOnlineList.add(userOnlineService.loginUserToUserOnline(user));
			}
		}
		Collections.reverse(userOnlineList);
		userOnlineList.removeAll(Collections.singleton(null));
		return Result.ok(userOnlineList);
	}

	/**
	 * 强退用户
	 */
	@PreAuthorize("@ss.hasPermi('monitor:online:forceLogout')")
	@Log(title = "在线用户", businessType = BusinessType.FORCE)
	@DeleteMapping("/{tokenId}")
	public Result forceLogout(@PathVariable String tokenId) {
		redisCache.deleteObject(Constants.LOGIN_TOKEN_KEY + tokenId);
		return Result.ok();
	}
}
