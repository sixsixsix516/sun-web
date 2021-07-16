package com.sixsixsix516.framework.generate.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sixsixsix516.framework.generate.domain.GenTable;
import org.apache.ibatis.annotations.Param;
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
	IPage<GenTable> listTable(IPage<GenTable> page ,@Param("name") String name);


}
