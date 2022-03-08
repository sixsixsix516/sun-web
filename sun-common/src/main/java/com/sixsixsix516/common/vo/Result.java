package com.sixsixsix516.common.vo;

import com.sixsixsix516.common.core.constant.ErrorCode;
import lombok.*;

/**
 * @author sun 2020/2/23 20:51
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result<T> {

    private int code;

    private String message;

    private Object data;

    private long total;

    public static <T> Result<T> build(ErrorCode errorCode, T data) {
        return build(errorCode.getCode(), errorCode.getMessage(), data);
    }

    public static <T> Result<T> build(ErrorCode errorCode) {
        return build(errorCode.getCode(), errorCode.getMessage());
    }

    public static <T> Result<T> fail() {
        return build(-1, null);
    }

    public static <T> Result<T> fail(String message) {
        return build(-1, message);
    }

    public static <T> Result<T> ok() {
        return build(0, "请求成功");
    }

    public static <T> Result<T> ok(String message) {
        return build(0, message);
    }

    public static <T> Result<T> ok(T data) {
        return build(0, "请求成功", data);
    }

    public static <T> Result<T> okData(T data) {
        return build(0, "请求成功", data);
    }

    public static <T> Result<T> ok(T data, long total) {
        return new Result<>(0, "请求成功", data, total);
    }

    public static <T> Result<T> build(int code, String message) {
        return build(code, message, null);
    }

    public static <T> Result<T> build(int code, String message, T data) {
        return new Result<>(code, message, data, 0);
    }

}
