package com.sixsixsix516.manager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动程序
 *
 * @author SUN
 */
@MapperScan("com.sixsixsix516.common.mapper")
@SpringBootApplication(scanBasePackages = {"com.sixsixsix516.manager", "com.sixsixsix516.common"})
public class SunApp {

    public static void main(String[] args) {
        SpringApplication.run(SunApp.class, args);
    }

}
