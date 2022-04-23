package com.sixsixsix516.common.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author SUN
 * @date 2021/11/5
 */
@Configuration
public class EnvUtil {

    /**
     * 当前程序是否是线上环境
     */
    public static boolean isProd;

    /**
     * 当前程序是否是测试环境
     */
    public static boolean isTest;


    @Value("${spring.profiles.active}")
    public void setProfile(String profile) {
        switch (profile) {
            case "prod":
                isProd = true;
                break;
            case "test":
                isTest = true;
                break;
            default:
        }
    }
}
