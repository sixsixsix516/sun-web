package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.manager.service.SysDictTypeService;
import com.sixsixsix516.common.vo.Result;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class SysDictDataController {

	/**
	 * 根据字典类型查询字典数据信息
	 */
	@GetMapping(value = "/type/{dictType}")
	public Result dictType(@PathVariable String dictType) {
		return Result.ok(dictTypeService.selectDictDataByType(dictType));
	}

	private final SysDictTypeService dictTypeService;
}
