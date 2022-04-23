package com.sixsixsix516.user.controller;

import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.user.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author SUN
 * @date 23/04/2022
 */
@RequiredArgsConstructor
@RequestMapping("/login")
@RestController
public class LoginController {

    @PostMapping("/login")
    public Result<Void> login() {
        return loginService.login();
    }


    private final LoginService loginService;
}
