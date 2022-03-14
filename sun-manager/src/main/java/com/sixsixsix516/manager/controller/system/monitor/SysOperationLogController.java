package com.sixsixsix516.manager.controller.system.monitor;

import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.model.system.SysOperationLog;
import com.sixsixsix516.manager.service.SysOperationLogService;
import com.sixsixsix516.common.vo.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.enums.BusinessType;

import java.util.List;

/**
 * 操作日志记录
 *
 * @author SUN
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/monitor/operationLog")
public class SysOperationLogController {

    @PreAuthorize("@ss.hasPermi('monitor:operlog:list')")
    @GetMapping("/list")
    public Result<List<SysOperationLog>> list(SysOperationLog sysOperationLog, PageInfo pageInfo) {
        return sysOperationLogService.list(sysOperationLog, pageInfo);
    }

    @PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
    @DeleteMapping("/{ids}")
    public Result<Void> remove(@PathVariable Long[] ids) {
        return sysOperationLogService.deleteOperationLogByIds(ids);
    }

    @Log(title = "操作日志", businessType = BusinessType.CLEAN)
    @PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
    @DeleteMapping("/clean")
    public Result<Void> clean() {
        return sysOperationLogService.cleanOperationLog();
    }

    private final SysOperationLogService sysOperationLogService;
}
