package com.sixsixsix516.framework.generate.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sixsixsix516.framework.generate.domain.GenTable;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 业务 数据层
 *
 * @author SUN
 */
public interface GenTableMapper extends BaseMapper<GenTable> {


	/**
	 * 查询表名称业务信息
	 *
	 * @param tableName 表名称
	 * @return 业务信息
	 */
	GenTable selectGenTableByName(String tableName);

	/**
	 * 新增业务
	 *
	 * @param genTable 业务信息
	 * @return 结果
	 */
	int insertGenTable(GenTable genTable);


	/**
	 * 查询据库列表
	 */
	@Select("select table_name, table_comment, create_time, update_time from information_schema.tables" +
			"  where table_name NOT LIKE 'qrtz_%' and table_name NOT LIKE 'gen_%' and table_schema = (select database())" +
			"and table_name =  #{name}")
	List<GenTable> selectDbTableListByNames(String name);


}
