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
	 * 查询据库列表
	 */
	IPage<GenTable> listTable(IPage<GenTable> page ,@Param("name") String name);


}
