package com.sixsixsix516.manager.core.web.service;

import com.sixsixsix516.common.core.enums.UserStatus;
import com.sixsixsix516.common.core.exception.BaseException;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.service.SysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * 用户验证处理
 *
 * @author SUN
 */
@RequiredArgsConstructor
@Slf4j
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		SysUser user = userService.selectUserByUserName(username);
		if (StringUtils.isNull(user)) {
			log.info("登录用户：{} 不存在.", username);
			throw new UsernameNotFoundException("登录用户：" + username + " 不存在");
		} else if (UserStatus.DISABLE.getCode().equals(user.getStatus())) {
			log.info("登录用户：{} 已被停用.", username);
			throw new BaseException("对不起，您的账号：" + username + " 已停用");
		}
		return createLoginUser(user);
	}

	public UserDetails createLoginUser(SysUser user) {
		return new LoginUser(user, permissionService.getMenuPermission(user));
	}

	private final SysUserService userService;
	private final SysPermissionService permissionService;
}
