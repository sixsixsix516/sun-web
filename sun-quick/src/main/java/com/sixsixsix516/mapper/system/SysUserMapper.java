package com.sixsixsix516.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;
import com.sixsixsix516.model.system.SysUser;

/**
 * 用户表 数据层
 *
 * @author SUN
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

	IPage<SysUser> listUser(IPage<SysUser> page, SysUser sysUser);

	/**
	 * 通过用户名查询用户
	 *
	 * @param userName 用户名
	 * @return 用户对象信息
	 */
	SysUser selectUserByUserName(String userName);

	/**
	 * 通过用户ID查询用户
	 *
	 * @param userId 用户ID
	 * @return 用户对象信息
	 */
	SysUser selectUserById(Long userId);

	/**
	 * 修改用户头像
	 *
	 * @param userName 用户名
	 * @param avatar   头像地址
	 * @return 结果
	 */
	int updateUserAvatar(@Param("userName") String userName, @Param("avatar") String avatar);

	/**
	 * 重置用户密码
	 *
	 * @param userName 用户名
	 * @param password 密码
	 * @return 结果
	 */
	int resetUserPwd(@Param("userName") String userName, @Param("password") String password);
}
