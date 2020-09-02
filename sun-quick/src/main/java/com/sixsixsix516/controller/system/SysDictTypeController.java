package com.sixsixsix516.controller.system;

import java.util.List;

import com.sixsixsix516.model.vo.Result;
import com.sixsixsix516.service.SysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.annotation.Log;
import com.sixsixsix516.constant.UserConstants;
import com.sixsixsix516.core.controller.BaseController;
import com.sixsixsix516.model.domain.entity.SysDictType;
import com.sixsixsix516.core.page.TableDataInfo;
import com.sixsixsix516.enums.BusinessType;
import com.sixsixsix516.utils.SecurityUtils;
import com.sixsixsix516.utils.poi.ExcelUtil;

/**
 * 数据字典信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/dict/type")
public class SysDictTypeController extends BaseController {

	@Autowired
	private SysDictTypeService dictTypeService;

	@PreAuthorize("@ss.hasPermi('system:dict:list')")
	@GetMapping("/list")
	public TableDataInfo list(SysDictType dictType) {
		startPage();
		List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
		return getDataTable(list);
	}


	/**
	 * 清空缓存
	 */
	@PreAuthorize("@ss.hasPermi('system:dict:remove')")
	@Log(title = "字典类型", businessType = BusinessType.CLEAN)
	@DeleteMapping("/clearCache")
	public Result clearCache() {
		dictTypeService.clearCache();
		return Result.success();
	}

	/**
	 * 获取字典选择框列表
	 */
	@GetMapping("/optionselect")
	public Result optionselect() {
		List<SysDictType> dictTypes = dictTypeService.selectDictTypeAll();
		return Result.success(dictTypes);
	}
}
