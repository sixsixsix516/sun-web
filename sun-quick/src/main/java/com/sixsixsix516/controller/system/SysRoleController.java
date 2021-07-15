package com.sixsixsix516.controller.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.framework.vo.PageInfo;
import com.sixsixsix516.mapper.system.SysRoleMapper;
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
import com.sixsixsix516.framework.annotation.Log;
import com.sixsixsix516.framework.constant.UserConstants;
import com.sixsixsix516.model.system.SysRole;
import com.sixsixsix516.model.system.LoginUser;
import com.sixsixsix516.framework.enums.BusinessType;
import com.sixsixsix516.framework.utils.SecurityUtils;
import com.sixsixsix516.framework.utils.ServletUtils;
import com.sixsixsix516.framework.utils.StringUtils;
import com.sixsixsix516.framework.web.service.SysPermissionService;
import com.sixsixsix516.framework.web.service.TokenService;

/**
 * 角色信息
 *
 * @author SUN
 */
@RestController
@RequestMapping("/system/role")
public class SysRoleController {

	@Autowired
	private SysRoleService roleService;
	@Autowired
	private TokenService tokenService;
	@Autowired
	private SysPermissionService permissionService;
	@Autowired
	private SysUserService userService;

	@PreAuthorize("@ss.hasPermi('system:role:list')")
	@GetMapping("/list")
	public Result list(SysRole role, PageInfo pageInfo) {
		IPage<SysRole> sysRolePage = sysRoleMapper.selectRoleList(new Page(pageInfo.getPageNum(), pageInfo.getPageSize()), role);
		return Result.ok(sysRolePage.getRecords(), sysRolePage.getTotal());
	}

	/**
	 * 根据角色编号获取详细信息
	 */
	@PreAuthorize("@ss.hasPermi('system:role:query')")
	@GetMapping(value = "/{roleId}")
	public Result getInfo(@PathVariable Long roleId) {
		return Result.ok(roleService.selectRoleById(roleId));
	}

	/**
	 * 新增角色
	 */
	@PreAuthorize("@ss.hasPermi('system:role:add')")
	@Log(title = "角色管理", businessType = BusinessType.INSERT)
	@PostMapping
	public Result add(@Validated @RequestBody SysRole role) {
		if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
			return Result.fail("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
		}
		role.setCreateBy(SecurityUtils.getUsername());
		return Result.ok(roleService.insertRole(role));
	}

	/**
	 * 修改保存角色
	 */
	@PreAuthorize("@ss.hasPermi('system:role:edit')")
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@PutMapping
	public Result edit(@Validated @RequestBody SysRole role) {
		roleService.checkRoleAllowed(role);
		if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
			return Result.fail("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
		}
		role.setUpdateBy(SecurityUtils.getUsername());
		if (roleService.updateRole(role) > 0) {
			// 更新缓存用户权限
			LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
			if (StringUtils.isNotNull(loginUser.getUser()) && !loginUser.getUser().isAdmin()) {
				loginUser.setPermissions(permissionService.getMenuPermission(loginUser.getUser()));
				loginUser.setUser(userService.selectUserByUserName(loginUser.getUser().getRealname()));
				tokenService.setLoginUser(loginUser);
			}
			return Result.ok();
		}
		return Result.fail("修改角色'" + role.getRoleName() + "'失败，请联系管理员");
	}

	/**
	 * 修改保存数据权限
	 */
	@PreAuthorize("@ss.hasPermi('system:role:edit')")
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@PutMapping("/dataScope")
	public Result dataScope(@RequestBody SysRole role) {
		roleService.checkRoleAllowed(role);
		return Result.ok(roleService.authDataScope(role));
	}

	/**
	 * 状态修改
	 */
	@PreAuthorize("@ss.hasPermi('system:role:edit')")
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@PutMapping("/changeStatus")
	public Result changeStatus(@RequestBody SysRole role) {
		roleService.checkRoleAllowed(role);
		role.setUpdateBy(SecurityUtils.getUsername());
		return Result.ok(roleService.updateRoleStatus(role));
	}

	/**
	 * 删除角色
	 */
	@PreAuthorize("@ss.hasPermi('system:role:remove')")
	@Log(title = "角色管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roleIds}")
	public Result remove(@PathVariable Long[] roleIds) {
		return Result.ok(roleService.deleteRoleByIds(roleIds));
	}

	/**
	 * 获取角色选择框列表
	 */
	@PreAuthorize("@ss.hasPermi('system:role:query')")
	@GetMapping("/optionselect")
	public Result optionselect() {
		return Result.ok(sysRoleMapper.selectList(null));
	}


	@Autowired
	private SysRoleMapper sysRoleMapper;
}
