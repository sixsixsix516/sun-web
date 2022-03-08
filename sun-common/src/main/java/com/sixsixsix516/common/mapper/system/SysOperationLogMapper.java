package com.sixsixsix516.common.mapper.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sixsixsix516.common.model.system.SysOperationLog;
import org.apache.ibatis.annotations.Param;

/**
 * 操作日志 数据层
 *
 * @author SUN
 */
public interface SysOperationLogMapper {
    /**
     * 新增操作日志
     *
     * @param operLog 操作日志对象
     */
    void insertOperlog(SysOperationLog operLog);

    /**
     * 查询系统操作日志集合
     */
    IPage<SysOperationLog> selectOperLogList(IPage<SysOperationLog> page, @Param("operLog") SysOperationLog sysOperationLog);

    /**
     * 批量删除系统操作日志
     *
     * @param operIds 需要删除的操作日志ID
     * @return 结果
     */
    int deleteOperLogByIds(Long[] operIds);

    /**
     * 查询操作日志详细
     *
     * @param operId 操作ID
     * @return 操作日志对象
     */
    SysOperationLog selectOperLogById(Long operId);

    /**
     * 清空操作日志
     */
    void cleanOperLog();
}
