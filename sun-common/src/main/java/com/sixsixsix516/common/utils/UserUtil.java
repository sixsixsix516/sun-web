package com.sixsixsix516.common.utils;

import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author SUN
 * @date 2021/10/2
 */
public class UserUtil {

    public final static String USER_ID_KEY = "userId";
    public final static String USER_TYPE_KEY = "userType";

    public static Long getUserId() {
        Object userId = getCurrentRequest().getAttribute(USER_ID_KEY);
        if (userId == null) {
            return null;
        }
        if (userId instanceof String) {
            String userIdStr = (String) userId;
            return StringUtils.isEmpty(userIdStr) ? null : Long.valueOf(userIdStr);
        }
        if (userId instanceof Long) {
            return (Long) userId;
        }
        return null;
    }

    /**
     * 获取用户类型
     * 对应 cn.wkpower.common.utils.TokenUtil
     */
    public static Integer getUserType() {
        Object userType = getCurrentRequest().getAttribute(USER_TYPE_KEY);
        return (Integer) userType;
    }

    private static HttpServletRequest getCurrentRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attributes.getRequest();
    }

}
