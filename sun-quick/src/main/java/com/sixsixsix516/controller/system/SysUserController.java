package com.sixsixsix516.controller.system;

import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.framework.vo.PageInfo;
import com.sixsixsix516.mapper.system.SysRoleMapper;
import com.sixsixsix516.mapper.system.SysUserMapper;
import com.sixsixsix516.vo.Result;
import com.sixsixsix516.framework.service.SysRoleService;
import com.sixsixsix516.framework.service.SysUserService;
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
import org.springframework.web.multipart.MultipartFile;
import com.sixsixsix516.framework.annotation.Log;
import com.sixsixsix516.model.system.SysUser;
import com.sixsixsix516.model.system.LoginUser;
import com.sixsixsix516.framework.enums.BusinessType;
import com.sixsixsix516.framework.utils.SecurityUtils;
import com.sixsixsix516.framework.utils.ServletUtils;
import com.sixsixsix516.framework.utils.poi.ExcelUtil;
import com.sixsixsix516.framework.web.service.TokenService;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * 用户信息
 *
 * @author SUN
 */
@Valid
@RestController
@RequestMapping("/system/user")
public class SysUserController {

    @Autowired
    private SysUserService userService;
    @Autowired
    private SysRoleService roleService;

    /**
     * 获取用户列表
     */
    @PreAuthorize("@ss.hasPermi('system:user:list')")
    @GetMapping("/list")
    public Result list(SysUser user, PageInfo pageInfo) {
        IPage<SysUser> sysUserPage = sysUserMapper.listUser(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()), user);
        return Result.ok(sysUserPage.getRecords(), sysUserPage.getTotal());
    }

    @GetMapping("/importTemplate")
    public Result importTemplate() {
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        return util.importTemplateExcel("用户数据");
    }

    /**
     * 根据用户编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:user:query')")
    @GetMapping(value = {"/", "/{userId}"})
    public Result getInfo(@PathVariable(value = "userId", required = false) @NotNull(message = "用户不存在") Long userId) {
        return Result.ok(new HashMap<String, Object>(3) {{
            put("roleIds", roleService.selectRoleListByUserId(userId));
            put("roles", sysRoleMapper.selectList(null));
            put("data", userService.selectUserById(userId));
        }});
    }

    /**
     * 新增用户
     */
    @PreAuthorize("@ss.hasPermi('system:user:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public Result add(@Validated @RequestBody SysUser user) {
        return userService.insertUser(user);
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('system:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public Result edit(@Validated @RequestBody SysUser user) {
        user.setUpdateBy(SecurityUtils.getUsername());
        return Result.ok(userService.updateUser(user));
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermi('system:user:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public Result remove(@PathVariable List<Long> userIds) {
        return userService.deleteUserByIds(userIds);
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasPermi('system:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public Result resetPwd(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setUpdateBy(SecurityUtils.getUsername());
        return Result.ok(userService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('system:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public Result changeStatus(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        user.setUpdateBy(SecurityUtils.getUsername());
        return Result.ok(userService.updateUserStatus(user));
    }

    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysUserMapper sysUserMapper;
}
