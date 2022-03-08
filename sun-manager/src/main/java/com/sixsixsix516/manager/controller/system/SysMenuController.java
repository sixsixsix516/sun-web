package com.sixsixsix516.manager.controller.system;

import java.util.HashMap;
import java.util.List;

import com.sixsixsix516.common.model.system.SysMenu;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.service.SysMenuService;
import com.sixsixsix516.manager.core.web.service.TokenService;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
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
import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.constant.UserConstants;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.core.utils.StringUtils;

/**
 * 菜单信息
 *
 * @author SUN
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/menu")
public class SysMenuController {


	/**
	 * 获取菜单列表
	 */
	@PreAuthorize("@ss.hasPermi('system:menu:list')")
	@GetMapping("/list")
	public Result list(SysMenu menu) {
		LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
		Long userId = loginUser.getUser().getUserId();
		List<SysMenu> menus = menuService.selectMenuList(menu, userId);
		return Result.ok(menus);
	}

	/**
	 * 根据菜单编号获取详细信息
	 */
	@PreAuthorize("@ss.hasPermi('system:menu:query')")
	@GetMapping(value = "/{menuId}")
	public Result getInfo(@PathVariable Long menuId) {
		return Result.ok(menuService.selectMenuById(menuId));
	}

	/**
	 * 获取菜单下拉树列表
	 */
	@GetMapping("/treeselect")
	public Result treeselect(SysMenu menu) {
		LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
		Long userId = loginUser.getUser().getUserId();
		List<SysMenu> menus = menuService.selectMenuList(menu, userId);
		return Result.ok(menuService.buildMenuTreeSelect(menus));
	}

	/**
	 * 加载对应角色菜单列表树
	 */
	@GetMapping(value = "/roleMenuTreeselect/{roleId}")
	public Result roleMenuTreeselect(@PathVariable("roleId") Long roleId) {
		LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
		List<SysMenu> menus = menuService.selectMenuList(loginUser.getUser().getUserId());
		return Result.ok(new HashMap<String, Object>(2) {{
			put("checkedKeys", menuService.selectMenuListByRoleId(roleId));
			put("menus", menuService.buildMenuTreeSelect(menus));
		}});
	}

	/**
	 * 新增菜单
	 */
	@PreAuthorize("@ss.hasPermi('system:menu:add')")
	@Log(title = "菜单管理", businessType = BusinessType.INSERT)
	@PostMapping
	public Result add(@Validated @RequestBody SysMenu menu) {
		if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
			return Result.fail("新增菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
		} else if (UserConstants.YES_FRAME.equals(menu.getIsFrame())
				&& !StringUtils.startsWithAny(menu.getPath(), Constants.HTTP, Constants.HTTPS)) {
			return Result.fail("新增菜单'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
		}
		menu.setCreateBy(SecurityUtils.getUsername());
		return Result.ok(menuService.insertMenu(menu));
	}

	/**
	 * 修改菜单
	 */
	@PreAuthorize("@ss.hasPermi('system:menu:edit')")
	@Log(title = "菜单管理", businessType = BusinessType.UPDATE)
	@PutMapping
	public Result edit(@Validated @RequestBody SysMenu menu) {
		if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
			return Result.fail("修改菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
		} else if (UserConstants.YES_FRAME.equals(menu.getIsFrame())
				&& !StringUtils.startsWithAny(menu.getPath(), Constants.HTTP, Constants.HTTPS)) {
			return Result.fail("新增菜单'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
		} else if (menu.getMenuId().equals(menu.getParentId())) {
			return Result.fail("新增菜单'" + menu.getMenuName() + "'失败，上级菜单不能选择自己");
		}
		menu.setUpdateBy(SecurityUtils.getUsername());
		return Result.ok(menuService.updateMenu(menu));
	}

	/**
	 * 删除菜单
	 */
	@PreAuthorize("@ss.hasPermi('system:menu:remove')")
	@Log(title = "菜单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{menuId}")
	public Result remove(@PathVariable("menuId") Long menuId) {
		if (menuService.hasChildByMenuId(menuId)) {
			return Result.fail("存在子菜单,不允许删除");
		}
		if (menuService.checkMenuExistRole(menuId)) {
			return Result.fail("菜单已分配,不允许删除");
		}
		return Result.ok(menuService.deleteMenuById(menuId));
	}

	private final SysMenuService menuService;
	private final TokenService tokenService;
}
