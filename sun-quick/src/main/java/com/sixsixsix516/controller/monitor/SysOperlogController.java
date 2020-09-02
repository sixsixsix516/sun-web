package com.sixsixsix516.controller.monitor;

import java.util.List;

import com.sixsixsix516.model.vo.Result;
import com.sixsixsix516.service.SysOperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.annotation.Log;
import com.sixsixsix516.core.controller.BaseController;
import com.sixsixsix516.core.page.TableDataInfo;
import com.sixsixsix516.enums.BusinessType;
import com.sixsixsix516.utils.poi.ExcelUtil;
import com.sixsixsix516.model.SysOperLog;

/**
 * 操作日志记录
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/monitor/operlog")
public class SysOperlogController extends BaseController {

	@Autowired
	private SysOperLogService operLogService;

	@PreAuthorize("@ss.hasPermi('monitor:operlog:list')")
	@GetMapping("/list")
	public TableDataInfo list(SysOperLog operLog) {
		startPage();
		List<SysOperLog> list = operLogService.selectOperLogList(operLog);
		return getDataTable(list);
	}

	@Log(title = "操作日志", businessType = BusinessType.EXPORT)
	@PreAuthorize("@ss.hasPermi('monitor:operlog:export')")
	@GetMapping("/export")
	public Result export(SysOperLog operLog) {
		List<SysOperLog> list = operLogService.selectOperLogList(operLog);
		ExcelUtil<SysOperLog> util = new ExcelUtil<SysOperLog>(SysOperLog.class);
		return util.exportExcel(list, "操作日志");
	}

	@PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
	@DeleteMapping("/{operIds}")
	public Result remove(@PathVariable Long[] operIds) {
		return toAjax(operLogService.deleteOperLogByIds(operIds));
	}

	@Log(title = "操作日志", businessType = BusinessType.CLEAN)
	@PreAuthorize("@ss.hasPermi('monitor:operlog:remove')")
	@DeleteMapping("/clean")
	public Result clean() {
		operLogService.cleanOperLog();
		return Result.success();
	}
}
