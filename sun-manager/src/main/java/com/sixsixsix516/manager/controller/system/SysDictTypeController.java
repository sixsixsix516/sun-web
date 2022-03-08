package com.sixsixsix516.manager.controller.system;

import java.util.List;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.mapper.system.SysDictTypeMapper;

import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.service.SysDictTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.model.system.SysDictType;
import com.sixsixsix516.common.core.enums.BusinessType;

/**
 * 数据字典信息
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/dict/type")
public class SysDictTypeController {

	@Autowired
	private SysDictTypeService dictTypeService;

	@PreAuthorize("@ss.hasPermi('system:dict:list')")
	@GetMapping("/list")
	public Result list(SysDictType dictType, PageInfo pageInfo) {
		IPage<SysDictType> sysDictTypePage = dictTypeMapper.selectDictTypeList(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()), dictType);
		return Result.ok(sysDictTypePage.getRecords(), sysDictTypePage.getTotal());
	}

	/**
	 * 清空缓存
	 */
	@PreAuthorize("@ss.hasPermi('system:dict:remove')")
	@Log(title = "字典类型", businessType = BusinessType.CLEAN)
	@DeleteMapping("/clearCache")
	public Result clearCache() {
		dictTypeService.clearCache();
		return Result.ok();
	}

	/**
	 * 获取字典选择框列表
	 */
	@GetMapping("/optionselect")
	public Result optionselect() {
		List<SysDictType> dictTypes = dictTypeService.selectDictTypeAll();
		return Result.ok(dictTypes);
	}

	private final SysDictTypeMapper dictTypeMapper;
}
