package com.sixsixsix516.controller.system;

import java.util.List;

import com.sixsixsix516.model.vo.Result;
import com.sixsixsix516.service.SysRoleService;
import com.sixsixsix516.service.SysUserService;
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
import com.sixsixsix516.annotation.Log;
import com.sixsixsix516.constant.UserConstants;
import com.sixsixsix516.core.controller.BaseController;
import com.sixsixsix516.model.domain.entity.SysRole;
import com.sixsixsix516.model.domain.model.LoginUser;
import com.sixsixsix516.core.page.TableDataInfo;
import com.sixsixsix516.enums.BusinessType;
import com.sixsixsix516.utils.SecurityUtils;
import com.sixsixsix516.utils.ServletUtils;
import com.sixsixsix516.utils.StringUtils;
import com.sixsixsix516.utils.poi.ExcelUtil;
import com.sixsixsix516.web.service.SysPermissionService;
import com.sixsixsix516.web.service.TokenService;

/**
 * 角色信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/role")
public class SysRoleController extends BaseController {

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
	public TableDataInfo list(SysRole role) {
		startPage();
		List<SysRole> list = roleService.selectRoleList(role);
		return getDataTable(list);
	}

	@Log(title = "角色管理", businessType = BusinessType.EXPORT)
	@PreAuthorize("@ss.hasPermi('system:role:export')")
	@GetMapping("/export")
	public Result export(SysRole role) {
		List<SysRole> list = roleService.selectRoleList(role);
		ExcelUtil<SysRole> util = new ExcelUtil<SysRole>(SysRole.class);
		return util.exportExcel(list, "角色数据");
	}

	/**
	 * 根据角色编号获取详细信息
	 */
	@PreAuthorize("@ss.hasPermi('system:role:query')")
	@GetMapping(value = "/{roleId}")
	public Result getInfo(@PathVariable Long roleId) {
		return Result.success(roleService.selectRoleById(roleId));
	}

	/**
	 * 新增角色
	 */
	@PreAuthorize("@ss.hasPermi('system:role:add')")
	@Log(title = "角色管理", businessType = BusinessType.INSERT)
	@PostMapping
	public Result add(@Validated @RequestBody SysRole role) {
		if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
			return Result.error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
		} else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
			return Result.error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
		}
		role.setCreateBy(SecurityUtils.getUsername());
		return toAjax(roleService.insertRole(role));

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
			return Result.error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
		} else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
			return Result.error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
		}
		role.setUpdateBy(SecurityUtils.getUsername());

		if (roleService.updateRole(role) > 0) {
			// 更新缓存用户权限
			LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
			if (StringUtils.isNotNull(loginUser.getUser()) && !loginUser.getUser().isAdmin()) {
				loginUser.setPermissions(permissionService.getMenuPermission(loginUser.getUser()));
				loginUser.setUser(userService.selectUserByUserName(loginUser.getUser().getUserName()));
				tokenService.setLoginUser(loginUser);
			}
			return Result.success();
		}
		return Result.error("修改角色'" + role.getRoleName() + "'失败，请联系管理员");
	}

	/**
	 * 修改保存数据权限
	 */
	@PreAuthorize("@ss.hasPermi('system:role:edit')")
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@PutMapping("/dataScope")
	public Result dataScope(@RequestBody SysRole role) {
		roleService.checkRoleAllowed(role);
		return toAjax(roleService.authDataScope(role));
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
		return toAjax(roleService.updateRoleStatus(role));
	}

	/**
	 * 删除角色
	 */
	@PreAuthorize("@ss.hasPermi('system:role:remove')")
	@Log(title = "角色管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roleIds}")
	public Result remove(@PathVariable Long[] roleIds) {
		return toAjax(roleService.deleteRoleByIds(roleIds));
	}

	/**
	 * 获取角色选择框列表
	 */
	@PreAuthorize("@ss.hasPermi('system:role:query')")
	@GetMapping("/optionselect")
	public Result optionselect() {
		return Result.success(roleService.selectRoleAll());
	}
}
