package com.sixsixsix516.manager.core.security.handle;

import com.alibaba.fastjson.JSON;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.vo.Result;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

/**
 * 认证失败处理类 返回未授权
 *
 * @author SUN
 */
@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint, Serializable {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) {
        String msg = "请求访问：" + request.getRequestURI() + "，认证失败，无法访问系统资源";
        ServletUtils.renderString(response, JSON.toJSONString(Result.fail(msg)));
    }
}
