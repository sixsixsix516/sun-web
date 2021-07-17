package com.sixsixsix516.framework.generate;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.framework.constant.Constants;
import com.sixsixsix516.framework.generate.domain.GenTable;
import com.sixsixsix516.framework.generate.domain.GenTableColumn;
import com.sixsixsix516.framework.generate.mapper.GenTableColumnMapper;
import com.sixsixsix516.framework.generate.mapper.GenTableMapper;
import com.sixsixsix516.framework.generate.util.GenUtils;
import com.sixsixsix516.framework.generate.util.VelocityInitializer;
import com.sixsixsix516.framework.generate.util.VelocityUtils;
import com.sixsixsix516.framework.utils.StringUtils;
import lombok.SneakyThrows;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 业务 服务层实现
 *
 * @author SUN
 */
@RestController
public class GenTableService {

    @Autowired
    private GenTableMapper genTableMapper;
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;

    @GetMapping("/generateCode")
    public ResponseEntity<byte[]> generateCode(String tables) {
        importTableSave(tables);
        return generatorCode(tables);
    }

    /**
     * 1. 导入表
     */
    private void importTableSave(String tables) {
        String[] tableNames = tables.split(",");
        for (String tableName : tableNames) {
            GenTable table = genTableMapper.selectOne(new QueryWrapper<GenTable>().lambda().eq(GenTable::getTableName, tableName));
            if (table == null) {
                List<GenTable> genTables = genTableMapper.listTable(new Page<>(1, 1), tableName).getRecords();
                importGenTable(genTables);
            }
        }
    }


    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     */
    private void importGenTable(List<GenTable> tableList) {
        for (GenTable table : tableList) {
            String tableName = table.getTableName();
            GenUtils.initTable(table);
            int row = genTableMapper.insert(table);
            if (row > 0) {
                // 保存列信息
                List<GenTableColumn> genTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
                for (GenTableColumn column : genTableColumns) {
                    GenUtils.initColumnField(column, table);
                    genTableColumnMapper.insert(column);
                }
            }
        }
    }

    @SneakyThrows
    private ResponseEntity<byte[]> generatorCode(String tableName) {
        // 查询表信息
        GenTable table = genTableMapper.selectOne(new QueryWrapper<GenTable>().lambda().eq(GenTable::getTableName, tableName));
        // 查询列信息
        List<GenTableColumn> columns = genTableColumnMapper.selectList(new QueryWrapper<GenTableColumn>().lambda().eq(GenTableColumn::getTableId, table.getTableId()));
        table.setColumns(columns);
        setPkColumn(table, columns);
        VelocityInitializer.initVelocity();
        VelocityContext context = VelocityUtils.prepareContext(table);

        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
             ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream)) {
            List<String> templates = VelocityUtils.getTemplateList();
            for (String template : templates) {
                // 渲染模板
                StringWriter sw = new StringWriter();
                Template tpl = Velocity.getTemplate(template, Constants.UTF8);
                tpl.merge(context, sw);

                // 创建ZIP实体，并添加进压缩包
                zipOutputStream.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
                // 读取待压缩的文件并写进压缩包里
                zipOutputStream.write(sw.toString().getBytes());
            }

            zipOutputStream.finish();

            HttpHeaders headers = new HttpHeaders();
            headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Content-Disposition", "attachment; filename=\"" + "code.zip" + "\"; filename*=utf-8''" + "code.zip");
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");
            headers.add("Content-Type", "application/zip");
            return ResponseEntity.ok().headers(headers).body(byteArrayOutputStream.toByteArray());
        }
    }


    /**
     * 设置主键列信息
     */
    private void setPkColumn(GenTable table, List<GenTableColumn> columns) {
        for (GenTableColumn column : columns) {
            if (column.isPk()) {
                table.setPkColumn(column);
                break;
            }
        }
        if (StringUtils.isNull(table.getPkColumn())) {
            table.setPkColumn(columns.get(0));
        }
    }

}
