package com.sixsixsix516.vo;

import com.sixsixsix516.framework.constant.ErrorCode;
import lombok.*;
import org.apache.poi.ss.formula.functions.T;

/**
 * @author sun 2020/2/23 20:51
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Result {

	private int code;

	private String message;

	private Object data;

	private long total;

	public static Result build(ErrorCode errorCode, T data) {
		return build(errorCode.getCode(), errorCode.getMessage(), data);
	}

	public static Result build(ErrorCode errorCode) {
		return build(errorCode.getCode(), errorCode.getMessage());
	}

	public static Result fail() {
		return build(-1, null);
	}

	public static Result fail(String message) {
		return build(-1, message);
	}

	public static Result ok() {
		return build(0, "请求成功");
	}

	public static Result ok(String message) {
		return build(0, message);
	}

	public static Result ok(Object data) {
		return build(0, "请求成功", data);
	}

	public static Result okData(Object data) {
		return build(0, "请求成功", data);
	}

	public static Result ok(Object data, long total) {
		return new Result(0, "请求成功", data, total);
	}

	public static Result build(int code, String message) {
		return build(code, message, null);
	}

	public static Result build(int code, String message, Object data) {
		return new Result(code, message, data, 0);
	}

}
