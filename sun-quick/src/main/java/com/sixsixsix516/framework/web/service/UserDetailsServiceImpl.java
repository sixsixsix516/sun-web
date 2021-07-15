package com.sixsixsix516.framework.web.service;

import com.sixsixsix516.framework.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.sixsixsix516.model.system.SysUser;
import com.sixsixsix516.model.system.LoginUser;
import com.sixsixsix516.framework.enums.UserStatus;
import com.sixsixsix516.framework.exception.BaseException;
import com.sixsixsix516.framework.utils.StringUtils;

/**
 * 用户验证处理
 *
 * @author SUN
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

	@Autowired
	private SysUserService userService;

	@Autowired
	private SysPermissionService permissionService;

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
}
