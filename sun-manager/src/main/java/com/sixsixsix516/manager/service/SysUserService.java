package com.sixsixsix516.manager.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sixsixsix516.common.model.system.SysRole;
import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.common.core.exception.CustomException;
import com.sixsixsix516.common.mapper.system.SysRoleMapper;
import com.sixsixsix516.common.mapper.system.SysUserMapper;
import com.sixsixsix516.common.mapper.system.SysUserRoleMapper;
import com.sixsixsix516.common.model.system.SysUserRole;
import com.sixsixsix516.manager.util.SecurityUtils;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * 用户 业务层处理
 *
 * @author SUN
 */
@Service
public class SysUserService {


    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByUserName(String userName) {
        return sysUserMapper.selectUserByUserName(userName);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(Long userId) {
        return sysUserMapper.selectUserById(userId);
    }

    /**
     * 查询用户所属角色组
     *
     * @param userName 用户名
     * @return 结果
     */
    public String selectUserRoleGroup(String userName) {
        List<SysRole> list = roleMapper.selectRolesByUserName(userName);
        StringBuffer idsStr = new StringBuffer();
        for (SysRole role : list) {
            idsStr.append(role.getRoleName()).append(",");
        }
        if (StringUtils.isNotEmpty(idsStr.toString())) {
            return idsStr.substring(0, idsStr.length() - 1);
        }
        return idsStr.toString();
    }

    /**
     * 校验用户是否允许操作
     *
     * @param user 用户信息
     */
    public void checkUserAllowed(SysUser user) {
        if (StringUtils.isNotNull(user.getUserId()) && user.isAdmin()) {
            throw new CustomException("不允许操作超级管理员用户");
        }
    }

    /**
     * 新增保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional
    public Result insertUser(SysUser user) {
        if (sysUserMapper.selectCount(new QueryWrapper<SysUser>().lambda().eq(SysUser::getRealname, user.getRealname())) > 0) {
            return Result.fail("新增用户'" + user.getRealname() + "'失败，姓名已存在");
        }
        if (sysUserMapper.selectCount(new QueryWrapper<SysUser>().lambda().eq(SysUser::getPhone, user.getPhone())) > 0) {
            return Result.fail("新增用户'" + user.getRealname() + "'失败，手机号码已存在");
        }
        if (sysUserMapper.selectCount(new QueryWrapper<SysUser>().lambda().eq(SysUser::getEmail, user.getEmail())) > 0) {
            return Result.fail("新增用户'" + user.getRealname() + "'失败，邮箱账号已存在");
        }
        user.setCreateBy(SecurityUtils.getUsername());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));

        // 新增用户信息
        sysUserMapper.insert(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return Result.ok();
    }

    /**
     * 修改保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional
    public int updateUser(SysUser user) {
        Long userId = user.getUserId();
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 新增用户与角色管理
        insertUserRole(user);
        user.setPassword(null);
        return sysUserMapper.updateById(user);
    }

    /**
     * 修改用户状态
     *
     * @param user 用户信息
     * @return 结果
     */
    public int updateUserStatus(SysUser user) {
        return sysUserMapper.updateById(user);
    }

    /**
     * 修改用户基本信息
     *
     * @param user 用户信息
     * @return 结果
     */
    public int updateUserProfile(SysUser user) {
        return sysUserMapper.updateById(user);
    }

    /**
     * 修改用户头像
     *
     * @param userName 用户名
     * @param avatar   头像地址
     * @return 结果
     */
    public boolean updateUserAvatar(String userName, String avatar) {
        return sysUserMapper.updateUserAvatar(userName, avatar) > 0;
    }

    /**
     * 重置用户密码
     *
     * @param user 用户信息
     * @return 结果
     */
    public int resetPwd(SysUser user) {
        return sysUserMapper.updateById(user);
    }

    /**
     * 重置用户密码
     *
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(String userName, String password) {
        return sysUserMapper.resetUserPwd(userName, password);
    }

    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void insertUserRole(SysUser user) {
        Arrays.stream(user.getRoleIds()).forEach(roleId -> userRoleMapper.insert(new SysUserRole(user.getUserId(), roleId)));
    }

    /**
     * 批量删除用户信息
     */
    public Result deleteUserByIds(List<Long> userIds) {
        userIds.forEach(userId -> {
            // 不允许删除超级管理员
            checkUserAllowed(new SysUser(userId));
            // 删除用户
            sysUserMapper.deleteById(userId);
            // 删除用户角色关联
            userRoleMapper.delete(new QueryWrapper<SysUserRole>().lambda().eq(SysUserRole::getUserId,userId));
        });
        return Result.ok();
    }


    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysRoleMapper roleMapper;
    @Autowired
    private SysUserRoleMapper userRoleMapper;
}
