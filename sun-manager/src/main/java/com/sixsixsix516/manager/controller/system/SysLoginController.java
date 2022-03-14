package com.sixsixsix516.manager.controller.system;

import com.sixsixsix516.common.model.system.LoginBody;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.web.service.SysLoginService;
import com.sixsixsix516.manager.vo.RouterVo;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 登录验证
 * @author SUN
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
    public Result<String> login(@RequestBody LoginBody loginBody) {
        return loginService.login(loginBody.getUsername(), loginBody.getPassword());
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public Result<Map<String, Object>> getInfo() {
        return loginService.getInfo();
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public Result<List<RouterVo>> getRouters() {
        return loginService.getRouters();
    }

    private final SysLoginService loginService;

}
