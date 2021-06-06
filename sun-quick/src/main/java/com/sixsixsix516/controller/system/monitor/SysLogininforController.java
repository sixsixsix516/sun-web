package com.sixsixsix516.controller.system.monitor;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.framework.vo.PageInfo;
import com.sixsixsix516.mapper.system.SysLogininforMapper;
import com.sixsixsix516.vo.Result;
import com.sixsixsix516.framework.service.SysLogininforService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.framework.annotation.Log;
import com.sixsixsix516.framework.enums.BusinessType;
import com.sixsixsix516.model.system.SysLogininfor;

/**
 * 系统访问记录
 *
 * @author SUN
 */
@RestController
@RequestMapping("/monitor/logininfor")
public class SysLogininforController {

	@Autowired
	private SysLogininforService logininforService;

	@PreAuthorize("@ss.hasPermi('monitor:logininfor:list')")
	@GetMapping("/list")
	public Result list(SysLogininfor logininfor, PageInfo pageInfo) {
		IPage<SysLogininfor> sysLogininforPage = logininforMapper.selectLogininforList(new Page(pageInfo.getPageNum(), pageInfo.getPageSize()), logininfor);
		return Result.ok(sysLogininforPage.getRecords(), sysLogininforPage.getTotal());
	}


	@PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
	@Log(title = "登陆日志", businessType = BusinessType.DELETE)
	@DeleteMapping("/{infoIds}")
	public Result remove(@PathVariable Long[] infoIds) {
		return Result.ok(logininforService.deleteLogininforByIds(infoIds));
	}

	@PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
	@Log(title = "登陆日志", businessType = BusinessType.CLEAN)
	@DeleteMapping("/clean")
	public Result clean() {
		logininforService.cleanLogininfor();
		return Result.ok();
	}

	@Autowired
	private SysLogininforMapper logininforMapper;
}
