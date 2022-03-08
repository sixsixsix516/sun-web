package com.sixsixsix516.common.core.aspectj;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 拦截所有接口，记录下访问接口，参数，返回值
 *
 * @author sun 2020/5/21 17:32
 */
@Slf4j
@Aspect
@Component
public class SystemLogAop {

    @Around("execution(* com.sixsixsix516.*.controller..*.*(..))")
    public Object saveSysLog(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        //请求的参数
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        log.info("---------------------------------------------------------------");
        if (attributes != null) {
            String url = attributes.getRequest().getRequestURL().toString();
            log.info("请求路径: {}", url);
        }
        log.info("请求参数: {}", proceedingJoinPoint.getArgs());
        Object result = proceedingJoinPoint.proceed();
        log.info("返回值: {}", JSON.toJSONString(result));
        return result;
    }
}
