package com.sixsixsix516.vo;

import com.sixsixsix516.framework.constant.ErrorCode;
import lombok.*;

/**
 * @author sun 2020/2/23 20:51
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Result<T> {

	private int code;

	private String message;

	private T data;

	private long total;

	public static <T> Result build(ErrorCode errorCode, T data) {
		return build(errorCode.getCode(), errorCode.getMessage(), data);
	}

	public static <T> Result build(ErrorCode errorCode) {
		return build(errorCode.getCode(), errorCode.getMessage());
	}

	public static <T> Result fail() {
		return build(-1, null);
	}

	public static <T> Result fail(String message) {
		return build(-1, message);
	}

	public static <T> Result ok() {
		return build(0, "请求成功");
	}

	public static <T> Result ok(String message) {
		return build(0, message);
	}

	public static <T> Result ok(T data) {
		return build(0, "请求成功", data);
	}

	public static <T> Result okData(T data) {
		return build(0, "请求成功", data);
	}

	public static <T> Result ok(T data, long total) {
		return new Result(0, "请求成功", data, total);
	}

	public static <T> Result build(int code, String message) {
		return build(code, message, null);
	}

	public static <T> Result build(int code, String message, T data) {
		return new Result(code, message, data, 0);
	}

}
