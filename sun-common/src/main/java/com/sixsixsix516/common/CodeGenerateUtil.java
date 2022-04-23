package com.sixsixsix516.common;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.IColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 代码生成工具类
 *
 * @author SUN
 * @date 2021/7/31 15:32
 */
public class CodeGenerateUtil {

    public static void main(String[] args) {
        // 表名
        String[] tableNames = new String[]{
                "order_margin",
        };
        // 代码生成地址
        String outputDir = "D:\\test/code/src/main/java";
        // 数据库地址
        String url = "jdbc:mysql:///pz?useSSL=false&characterEncoding=utf-8&allowMultiQueries=true&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai&tinyInt1isBit=false";
        // 用户名
        String userName = "root";
        // 密码
        String password = "1111";
        // 包名
        String parentPackage = "com.sixsixsix516.common";
        // 作者名称
        String author = "SUN";
        generate(author, outputDir, tableNames, url, userName, password, parentPackage);
    }

    /**
     * @param outputDir     生成地址
     * @param tableNames    表名
     * @param url           数据库地址
     * @param userName      用户名
     * @param password      密码
     * @param parentPackage 父包路径
     */
    public static void generate(String author, String outputDir, String[] tableNames, String url, String userName, String password, String parentPackage) {
        // 删除之前生成的数据
        deleteDir(outputDir);

        // ===============  全局配置  ==================
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir(outputDir)
                // 设置作者名字
                .setAuthor(author)
                // 每次生成是否覆盖文件
                .setFileOverride(true)
                // 主键策略: 数据库自增
                .setIdType(IdType.AUTO)
                .setServiceName("%sService")
                .setOpen(true);

        // =================  数据源配置   ===============
        DataSourceConfig dsc = new DataSourceConfig()
                .setDbType(DbType.MYSQL)
                .setDriverName("com.mysql.jdbc.Driver")
                .setUrl(url)
                .setUsername(userName)
                .setPassword(password)
                .setTypeConvert(new MySqlTypeConvertCustom());

        // =================  包配置  ===================
        PackageConfig pc = new PackageConfig()
                .setParent(parentPackage)
                .setMapper("mapper")
                .setEntity("model")
                .setService("service")
                .setController("controller");

        // ==================  自定义配置  =================
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
            }
        };

        List<FileOutConfig> focList = new ArrayList<>(3);
        // 前端代码生成
        focList.add(new FileOutConfig("/templates/vue/api.js.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                String entityName = tableInfo.getEntityName();
                // 首字母小写
                entityName = entityName.substring(0, 1).toLowerCase() + entityName.substring(1);
                return outputDir + "/前端/" + entityName + ".js";
            }
        });
        focList.add(new FileOutConfig("/templates/vue/list.vue.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return outputDir + "/前端/list.vue";
            }
        });
        focList.add(new FileOutConfig("/templates/vue/save.vue.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return outputDir + "/前端/save.vue";
            }
        });
        // 后端代码生成
        focList.add(new FileOutConfig("/templates/java/searchRequest.java.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return outputDir + File.separator + tableInfo.getEntityName() + "SearchRequest.java";
            }
        });

        cfg.setFileOutConfigList(focList);


        // ===================  策略配置  ==================
        StrategyConfig strategy = new StrategyConfig()
                // 表名,字段名 下划线变驼峰模式
                .setNaming(NamingStrategy.underline_to_camel)
                .setColumnNaming(NamingStrategy.underline_to_camel)
                // 需要生成的表名
                .setInclude(tableNames)
                .setControllerMappingHyphenStyle(true);

        // ==================  自定义模板配置 ======================
        TemplateConfig tc = new TemplateConfig()
                .setEntity("/templates/java/entity.java")
                .setMapper("/templates/java/mapper.java")
                .setController("/templates/java/controller.java")
                .setService("/templates/java/service.java")
                .setXml(null)
                .setServiceImpl(null)
                .setEntityKt(null);

        // ====================  生成配置  ===================
        AutoGenerator mpg = new AutoGenerator()
                .setCfg(cfg)
                .setTemplate(tc)
                .setGlobalConfig(gc)
                .setDataSource(dsc)
                .setPackageInfo(pc)
                .setStrategy(strategy)
                // 选择 freemarker引擎，注意 pom 依赖必须有！
                .setTemplateEngine(new FreemarkerTemplateEngine());

        mpg.execute();
    }

    /**
     * 迭代删除文件夹
     *
     * @param dirPath 文件夹路径
     */
    public static void deleteDir(String dirPath) {
        File file = new File(dirPath);
        if (file.isFile()) {
            file.delete();
        } else {
            File[] files = file.listFiles();
            if (files == null) {
                file.delete();
            } else {
                for (File value : files) {
                    deleteDir(value.getAbsolutePath());
                }
                file.delete();
            }
        }
    }


    /**
     * 自定义类型转换
     */
    static class MySqlTypeConvertCustom extends MySqlTypeConvert implements ITypeConvert {
        @Override
        public IColumnType processTypeConvert(GlobalConfig globalConfig, String fieldType) {
            String t = fieldType.toLowerCase();
            if (t.contains("tinyint(1)")) {
                return DbColumnType.INTEGER;
            }
            return super.processTypeConvert(globalConfig, fieldType);
        }
    }

}
