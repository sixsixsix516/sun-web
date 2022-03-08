package com.sixsixsix516.manager.core.web.service;

import java.util.HashSet;
import java.util.Set;

import com.sixsixsix516.manager.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.sixsixsix516.common.model.system.SysUser;

/**
 * 用户权限处理
 *
 * @author SUN
 */
@Component
public class SysPermissionService {

	@Autowired
	private SysMenuService menuService;


	/**
	 * 获取菜单数据权限
	 *
	 * @param user 用户信息
	 * @return 菜单权限信息
	 */
	public Set<String> getMenuPermission(SysUser user) {
		Set<String> perms = new HashSet<>();
		// 管理员拥有所有权限
		if (user.isAdmin()) {
			perms.add("*:*:*");
		} else {
			perms.addAll(menuService.selectMenuPermsByUserId(user.getUserId()));
		}
		return perms;
	}
}
