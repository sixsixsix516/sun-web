package com.sixsixsix516.common.core.aspectj;

import com.sixsixsix516.common.core.exception.CustomException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;

import java.util.Arrays;
import java.util.Objects;

/**
 * 参数校验切面
 *
 * @author sun 2020/5/21 17:47
 */
@Aspect
@Component
public class ParamCheckAop {


    /**
     * 拦截controller层任意类任意方法的 参数列表中 带有 BindingResult 类的方法
     */
    @Pointcut("execution(* com.sixsixsix516.*.controller..*.*(..,org.springframework.validation.BindingResult,..))")
    public void pointCut() {
    }

    @Before("pointCut()")
    public void paramCheck(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        Arrays.stream(args).forEach(arg -> {
            if (arg instanceof BindingResult) {
                BindingResult result = (BindingResult) arg;
                if (result.hasErrors()) {
                    throw new CustomException(Objects.requireNonNull(result.getFieldError()).getDefaultMessage());
                }
            }
        });
    }
}
