package com.sixsixsix516.manager.core.web.service;

import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.core.redis.RedisCache;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.core.utils.ip.AddressUtils;
import com.sixsixsix516.common.core.utils.ip.IpUtils;
import com.sixsixsix516.common.core.utils.uuid.IdUtils;
import com.sixsixsix516.common.utils.TokenUtil;
import com.sixsixsix516.manager.core.model.LoginUser;
import eu.bitwalker.useragentutils.UserAgent;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * token验证处理
 *
 * @author SUN
 */
@Component
public class TokenService {

	@Autowired
	private RedisCache redisCache;
	/**
	 * 令牌有效期（默认30分钟）
	 */
	@Value("${token.expireTime}")
	private int expireTime;

	protected static final long MILLIS_SECOND = 1000;
	protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;
	private static final Long MILLIS_MINUTE_TEN = 20 * 60 * 1000L;


	/**
	 * 获取用户身份信息
	 *
	 * @return 用户信息
	 */
	public LoginUser getLoginUser(HttpServletRequest request) {
		// 获取请求携带的令牌
		String token = TokenUtil.getToken(request);
		if (StringUtils.isNotEmpty(token)) {
			Claims claims = TokenUtil.parseToken(token);
			// 解析对应的权限以及用户信息
			String uuid = (String) claims.get(Constants.LOGIN_USER_KEY);
			String userKey = TokenUtil.getTokenKey(uuid);
			return redisCache.getCacheObject(userKey);
		}
		return null;
	}

	/**
	 * 设置用户身份信息
	 */
	public void setLoginUser(LoginUser loginUser) {
		if (StringUtils.isNotNull(loginUser) && StringUtils.isNotEmpty(loginUser.getToken())) {
			refreshToken(loginUser);
		}
	}

	/**
	 * 删除用户身份信息
	 */
	public void delLoginUser(String token) {
		if (StringUtils.isNotEmpty(token)) {
			String userKey = TokenUtil.getTokenKey(token);
			redisCache.deleteObject(userKey);
		}
	}

	/**
	 * 创建令牌
	 *
	 * @param loginUser 用户信息
	 * @return 令牌
	 */
	public String createToken(LoginUser loginUser) {
		String token = IdUtils.fastUUID();
		loginUser.setToken(token);
		setUserAgent(loginUser);
		refreshToken(loginUser);

		Map<String, Object> claims = new HashMap<>();
		claims.put(Constants.LOGIN_USER_KEY, token);
		return TokenUtil.createToken(claims);
	}

	/**
	 * 验证令牌有效期，相差不足20分钟，自动刷新缓存
	 */
	public void verifyToken(LoginUser loginUser) {
		long expireTime = loginUser.getExpireTime();
		long currentTime = System.currentTimeMillis();
		if (expireTime - currentTime <= MILLIS_MINUTE_TEN) {
			refreshToken(loginUser);
		}
	}

	/**
	 * 刷新令牌有效期
	 *
	 * @param loginUser 登录信息
	 */
	public void refreshToken(LoginUser loginUser) {
		loginUser.setLoginTime(System.currentTimeMillis());
		loginUser.setExpireTime(loginUser.getLoginTime() + expireTime * MILLIS_MINUTE);
		// 根据uuid将loginUser缓存
		String userKey = TokenUtil.getTokenKey(loginUser.getToken());
		redisCache.setCacheObject(userKey, loginUser, expireTime, TimeUnit.MINUTES);
	}

	/**
	 * 设置用户代理信息
	 *
	 * @param loginUser 登录信息
	 */
	public void setUserAgent(LoginUser loginUser) {
		UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
		String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
		loginUser.setIpaddr(ip);
		loginUser.setLoginLocation(AddressUtils.getRealAddressByIP(ip));
		loginUser.setBrowser(userAgent.getBrowser().getName());
		loginUser.setOs(userAgent.getOperatingSystem().getName());
	}


}
