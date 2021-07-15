package com.sixsixsix516.framework.generate.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sixsixsix516.framework.generate.domain.GenTableColumn;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 业务字段 数据层
 *
 * @author SUN
 */
public interface GenTableColumnMapper extends BaseMapper<GenTableColumn> {
	/**
	 * 根据表名称查询列信息
	 *
	 * @param tableName 表名称
	 * @return 列信息
	 */
	@Select("select column_name, (case when (is_nullable = 'no'  && column_key != 'PRI') then '1' else null end) as is_required, (case when column_key = 'PRI' then '1' else '0' end) as is_pk, ordinal_position as sort, column_comment, (case when extra = 'auto_increment' then '1' else '0' end) as is_increment, column_type" +
			"  from information_schema.columns where table_schema = (select database()) and table_name = (#{tableName})" +
			"  order by ordinal_position")
	public List<GenTableColumn> selectDbTableColumnsByName(String tableName);

	/**
	 * 查询业务字段列表
	 *
	 * @param tableId 业务字段编号
	 * @return 业务字段集合
	 */
	public List<GenTableColumn> selectGenTableColumnListByTableId(Long tableId);

	/**
	 * 新增业务字段
	 *
	 * @param genTableColumn 业务字段信息
	 * @return 结果
	 */
	public int insertGenTableColumn(GenTableColumn genTableColumn);

	/**
	 * 修改业务字段
	 *
	 * @param genTableColumn 业务字段信息
	 * @return 结果
	 */
	public int updateGenTableColumn(GenTableColumn genTableColumn);

	/**
	 * 批量删除业务字段
	 *
	 * @param ids 需要删除的数据ID
	 * @return 结果
	 */
	public int deleteGenTableColumnByIds(Long[] ids);
}
