package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.manager.service.SysConfigService;
import com.sixsixsix516.common.model.system.SysConfig;
import com.sixsixsix516.common.vo.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 参数配置 信息操作处理
 *
 * @author SUN
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/config")
public class SysConfigController {

    /**
     * 根据参数编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermissions('system:config:query')")
    @GetMapping(value = "/{configId}")
    public Result<SysConfig> getInfo(@PathVariable Long configId) {
        return configService.selectConfigById(configId);
    }

    /**
     * 根据参数键名查询参数值
     */
    @GetMapping(value = "/configKey/{configKey}")
    public Result<String> getConfigKey(@PathVariable String configKey) {
        return configService.selectConfigByKey(configKey);
    }

    private final SysConfigService configService;
}
