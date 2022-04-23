package com.sixsixsix516.common.core.exception;

/**
 * 自定义异常
 *
 * @author SUN
 */
public class CustomException extends RuntimeException {


    private static final long serialVersionUID = 1L;

    private Integer code;

    private final String message;

    public CustomException(String message) {
        this.message = message;
    }

    public CustomException(String message, Integer code) {
        this.message = message;
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public Integer getCode() {
        return code;
    }
}
