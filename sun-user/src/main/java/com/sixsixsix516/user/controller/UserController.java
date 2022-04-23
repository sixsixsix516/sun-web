package com.sixsixsix516.user.controller;

import com.sixsixsix516.common.utils.UserUtil;
import com.sixsixsix516.common.vo.Result;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author SUN
 * @date 23/04/2022
 */
@RestController
@RequestMapping("/user")
public class UserController {


    public Result<Void> my() {
        Long userId = UserUtil.getUserId();
        // select user by userId
        return null;
    }
}
