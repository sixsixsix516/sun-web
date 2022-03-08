package com.sixsixsix516.common.core.exception.file;

import com.sixsixsix516.common.core.exception.BaseException;

/**
 * 文件信息异常类
 *
 * @author SUN
 */
public class FileException extends BaseException {
	private static final long serialVersionUID = 1L;

	public FileException(String code, Object[] args) {
		super("file", code, args, null);
	}

}
