package com.sixsixsix516.manager.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.common.core.utils.DictUtils;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.mapper.system.SysDictDataMapper;
import com.sixsixsix516.common.mapper.system.SysDictTypeMapper;
import com.sixsixsix516.common.model.system.SysDictData;
import com.sixsixsix516.common.model.system.SysDictType;
import com.sixsixsix516.common.vo.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * 字典 业务层处理
 *
 * @author SUN
 */
@Service
@RequiredArgsConstructor
public class SysDictTypeService {

	/**
	 * 项目启动时，初始化字典到缓存
	 */
	@PostConstruct
	public void init() {
		List<SysDictType> dictTypeList = dictTypeMapper.selectList(null);
		for (SysDictType dictType : dictTypeList) {
			List<SysDictData> dictDataList = dictDataMapper.selectList(new QueryWrapper<SysDictData>().lambda().eq(SysDictData::getDictType, dictType.getDictType()));
			DictUtils.setDictCache(dictType.getDictType(), dictDataList);
		}
	}

	public Result<List<SysDictType>> list(SysDictType dictType, PageInfo pageInfo) {
		IPage<SysDictType> sysDictTypePage = dictTypeMapper.selectDictTypeList(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()), dictType);
		return Result.ok(sysDictTypePage.getRecords(), sysDictTypePage.getTotal());
	}


	/**
	 * 根据所有字典类型
	 *
	 * @return 字典类型集合信息
	 */
	public Result<List<SysDictType>> selectDictTypeAll() {
		return Result.ok(dictTypeMapper.selectList(null));
	}

	/**
	 * 根据字典类型查询字典数据
	 *
	 * @param dictType 字典类型
	 * @return 字典数据集合信息
	 */
	public Result<List<SysDictData>> selectDictDataByType(String dictType) {
		List<SysDictData> dictDataList = DictUtils.getDictCache(dictType);
		if (StringUtils.isNotNull(dictDataList)) {
			return Result.ok(dictDataList);
		}
		dictDataList = dictDataMapper.selectList(new QueryWrapper<SysDictData>().lambda()
				.eq(SysDictData::getStatus, 0).eq(SysDictData::getDictType, dictType).orderByAsc(SysDictData::getDictSort));
		if (StringUtils.isNotNull(dictDataList)) {
			DictUtils.setDictCache(dictType, dictDataList);
			return Result.ok(dictDataList);
		}
		return Result.ok();
	}

	/**
	 * 清空缓存数据
	 */
	public Result<Void> clearCache() {
		DictUtils.clearDictCache();
		return Result.ok();
	}

	private final SysDictTypeMapper dictTypeMapper;
	private final SysDictDataMapper dictDataMapper;
}
