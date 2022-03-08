package com.sixsixsix516.manager.service;

import java.util.List;
import javax.annotation.PostConstruct;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sixsixsix516.common.mapper.system.SysConfigMapper;
import com.sixsixsix516.common.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sixsixsix516.common.core.constant.Constants;
import com.sixsixsix516.common.core.core.redis.RedisCache;
import com.sixsixsix516.common.core.core.text.Convert;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.model.system.SysConfig;

/**
 * 参数配置 服务层实现
 *
 * @author SUN
 */
@Service
public class SysConfigService {

	/**
	 * 项目启动时，初始化参数到缓存
	 */
	@PostConstruct
	public void init() {
		List<SysConfig> configsList = configMapper.selectList(null);
		for (SysConfig config : configsList) {
			redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
		}
	}

	/**
	 * 查询参数配置信息
	 */
	public Result<SysConfig> selectConfigById(Long configId) {
		return Result.ok(configMapper.selectById(configId));
	}

	/**
	 * 根据键名查询参数配置信息
	 */
	public String selectConfigByKey(String configKey) {
		String configValue = Convert.toStr(redisCache.getCacheObject(getCacheKey(configKey)));
		if (StringUtils.isNotEmpty(configValue)) {
			return configValue;
		}
		SysConfig retConfig = configMapper.selectOne(new QueryWrapper<SysConfig>().lambda().eq(SysConfig::getConfigKey, configKey));
		if (StringUtils.isNotNull(retConfig)) {
			redisCache.setCacheObject(getCacheKey(configKey), retConfig.getConfigValue());
			return retConfig.getConfigValue();
		}
		return StringUtils.EMPTY;
	}

	/**
	 * 设置cache key
	 */
	private String getCacheKey(String configKey) {
		return Constants.SYS_CONFIG_KEY + configKey;
	}

	@Autowired
	private SysConfigMapper configMapper;
	@Autowired
	private RedisCache redisCache;
}
