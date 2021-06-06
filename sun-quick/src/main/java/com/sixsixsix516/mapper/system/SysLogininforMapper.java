package com.sixsixsix516.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sixsixsix516.model.system.SysLogininfor;
import org.apache.ibatis.annotations.Param;

/**
 * 系统访问日志情况信息 数据层
 *
 * @author SUN
 */
public interface SysLogininforMapper extends BaseMapper<SysLogininfor> {

	/**
	 * 查询系统登录日志集合
	 *
	 * @param logininfor 访问日志对象
	 * @return 登录记录集合
	 */
	IPage<SysLogininfor> selectLogininforList(IPage<SysLogininfor> page, @Param("logininfor") SysLogininfor logininfor);

	/**
	 * 批量删除系统登录日志
	 *
	 * @param infoIds 需要删除的登录日志ID
	 * @return 结果
	 */
	public int deleteLogininforByIds(Long[] infoIds);

	/**
	 * 清空系统登录日志
	 *
	 * @return 结果
	 */
	public int cleanLogininfor();
}
