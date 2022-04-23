package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.model.system.SysDictType;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.service.SysDictTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 数据字典信息
 * @author SUN
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/dict/type")
public class SysDictTypeController {


    @PreAuthorize("@ss.hasPermissions('system:dict:list')")
    @GetMapping("/list")
    public Result<List<SysDictType>> list(SysDictType dictType, PageInfo pageInfo) {
        return dictTypeService.list(dictType, pageInfo);
    }

    /**
     * 清空缓存
     */
    @PreAuthorize("@ss.hasPermissions('system:dict:remove')")
    @Log(title = "字典类型", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clearCache")
    public Result<Void> clearCache() {
        return dictTypeService.clearCache();
    }

    /**
     * 获取字典选择框列表
     */
    @GetMapping("/optionSelect")
    public Result<List<SysDictType>> optionSelect() {
        return dictTypeService.selectDictTypeAll();
    }

    private final SysDictTypeService dictTypeService;

}
