package com.sixsixsix516.manager.core.security.handle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.factory.AsyncFactory;
import com.sixsixsix516.manager.core.factory.AsyncManager;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.core.web.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import com.alibaba.fastjson.JSON;
import com.sixsixsix516.common.core.utils.ServletUtils;

/**
 * 自定义退出处理类 返回成功
 *
 * @author SUN
 */
@Configuration
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {

    @Autowired
    private TokenService tokenService;

    /**
     * 退出处理
     */
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser)) {
            String userName = loginUser.getUsername();
            // 删除用户缓存记录
            tokenService.delLoginUser(loginUser.getToken());
            // 记录用户退出日志
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(userName, Constants.LOGOUT, "退出成功"));
        }
        ServletUtils.renderString(response, JSON.toJSONString(Result.ok("退出成功")));
    }
}
