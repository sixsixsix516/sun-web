package com.sixsixsix516.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.vo.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.sixsixsix516.common.model.system.SysLoginInfo;
import com.sixsixsix516.common.mapper.system.SysLoginInfoMapper;

import java.util.List;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author SUN
 */
@RequiredArgsConstructor
@Service
public class SysLoginInfoService {

	public Result<List<SysLoginInfo>> list(SysLoginInfo loginInfo, PageInfo pageInfo) {
		IPage<SysLoginInfo> sysLoginInfoPage = sysLoginInfoMapper.selectLogininforList(new Page<>(pageInfo.getPageNum(),
				pageInfo.getPageSize()), loginInfo);
		return Result.ok(sysLoginInfoPage.getRecords(), sysLoginInfoPage.getTotal());
	}

	/**
	 * 新增系统登录日志
	 */
	public void insertLoginInfo(SysLoginInfo loginInfo) {
		sysLoginInfoMapper.insert(loginInfo);
	}

	/**
	 * 批量删除系统登录日志
	 *
	 * @param infoIds 需要删除的登录日志ID
	 */
	public Result<Void> deleteLoginInfoByIds(Long[] infoIds) {
		sysLoginInfoMapper.deleteLogininforByIds(infoIds);
		return Result.ok();
	}

	/**
	 * 清空系统登录日志
	 */
	public Result<Void> cleanLoginInfo() {
		sysLoginInfoMapper.cleanLogininfor();
		return Result.ok();
	}

	private final SysLoginInfoMapper sysLoginInfoMapper;

}
