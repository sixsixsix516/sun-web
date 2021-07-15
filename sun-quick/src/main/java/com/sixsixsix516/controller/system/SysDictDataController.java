package com.sixsixsix516.controller.system;

import com.sixsixsix516.vo.Result;
import com.sixsixsix516.framework.service.SysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 数据字典信息
 *
 * @author SUN
 */
@RestController
@RequestMapping("/system/dict/data")
public class SysDictDataController {

	/**
	 * 根据字典类型查询字典数据信息
	 */
	@GetMapping(value = "/type/{dictType}")
	public Result dictType(@PathVariable String dictType) {
		return Result.ok(dictTypeService.selectDictDataByType(dictType));
	}

	@Autowired
	private SysDictTypeService dictTypeService;
}
