package com.sixsixsix516.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sixsixsix516.model.system.SysDictType;

/**
 * 字典表 数据层
 *
 * @author SUN
 */
public interface SysDictTypeMapper extends BaseMapper<SysDictType> {
	/**
	 * 根据条件分页查询字典类型
	 *
	 * @param dictType 字典类型信息
	 * @return 字典类型集合信息
	 */
	IPage<SysDictType> selectDictTypeList(IPage<SysDictType> page, SysDictType dictType);

}
