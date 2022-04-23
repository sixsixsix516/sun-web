package com.sixsixsix516.common.core.aspectj;

import com.sixsixsix516.common.core.annotation.Authentication;
import com.sixsixsix516.common.core.exception.CustomException;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.utils.TokenUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author sun 2020/5/20 15:46
 */
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class AuthenticationAop {

    /**
     * 拦截类上或方法上有{@Authentication}注解的方法
     */
    @Pointcut("@annotation(com.sixsixsix516.common.core.annotation.Authentication) || @within(com.sixsixsix516.common.core.annotation.Authentication)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        // 1.获取token
        String token = request.getHeader("token");
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Authentication authentication = signature.getMethod().getAnnotation(Authentication.class);
        if (authentication == null || authentication.forceLogin()) {
            // 2.校验token
            if (StringUtils.isEmpty(token)) {
                fail();
            }
        }

        if (StringUtils.isNotBlank(token)) {
            // 3.取出token里携带的数据
            Long userIdFromToken = TokenUtil.getUserIdFromToken(token);
            Integer userTypeFromToken = TokenUtil.getUserTypeFromToken(token);

            request.setAttribute(TokenUtil.USER_ID_KEY, userIdFromToken);
            request.setAttribute(TokenUtil.USER_TYPE_KEY, userTypeFromToken);
        }
        return pjp.proceed();
    }

    /**
     * 验证失败，抛出异常
     */
    private void fail() {
        throw new CustomException("您还未登陆！", 401);
    }


    private final HttpServletRequest request;
}
