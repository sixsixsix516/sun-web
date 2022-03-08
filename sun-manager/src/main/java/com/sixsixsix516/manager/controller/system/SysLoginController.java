package com.sixsixsix516.manager.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.sixsixsix516.common.mapper.system.SysRoleMapper;
import com.sixsixsix516.common.model.system.LoginBody;
import com.sixsixsix516.common.model.system.SysMenu;
import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.service.SysMenuService;
import com.sixsixsix516.manager.core.web.service.SysLoginService;
import com.sixsixsix516.manager.core.web.service.SysPermissionService;
import com.sixsixsix516.manager.core.web.service.TokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.common.core.utils.ServletUtils;

/**
 * 登录验证
 */
@RestController
@RequiredArgsConstructor
public class SysLoginController {

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public Result login(@RequestBody LoginBody loginBody) {
        // 生成令牌
        return Result.ok(loginService.login(loginBody.getUsername(), loginBody.getPassword()));
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public Result getInfo() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        return Result.ok(new HashMap<String, Object>(3) {{
            put("user", user);
            put("roles", sysRoleMapper.selectRolePermissionByUserId(user.getUserId()));
            put("permissions", permissions);
        }});
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public Result getRouters() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return Result.ok(menuService.buildMenus(menus));
    }

    private final SysLoginService loginService;
    private final SysMenuService menuService;
    private final SysPermissionService permissionService;
    private final TokenService tokenService;
    private final SysRoleMapper sysRoleMapper;

}
