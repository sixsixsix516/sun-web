package com.sixsixsix516.common.core.exception;

/**
 * 工具类异常
 *
 * @author SUN
 */
public class UtilException extends RuntimeException {

    public UtilException(Throwable e) {
        super(e.getMessage(), e);
    }

}
