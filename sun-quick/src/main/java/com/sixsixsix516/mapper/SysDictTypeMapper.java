package com.sixsixsix516.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Mapper;
import com.sixsixsix516.model.domain.entity.SysDictType;

/**
 * 字典表 数据层
 *
 * @author ruoyi
 */
public interface SysDictTypeMapper extends BaseMapper<SysDictType> {
	/**
	 * 根据条件分页查询字典类型
	 *
	 * @param dictType 字典类型信息
	 * @return 字典类型集合信息
	 */
	IPage<SysDictType> selectDictTypeList(IPage page, SysDictType dictType);

}
