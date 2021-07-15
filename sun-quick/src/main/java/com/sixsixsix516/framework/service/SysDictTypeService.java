package com.sixsixsix516.framework.service;

import java.util.List;
import javax.annotation.PostConstruct;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sixsixsix516.model.system.SysDictData;
import com.sixsixsix516.model.system.SysDictType;
import com.sixsixsix516.framework.utils.DictUtils;
import com.sixsixsix516.framework.utils.StringUtils;
import com.sixsixsix516.mapper.system.SysDictDataMapper;
import com.sixsixsix516.mapper.system.SysDictTypeMapper;

/**
 * 字典 业务层处理
 *
 * @author SUN
 */
@Service
public class SysDictTypeService {

	/**
	 * 项目启动时，初始化字典到缓存
	 */
	@PostConstruct
	public void init() {
		List<SysDictType> dictTypeList = dictTypeMapper.selectList(null);
		for (SysDictType dictType : dictTypeList) {
			List<SysDictData> dictDatas = dictDataMapper.selectList(new QueryWrapper<SysDictData>().lambda().eq(SysDictData::getDictType, dictType.getDictType()));
			DictUtils.setDictCache(dictType.getDictType(), dictDatas);
		}
	}

	/**
	 * 根据所有字典类型
	 *
	 * @return 字典类型集合信息
	 */
	public List<SysDictType> selectDictTypeAll() {
		return dictTypeMapper.selectList(null);
	}

	/**
	 * 根据字典类型查询字典数据
	 *
	 * @param dictType 字典类型
	 * @return 字典数据集合信息
	 */
	public List<SysDictData> selectDictDataByType(String dictType) {
		List<SysDictData> dictDatas = DictUtils.getDictCache(dictType);
		if (StringUtils.isNotNull(dictDatas)) {
			return dictDatas;
		}
		dictDatas = dictDataMapper.selectList(new QueryWrapper<SysDictData>().lambda()
				.eq(SysDictData::getStatus, 0).eq(SysDictData::getDictType, dictType).orderByAsc(SysDictData::getDictSort));
		if (StringUtils.isNotNull(dictDatas)) {
			DictUtils.setDictCache(dictType, dictDatas);
			return dictDatas;
		}
		return null;
	}

	/**
	 * 清空缓存数据
	 */
	public void clearCache() {
		DictUtils.clearDictCache();
	}

	@Autowired
	private SysDictTypeMapper dictTypeMapper;
	@Autowired
	private SysDictDataMapper dictDataMapper;
}
