package com.sixsixsix516.manager.core.web.service;

import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.exception.CustomException;
import com.sixsixsix516.common.core.exception.user.UserPasswordNotMatchException;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.mapper.system.SysRoleMapper;
import com.sixsixsix516.common.model.system.SysMenu;
import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.factory.AsyncFactory;
import com.sixsixsix516.manager.core.factory.AsyncManager;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.service.SysMenuService;
import com.sixsixsix516.manager.vo.RouterVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 登录校验方法
 *
 * @author SUN
 */
@Component
@RequiredArgsConstructor
public class SysLoginService {


    /**
     * 登录验证
     *
     * @param username 用户名
     * @param password 密码
     * @return 结果
     */
    public Result<String> login(String username, String password) {
        // 用户验证
        Authentication authentication;
        try {
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (Exception e) {
            if (e instanceof BadCredentialsException) {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, "用户不存在/密码错误"));
                throw new UserPasswordNotMatchException();
            } else {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new CustomException(e.getMessage());
            }
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, "登录成功"));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        return Result.ok(tokenService.createToken(loginUser));
    }


    /**
     * 获取用户信息
     */
    public Result<Map<String, Object>> getInfo() {
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
     */
    public Result<List<RouterVo>> getRouters() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return Result.ok(menuService.buildMenus(menus));
    }

    private final TokenService tokenService;
    private final AuthenticationManager authenticationManager;
    private final SysMenuService menuService;
    private final SysPermissionService permissionService;
    private final SysRoleMapper sysRoleMapper;

}
