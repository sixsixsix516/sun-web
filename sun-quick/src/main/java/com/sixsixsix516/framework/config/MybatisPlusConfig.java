package com.sixsixsix516.framework.config;


import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;


/**
 * @author sunlin
 */
@Configuration
public class MybatisPlusConfig {


    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }


    /**
     * sql性能分析插件，输出sql语句及所需时间
     */
    @Bean
    public PerformanceInterceptor performanceInterceptor() {
        return new PerformanceInterceptor();
    }

    /**
     * 自动赋值配置
     */
    @Bean
    public MetaObjectHandler metaObjectHandlerConfig(){
        return new MetaObjectHandler() {
            @Override
            public void insertFill(MetaObject metaObject) {
                Object createTime = getFieldValByName("createTime", metaObject);
                Object updateTime = getFieldValByName("updateTime", metaObject);
                if (createTime == null) {
                    setFieldValByName("createTime", LocalDateTime.now(), metaObject);
                } else {
                    // 创建时间是自动填充的,不能有值
                    setFieldValByName("createTime", null, metaObject);
                }
                if (updateTime == null) {
                    setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
                }
            }
            @Override
            public void updateFill(MetaObject metaObject) {
                setFieldValByName("updateTime",  LocalDateTime.now(), metaObject);
            }
        };
    }
}


