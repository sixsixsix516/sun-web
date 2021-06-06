package com.sixsixsix516.framework.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sixsixsix516.model.system.SysOperLog;
import com.sixsixsix516.mapper.system.SysOperLogMapper;

/**
 * 操作日志 服务层处理
 *
 * @author SUN
 */
@Service
public class SysOperLogService {

	@Autowired
	private SysOperLogMapper operLogMapper;

	/**
	 * 新增操作日志
	 *
	 * @param operLog 操作日志对象
	 */
	public void insertOperlog(SysOperLog operLog) {
		operLogMapper.insertOperlog(operLog);
	}

	/**
	 * 批量删除系统操作日志
	 *
	 * @param operIds 需要删除的操作日志ID
	 * @return 结果
	 */
	public int deleteOperLogByIds(Long[] operIds) {
		return operLogMapper.deleteOperLogByIds(operIds);
	}

	/**
	 * 清空操作日志
	 */
	public void cleanOperLog() {
		operLogMapper.cleanOperLog();
	}
}
