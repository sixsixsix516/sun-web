package com.sixsixsix516.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import com.sixsixsix516.model.domain.entity.SysDictData;

/**
 * 字典表 数据层
 *
 * @author ruoyi
 */
public interface SysDictDataMapper extends BaseMapper<SysDictData> {


	/**
	 * 根据条件分页查询字典数据
	 */
	List<SysDictData> selectDictDataList(SysDictData dictData);
}
