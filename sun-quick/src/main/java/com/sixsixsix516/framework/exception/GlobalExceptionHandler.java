package com.sixsixsix516.framework.exception;

import com.sixsixsix516.vo.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;
import com.sixsixsix516.framework.utils.StringUtils;

/**
 * 全局异常处理器
 *
 * @author SUN
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
	private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	/**
	 * 基础异常
	 */
	@ExceptionHandler(BaseException.class)
	public Result baseException(BaseException e) {
		e.printStackTrace();
		return Result.fail(e.getMessage());
	}

	/**
	 * 业务异常
	 */
	@ExceptionHandler(CustomException.class)
	public Result businessException(CustomException e) {
		e.printStackTrace();
		if (StringUtils.isNull(e.getCode())) {
			return Result.fail(e.getMessage());
		}
		return Result.fail(e.getMessage());
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	public Result handlerNoFoundException(Exception e) {
		e.printStackTrace();
		return Result.fail("路径不存在，请检查路径是否正确");
	}

	@ExceptionHandler(AccessDeniedException.class)
	public Result handleAuthorizationException(AccessDeniedException e) {
		e.printStackTrace();
		return Result.fail("没有权限，请联系管理员授权");
	}

	@ExceptionHandler(AccountExpiredException.class)
	public Result handleAccountExpiredException(AccountExpiredException e) {
		e.printStackTrace();
		return Result.fail(e.getMessage());
	}

	@ExceptionHandler(UsernameNotFoundException.class)
	public Result handleUsernameNotFoundException(UsernameNotFoundException e) {
		e.printStackTrace();
		return Result.fail(e.getMessage());
	}

	@ExceptionHandler(Exception.class)
	public Result handleException(Exception e) {
		e.printStackTrace();
		return Result.fail(e.getMessage());
	}

	/**
	 * 自定义验证异常
	 */
	@ExceptionHandler(BindException.class)
	public Result validatedBindException(BindException e) {
		e.printStackTrace();
		String message = e.getAllErrors().get(0).getDefaultMessage();
		return Result.fail(message);
	}

	/**
	 * 自定义验证异常
	 */
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public Object validExceptionHandler(MethodArgumentNotValidException e) {
		e.printStackTrace();
		String message = e.getBindingResult().getFieldError().getDefaultMessage();
		return Result.fail(message);
	}

	/**
	 * 演示模式异常
	 */
	@ExceptionHandler(DemoModeException.class)
	public Result demoModeException(DemoModeException e) {
		return Result.fail("演示模式，不允许操作");
	}
}
