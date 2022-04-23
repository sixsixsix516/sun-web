package com.sixsixsix516.common.utils;

import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.utils.StringUtils;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author SUN
 * @date 23/04/2022
 */
@Component
public class TokenUtil {

    /**
     * 令牌自定义标识
     */
    private static String header;
    /**
     * 令牌秘钥
     */
    private static String secret;


    @Value("${token.header}")
    public void setHeader(String header) {
        TokenUtil.header = header;
    }
    @Value("${token.secret}")
    public void setSecret(String secret) {
        TokenUtil.secret = secret;
    }

    public final static String USER_ID_KEY = "userId";
    public final static String USER_TYPE_KEY = "userType";



    /**
     * 从token中获取userId
     *
     * @return userId
     */
    public static Long getUserIdFromToken(String token) {
        Claims body = parseToken(token);
        return body.get(USER_ID_KEY, Long.class);
    }

    /**
     * 从token中获取userType
     *
     * @return userId
     */
    public static Integer getUserTypeFromToken(String token) {
        Claims body = Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody();
        return body.get(USER_TYPE_KEY, Integer.class);
    }


    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    public static String createToken(Map<String, Object> claims) {
        return Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, secret).compact();
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    public static Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 获取请求token
     */
    public static String getToken(HttpServletRequest request) {
        String token = request.getHeader(header);
        if (StringUtils.isNotEmpty(token) && token.startsWith(Constants.TOKEN_PREFIX)) {
            token = token.replace(Constants.TOKEN_PREFIX, "");
        }
        return token;
    }

    public static String getTokenKey(String uuid) {
        return Constants.LOGIN_TOKEN_KEY + uuid;
    }


}
