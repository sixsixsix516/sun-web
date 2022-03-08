package com.sixsixsix516.manager.core.web.service;

import javax.annotation.Resource;

import com.sixsixsix516.manager.core.factory.AsyncFactory;
import com.sixsixsix516.manager.core.factory.AsyncManager;
import com.sixsixsix516.manager.core.model.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.exception.CustomException;
import com.sixsixsix516.common.core.exception.user.UserPasswordNotMatchException;

/**
 * 登录校验方法
 *
 * @author SUN
 */
@Component
public class SysLoginService {

	@Autowired
	private TokenService tokenService;
	@Resource
	private AuthenticationManager authenticationManager;


	/**
	 * 登录验证
	 *
	 * @param username 用户名
	 * @param password 密码
	 * @return 结果
	 */
	public String login(String username, String password) {
		// 用户验证
		Authentication authentication;
		try {
			// 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
			authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		} catch (Exception e) {
			if (e instanceof BadCredentialsException) {
				AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, "用户不存在/密码错误"));
				throw new UserPasswordNotMatchException();
			} else {
				AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
				throw new CustomException(e.getMessage());
			}
		}
		AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, "登录成功"));
		LoginUser loginUser = (LoginUser) authentication.getPrincipal();
		return tokenService.createToken(loginUser);
	}
}
