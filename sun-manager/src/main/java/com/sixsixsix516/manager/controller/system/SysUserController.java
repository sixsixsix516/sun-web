package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.service.SysUserService;
import com.sixsixsix516.manager.util.poi.ExcelUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;

/**
 * 用户信息
 *
 * @author SUN
 */
@RequiredArgsConstructor
@Valid
@RestController
@RequestMapping("/system/user")
public class SysUserController {

    /**
     * 获取用户列表
     */
    @PreAuthorize("@ss.hasPermissions('system:user:list')")
    @GetMapping("/list")
    public Result<List<SysUser>> list(SysUser user, PageInfo pageInfo) {
        return userService.list(user, pageInfo);
    }

    @GetMapping("/importTemplate")
    public Result<String> importTemplate() {
        ExcelUtil<SysUser> util = new ExcelUtil<>(SysUser.class);
        return util.importTemplateExcel("用户数据");
    }

    /**
     * 根据用户编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermissions('system:user:query')")
    @GetMapping(value = {"/", "/{userId}"})
    public Result<HashMap<String, Object>> getInfo(@PathVariable(value = "userId", required = false) @NotNull(message = "用户不存在") Long userId) {
        return userService.getInfo(userId);
    }

    /**
     * 新增用户
     */
    @PreAuthorize("@ss.hasPermissions('system:user:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public Result<Void> add(@Validated @RequestBody SysUser user) {
        return userService.insertUser(user);
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermissions('system:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public Result<Void> edit(@Validated @RequestBody SysUser user) {
        return userService.updateUser(user);
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermissions('system:user:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public Result<Void> remove(@PathVariable List<Long> userIds) {
        return userService.deleteUserByIds(userIds);
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasPermissions('system:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public Result<Void> resetPwd(@RequestBody SysUser user) {
        return userService.resetPwd(user);
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermissions('system:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public Result<Void> changeStatus(@RequestBody SysUser user) {
        return userService.updateUserStatus(user);
    }

    private final SysUserService userService;
}
