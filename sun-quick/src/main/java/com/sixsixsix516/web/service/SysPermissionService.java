package com.sixsixsix516.web.service;

import java.util.HashSet;
import java.util.Set;

import com.sixsixsix516.service.SysMenuService;
import com.sixsixsix516.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.sixsixsix516.model.domain.entity.SysUser;

/**
 * 用户权限处理
 *
 * @author ruoyi
 */
@Component
public class SysPermissionService {

	@Autowired
	private SysRoleService roleService;
	@Autowired
	private SysMenuService menuService;

	/**
	 * 获取角色数据权限
	 *
	 * @param user 用户信息
	 * @return 角色权限信息
	 */
	public Set<String> getRolePermission(SysUser user) {
		Set<String> roles = new HashSet<String>();
		// 管理员拥有所有权限
		if (user.isAdmin()) {
			roles.add("admin");
		} else {
			roles.addAll(roleService.selectRolePermissionByUserId(user.getUserId()));
		}
		return roles;
	}

	/**
	 * 获取菜单数据权限
	 *
	 * @param user 用户信息
	 * @return 菜单权限信息
	 */
	public Set<String> getMenuPermission(SysUser user) {
		Set<String> perms = new HashSet<String>();
		// 管理员拥有所有权限
		if (user.isAdmin()) {
			perms.add("*:*:*");
		} else {
			perms.addAll(menuService.selectMenuPermsByUserId(user.getUserId()));
		}
		return perms;
	}
}
