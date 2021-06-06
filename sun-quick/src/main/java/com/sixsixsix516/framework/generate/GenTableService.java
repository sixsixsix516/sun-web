package com.sixsixsix516.framework.generate;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sixsixsix516.framework.constant.Constants;
import com.sixsixsix516.framework.exception.CustomException;
import com.sixsixsix516.framework.generate.domain.GenTable;
import com.sixsixsix516.framework.generate.domain.GenTableColumn;
import com.sixsixsix516.framework.generate.mapper.GenTableColumnMapper;
import com.sixsixsix516.framework.generate.mapper.GenTableMapper;
import com.sixsixsix516.framework.generate.util.GenUtils;
import com.sixsixsix516.framework.generate.util.VelocityInitializer;
import com.sixsixsix516.framework.generate.util.VelocityUtils;
import com.sixsixsix516.framework.utils.SecurityUtils;
import com.sixsixsix516.framework.utils.StringUtils;
import com.sixsixsix516.framework.utils.file.FileUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

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
	public void generateCode(String tableName) {
		importTableSave(tableName);
		generatorCode(tableName);
	}

	/**
	 * 1. 导入表
	 */
	public void importTableSave(String tableName) {
		List<GenTable> genTables = genTableMapper.selectDbTableListByNames(tableName);
		importGenTable(genTables);
	}


	/**
	 * 导入表结构
	 *
	 * @param tableList 导入表列表
	 */
	public void importGenTable(List<GenTable> tableList) {
		try {
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
		} catch (Exception e) {
			throw new CustomException("导入失败：" + e.getMessage());
		}
	}


	private void generatorCode(String tableName) {
		// 查询表信息
		GenTable table = genTableMapper.selectOne(new QueryWrapper<GenTable>().lambda().eq(GenTable::getTableName, tableName));
		// 查询列信息
		List<GenTableColumn> columns = genTableColumnMapper.selectList(new QueryWrapper<GenTableColumn>().lambda().eq(GenTableColumn::getTableId, table.getTableId()));
		table.setColumns(columns);
		setPkColumn(table, columns);
		VelocityInitializer.initVelocity();
		VelocityContext context = VelocityUtils.prepareContext(table);

		// 获取模板列表
		List<String> templates = VelocityUtils.getTemplateList();
		for (String template : templates) {
			// 渲染模板
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, Constants.UTF8);
			tpl.merge(context, sw);
			try {
				FileUtils.writeStringToFile(new File(getGenPath(table,template)), sw.toString(), "utf-8");
			} catch (IOException e) {
				e.printStackTrace();
				throw new CustomException("渲染模板失败，表名：" + table.getTableName());
			}
		}
	}

	/**
	 * 设置主键列信息
	 *
	 * @param table   业务表信息
	 * @param columns 业务字段列表
	 */
	public void setPkColumn(GenTable table, List<GenTableColumn> columns) {
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

	public static String getGenPath(GenTable table, String template) {
		String genPath = table.getGenPath();
		if (StringUtils.equals(genPath, "/")) {
//			return System.getProperty("user.dir") + File.separator + "src" + File.separator + VelocityUtils.getFileName(template, table);
			return "E:" + File.separator + "src" + File.separator + VelocityUtils.getFileName(template, table);
		}
		return genPath + File.separator + VelocityUtils.getFileName(template, table);
	}


}
