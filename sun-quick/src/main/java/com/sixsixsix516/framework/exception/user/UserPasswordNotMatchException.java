package com.sixsixsix516.framework.exception.user;

/**
 * 用户密码不正确或不符合规范异常类
 *
 * @author SUN
 */
public class UserPasswordNotMatchException extends UserException {
	private static final long serialVersionUID = 1L;

	public UserPasswordNotMatchException() {
		super("用户不存在/密码错误", null);
	}
}
