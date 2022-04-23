package com.sixsixsix516.common.core.exception;

import com.sixsixsix516.common.core.utils.StringUtils;

/**
 * 基础异常
 *
 * @author SUN
 */
public class BaseException extends RuntimeException {
	private static final long serialVersionUID = 1L;

    /**
	 * 错误码
	 */
	private final String code;

	/**
	 * 错误码对应的参数
	 */
	private final Object[] args;

	/**
	 * 错误消息
	 */
	private final String defaultMessage;

	public BaseException(String code, Object[] args, String defaultMessage) {
        this.code = code;
		this.args = args;
		this.defaultMessage = defaultMessage;
	}

	public BaseException(String defaultMessage) {
		this(null, null, defaultMessage);
	}

	@Override
	public String getMessage() {
		String message = null;
		if (!StringUtils.isEmpty(code)) {
			message = code;
		}
		if (message == null) {
			message = defaultMessage;
		}
		return message;
	}

	public String getCode() {
		return code;
	}

	public Object[] getArgs() {
		return args;
	}

}
