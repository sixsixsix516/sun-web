package com.sixsixsix516.framework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sixsixsix516.model.SysLogininfor;
import com.sixsixsix516.mapper.SysLogininforMapper;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author ruoyi
 */
@Service
public class SysLogininforService {

	@Autowired
	private SysLogininforMapper logininforMapper;

	/**
	 * 新增系统登录日志
	 *
	 * @param logininfor 访问日志对象
	 */
	public void insertLogininfor(SysLogininfor logininfor) {
		logininforMapper.insertLogininfor(logininfor);
	}


	/**
	 * 批量删除系统登录日志
	 *
	 * @param infoIds 需要删除的登录日志ID
	 */
	public int deleteLogininforByIds(Long[] infoIds) {
		return logininforMapper.deleteLogininforByIds(infoIds);
	}

	/**
	 * 清空系统登录日志
	 */
	public void cleanLogininfor() {
		logininforMapper.cleanLogininfor();
	}
}
