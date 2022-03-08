package com.sixsixsix516.manager.core.exception;

import com.sixsixsix516.common.vo.Result;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author SUN
 * @date 2021/10/9
 */
@RestControllerAdvice
public class MangerExceptionHandler {

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


}
