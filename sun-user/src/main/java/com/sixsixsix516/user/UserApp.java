package com.sixsixsix516.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author SUN
 * @date 23/04/2022
 */
@MapperScan("com.sixsixsix516.common.mapper")
@SpringBootApplication(scanBasePackages = {"com.sixsixsix516.user", "com.sixsixsix516.common"})
public class UserApp {

    public static void main(String[] args) {
        SpringApplication.run(UserApp.class, args);
    }

}
