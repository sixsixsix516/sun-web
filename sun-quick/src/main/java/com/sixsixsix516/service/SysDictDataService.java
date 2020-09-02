package com.sixsixsix516.service;

import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sixsixsix516.model.domain.entity.SysDictData;
import com.sixsixsix516.utils.DictUtils;
import com.sixsixsix516.mapper.SysDictDataMapper;

/**
 * 字典 业务层处理
 *
 * @author ruoyi
 */
@Service
public class SysDictDataService {


	/**
	 * 根据条件分页查询字典数据
	 *
	 * @param dictData 字典数据信息
	 * @return 字典数据集合信息
	 */
	public List<SysDictData> selectDictDataList(SysDictData dictData) {
		return dictDataMapper.selectDictDataList(dictData);
	}

	/**
	 * 根据字典类型和字典键值查询字典数据信息
	 */
	public String selectDictLabel(String dictType, String dictValue) {
		return dictDataMapper.selectOne(new QueryWrapper<SysDictData>().lambda().eq(SysDictData::getDictType, dictType).eq(SysDictData::getDictValue, dictValue)).getDictLabel();
	}

	/**
	 * 根据字典数据ID查询信息
	 *
	 * @param dictCode 字典数据ID
	 * @return 字典数据
	 */
	public SysDictData selectDictDataById(Long dictCode) {
		return dictDataMapper.selectById(dictCode);
	}

	/**
	 * 批量删除字典数据信息
	 *
	 * @param dictCodes 需要删除的字典数据ID
	 * @return 结果
	 */
	public int deleteDictDataByIds(Long[] dictCodes) {
		int row = dictDataMapper.deleteBatchIds(Arrays.asList(dictCodes));
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}

	/**
	 * 新增保存字典数据信息
	 *
	 * @param dictData 字典数据信息
	 * @return 结果
	 */
	public int insertDictData(SysDictData dictData) {
		int row = dictDataMapper.insert(dictData);
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}

	/**
	 * 修改保存字典数据信息
	 *
	 * @param dictData 字典数据信息
	 * @return 结果
	 */
	public int updateDictData(SysDictData dictData) {
		int row = dictDataMapper.updateById(dictData);
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}


	@Autowired
	private SysDictDataMapper dictDataMapper;
}
