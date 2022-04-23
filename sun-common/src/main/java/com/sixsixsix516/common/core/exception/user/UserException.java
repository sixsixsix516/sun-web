package com.sixsixsix516.common.core.exception.user;

import com.sixsixsix516.common.core.exception.BaseException;

/**
 * 用户信息异常类
 *
 * @author SUN
 */
public class UserException extends BaseException {

    public UserException(String code, Object[] args) {
        super(code, args, null);
    }
}
