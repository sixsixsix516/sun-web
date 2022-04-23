package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.model.system.SysMenu;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.core.web.service.TokenService;
import com.sixsixsix516.manager.service.SysMenuService;
import com.sixsixsix516.manager.vo.response.menu.MenuListResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @PreAuthorize("@ss.hasPermissions('system:menu:list')")
    @GetMapping("/list")
    public Result<List<SysMenu>> list(SysMenu menu) {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        Long userId = loginUser.getUser().getUserId();
        List<SysMenu> menus = menuService.selectMenuList(menu, userId);
        return Result.ok(menus);
    }

    /**
     * 根据菜单编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermissions('system:menu:query')")
    @GetMapping(value = "/{menuId}")
    public Result<SysMenu> getInfo(@PathVariable Long menuId) {
        return menuService.selectMenuById(menuId);
    }

    /**
     * 获取菜单下拉树列表
     */
    @GetMapping("/treeSelect")
    public Result treeSelect(SysMenu menu) {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        Long userId = loginUser.getUser().getUserId();
        List<SysMenu> menus = menuService.selectMenuList(menu, userId);
        return Result.ok(menuService.buildMenuTreeSelect(menus));
    }

    /**
     * 加载对应角色菜单列表树
     */
    @GetMapping(value = "/roleMenuTreeSelect/{roleId}")
    public Result<MenuListResponse> roleMenuTreeSelect(@PathVariable("roleId") Long roleId) {
        return menuService.selectMenuList(roleId);
    }

    /**
     * 新增菜单
     */
    @PreAuthorize("@ss.hasPermissions('system:menu:add')")
    @Log(title = "菜单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public Result<Void> add(@Validated @RequestBody SysMenu menu) {
        return menuService.insertMenu(menu);
    }

    /**
     * 修改菜单
     */
    @PreAuthorize("@ss.hasPermissions('system:menu:edit')")
    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public Result<Void> edit(@Validated @RequestBody SysMenu menu) {
        return menuService.updateMenu(menu);
    }

    /**
     * 删除菜单
     */
    @PreAuthorize("@ss.hasPermissions('system:menu:remove')")
    @Log(title = "菜单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{menuId}")
    public Result<Void> remove(@PathVariable("menuId") Long menuId) {
        return menuService.deleteMenuById(menuId);
    }

    private final SysMenuService menuService;
    private final TokenService tokenService;
}
