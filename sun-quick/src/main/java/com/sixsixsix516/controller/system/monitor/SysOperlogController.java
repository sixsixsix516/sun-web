package com.sixsixsix516.controller.system.monitor;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.framework.vo.PageInfo;
import com.sixsixsix516.mapper.system.SysOperLogMapper;
import com.sixsixsix516.vo.Result;
import com.sixsixsix516.framework.service.SysOperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.framework.annotation.Log;
import com.sixsixsix516.framework.enums.BusinessType;
import com.sixsixsix516.model.system.SysOperLog;

/**
 * 操作日志记录
 *
 * @author SUN
 */
@RestController
@RequestMapping("/monitor/operlog")
public class SysOperlogController {

	@Autowired
	private SysOperLogService operLogService;

	@PreAuthorize("@ss.hasPermi('monitor:operlog:list')")
	@GetMapping("/list")
	public Result list(SysOperLog operLog, PageInfo pageInfo) {
		IPage<SysOperLog> sysOperLogPage = sysOperLogMapper.selectOperLogList(new Page(pageInfo.getPageNum(), pageInfo.getPageSize()), operLog);
		return Result.ok(sysOperLogPage.getRecords(), sysOperLogPage.getTotal());
	}

	@PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
	@DeleteMapping("/{operIds}")
	public Result remove(@PathVariable Long[] operIds) {
		return Result.ok(operLogService.deleteOperLogByIds(operIds));
	}

	@Log(title = "操作日志", businessType = BusinessType.CLEAN)
	@PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
	@DeleteMapping("/clean")
	public Result clean() {
		operLogService.cleanOperLog();
		return Result.ok();
	}


	@Autowired
	private SysOperLogMapper sysOperLogMapper;
}
