package com.sixsixsix516.manager.core.security.handle;

import java.io.IOException;
import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixsixsix516.common.vo.Result;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson.JSON;
import com.sixsixsix516.common.core.utils.ServletUtils;

/**
 * 认证失败处理类 返回未授权
 *
 * @author SUN
 */
@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint, Serializable {
	private static final long serialVersionUID = -8970718410437077606L;

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e)
			throws IOException {
		String msg = "请求访问：" + request.getRequestURI() + "，认证失败，无法访问系统资源";
		ServletUtils.renderString(response, JSON.toJSONString(Result.fail(msg)));
	}
}
