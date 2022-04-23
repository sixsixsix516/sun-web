package com.sixsixsix516.manager.core.web.service;

import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.manager.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户权限处理
 *
 * @author SUN
 */
@RequiredArgsConstructor
@Component
public class SysPermissionService {

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

	private final SysMenuService menuService;
}
