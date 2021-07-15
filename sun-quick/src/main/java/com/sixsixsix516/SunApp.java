package com.sixsixsix516;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动程序
 *
 * @author SUN
 */
@MapperScan({"com.sixsixsix516.mapper","com.sixsixsix516.framework.generate.mapper"})
@SpringBootApplication
public class SunApp {

    public static void main(String[] args) {
        SpringApplication.run(SunApp.class, args);
    }

}
