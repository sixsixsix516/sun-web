package com.sixsixsix516.common.core.annotation;

import com.sixsixsix516.common.core.aspectj.AuthenticationAop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 认证注解
 * 可作用与类，方法
 * - 当修饰在类上时，代表此类的所有方法都需要认证
 * - 当修饰在方法时，代表仅此方法做认证
 * <p>
 * 此注解会被{@link AuthenticationAop} 拦截处理
 *
 * @author sun 2020/5/20 15:46
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Authentication {

    /**
     * 是否强制登录
     * true是 false否
     */
    boolean forceLogin() default true;

}
