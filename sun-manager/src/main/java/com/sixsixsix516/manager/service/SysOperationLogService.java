package com.sixsixsix516.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.model.system.SysOperationLog;
import com.sixsixsix516.common.vo.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.sixsixsix516.common.mapper.system.SysOperationLogMapper;

import java.util.List;

/**
 * 操作日志 服务层处理
 *
 * @author SUN
 */
@Service
@RequiredArgsConstructor
public class SysOperationLogService {

    public Result<List<SysOperationLog>> list(SysOperationLog sysOperationLog, PageInfo pageInfo) {
        IPage<SysOperationLog> sysOperationLogPage = sysOperationLogMapper.selectOperLogList(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()), sysOperationLog);
        return Result.ok(sysOperationLogPage.getRecords(), sysOperationLogPage.getTotal());
    }


    /**
     * 新增操作日志
     */
    public void insertOperationLog(SysOperationLog sysOperationLog) {
        sysOperationLogMapper.insertOperlog(sysOperationLog);
    }

    /**
     * 批量删除系统操作日志
     */
    public Result<Void> deleteOperationLogByIds(Long[] operIds) {
        sysOperationLogMapper.deleteOperLogByIds(operIds);
        return Result.ok();
    }

    /**
     * 清空操作日志
     */
    public Result<Void> cleanOperationLog() {
        sysOperationLogMapper.cleanOperLog();
        return Result.ok();
    }


    private final SysOperationLogMapper sysOperationLogMapper;

}
