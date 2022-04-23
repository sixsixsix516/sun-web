package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.model.system.SysRole;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色信息
 *
 * @author SUN
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/role")
public class SysRoleController {


    @PreAuthorize("@ss.hasPermissions('system:role:list')")
    @GetMapping("/list")
    public Result<List<SysRole>> list(SysRole role, PageInfo pageInfo) {
        return roleService.list(role, pageInfo);
    }

    /**
     * 根据角色编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermissions('system:role:query')")
    @GetMapping("/{roleId}")
    public Result<SysRole> getInfo(@PathVariable Long roleId) {
        return roleService.selectRoleById(roleId);
    }

    /**
     * 新增角色
     */
    @PreAuthorize("@ss.hasPermissions('system:role:add')")
    @Log(title = "角色管理", businessType = BusinessType.INSERT)
    @PostMapping
    public Result<Void> add(@Validated @RequestBody SysRole role) {
        return roleService.insertRole(role);
    }

    /**
     * 修改保存角色
     */
    @PreAuthorize("@ss.hasPermissions('system:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public Result<Void> edit(@Validated @RequestBody SysRole role) {
        return roleService.edit(role);
    }

    /**
     * 修改保存数据权限
     */
    @PreAuthorize("@ss.hasPermissions('system:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/dataScope")
    public Result<Void> dataScope(@RequestBody SysRole role) {
        return roleService.authDataScope(role);
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermissions('system:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public Result<Void> changeStatus(@RequestBody SysRole role) {
        return roleService.updateRoleStatus(role);
    }

    /**
     * 删除角色
     */
    @PreAuthorize("@ss.hasPermissions('system:role:remove')")
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    public Result<Void> remove(@PathVariable Long[] roleIds) {
        return roleService.deleteRoleByIds(roleIds);
    }

    /**
     * 获取角色选择框列表
     */
    @PreAuthorize("@ss.hasPermissions('system:role:query')")
    @GetMapping("/optionSelect")
    public Result<Void> optionSelect() {
        return roleService.optionSelect();
    }

    private final SysRoleService roleService;
}
