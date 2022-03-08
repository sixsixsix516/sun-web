package com.sixsixsix516.manager.controller.system.monitor;

import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.service.SysLoginInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.common.model.system.SysLoginInfo;

import java.util.List;

/**
 * 系统访问记录
 *
 * @author SUN
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/monitor/loginInfo")
public class SysLoginInfoController {

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:list')")
    @GetMapping("/list")
    public Result<List<SysLoginInfo>> list(SysLoginInfo loginInfo, PageInfo pageInfo) {
        return sysLoginInfoService.list(loginInfo, pageInfo);
    }

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
    @Log(title = "登陆日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{infoIds}")
    public Result<Void> remove(@PathVariable Long[] infoIds) {
        return sysLoginInfoService.deleteLoginInfoByIds(infoIds);
    }

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
    @Log(title = "登陆日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    public Result<Void> clean() {
        return sysLoginInfoService.cleanLoginInfo();
    }

    private final SysLoginInfoService sysLoginInfoService;

}
