package com.sixsixsix516.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.common.core.constant.UserConstants;
import com.sixsixsix516.common.core.exception.CustomException;
import com.sixsixsix516.common.core.utils.ServletUtils;
import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.core.vo.PageInfo;
import com.sixsixsix516.common.mapper.system.SysRoleMapper;
import com.sixsixsix516.common.mapper.system.SysRoleMenuMapper;
import com.sixsixsix516.common.mapper.system.SysUserRoleMapper;
import com.sixsixsix516.common.model.system.SysRole;
import com.sixsixsix516.common.model.system.SysRoleMenu;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.model.LoginUser;
import com.sixsixsix516.manager.core.web.service.SysPermissionService;
import com.sixsixsix516.manager.core.web.service.TokenService;
import com.sixsixsix516.manager.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 角色 业务层处理
 */
@Service
@RequiredArgsConstructor
public class SysRoleService {

    public Result<List<SysRole>> list(SysRole role, PageInfo pageInfo) {
        IPage<SysRole> sysRolePage = roleMapper.selectRoleList(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()), role);
        return Result.ok(sysRolePage.getRecords(), sysRolePage.getTotal());
    }

    public Result<Void> edit(SysRole role) {
        checkRoleAllowed(role);
        if (UserConstants.NOT_UNIQUE.equals(checkRoleNameUnique(role))) {
            return Result.fail("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
        }
        role.setUpdateBy(SecurityUtils.getUsername());
        if (updateRole(role) > 0) {
            // 更新缓存用户权限
            LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
            if (StringUtils.isNotNull(loginUser.getUser()) && !loginUser.getUser().isAdmin()) {
                loginUser.setPermissions(permissionService.getMenuPermission(loginUser.getUser()));
                loginUser.setUser(userService.selectUserByUserName(loginUser.getUser().getRealname()));
                tokenService.setLoginUser(loginUser);
            }
            return Result.ok();
        }
        return Result.fail("修改角色'" + role.getRoleName() + "'失败，请联系管理员");
    }



    public Result<Void> optionSelect() {
        roleMapper.selectList(null);
        return Result.ok();
    }


    /**
     * 根据用户ID获取角色选择框列表
     *
     * @param userId 用户ID
     * @return 选中角色ID列表
     */
    public List<Integer> selectRoleListByUserId(Long userId) {
        return roleMapper.selectRoleListByUserId(userId);
    }

    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色对象信息
     */
    public Result<SysRole> selectRoleById(Long roleId) {
        return Result.ok(roleMapper.selectRoleById(roleId));
    }

    /**
     * 校验角色名称是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    public String checkRoleNameUnique(SysRole role) {
        long roleId = StringUtils.isNull(role.getRoleId()) ? -1L : role.getRoleId();
        SysRole info = roleMapper.checkRoleNameUnique(role.getRoleName());
        if (StringUtils.isNotNull(info) && info.getRoleId() != roleId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    public void checkRoleAllowed(SysRole role) {
        if (StringUtils.isNotNull(role.getRoleId()) && role.isAdmin()) {
            throw new CustomException("不允许操作超级管理员角色");
        }
    }

    /**
     * 通过角色ID查询角色使用数量
     *
     * @param roleId 角色ID
     * @return 结果
     */
    public int countUserRoleByRoleId(Long roleId) {
        return userRoleMapper.countUserRoleByRoleId(roleId);
    }

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Transactional
    public Result<Void> insertRole(SysRole role) {
        if (UserConstants.NOT_UNIQUE.equals(checkRoleNameUnique(role))) {
            return Result.fail("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        }
        role.setCreateBy(SecurityUtils.getUsername());

        // 新增角色信息
        roleMapper.insertRole(role);
        insertRoleMenu(role);
        return Result.ok();
    }

    /**
     * 修改保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    public int updateRole(SysRole role) {
        // 修改角色信息
        roleMapper.updateRole(role);
        // 删除角色与菜单关联
        roleMenuMapper.deleteRoleMenuByRoleId(role.getRoleId());
        return insertRoleMenu(role);
    }

    /**
     * 修改角色状态
     *
     * @param role 角色信息
     * @return 结果
     */
    public Result<Void> updateRoleStatus(SysRole role) {
        checkRoleAllowed(role);
        role.setUpdateBy(SecurityUtils.getUsername());
        roleMapper.updateRole(role);
        return Result.ok();
    }

    /**
     * 修改数据权限信息
     *
     * @param role 角色信息
     * @return 结果
     */
    public Result<Void> authDataScope(SysRole role) {
        checkRoleAllowed(role);
        // 修改角色信息
        roleMapper.updateRole(role);
        return Result.ok();
    }

    /**
     * 新增角色菜单信息
     *
     * @param role 角色对象
     */
    public int insertRoleMenu(SysRole role) {
        int rows = 1;
        // 新增用户与角色管理
        List<SysRoleMenu> list = new ArrayList<>();
        for (Long menuId : role.getMenuIds()) {
            SysRoleMenu rm = new SysRoleMenu();
            rm.setRoleId(role.getRoleId());
            rm.setMenuId(menuId);
            list.add(rm);
        }
        if (list.size() > 0) {
            rows = roleMenuMapper.batchRoleMenu(list);
        }
        return rows;
    }


    /**
     * 批量删除角色信息
     *
     * @param roleIds 需要删除的角色ID
     * @return 结果
     */
    public Result<Void> deleteRoleByIds(Long[] roleIds) {
        for (Long roleId : roleIds) {
            checkRoleAllowed(new SysRole(roleId));
            SysRole role = roleMapper.selectRoleById(roleId);
            if (countUserRoleByRoleId(roleId) > 0) {
                throw new CustomException(String.format("%1$s已分配,不能删除", role.getRoleName()));
            }
        }
        roleMapper.deleteRoleByIds(roleIds);
        return Result.ok();
    }

    private final SysRoleMapper roleMapper;
    private final SysRoleMenuMapper roleMenuMapper;
    private final SysUserRoleMapper userRoleMapper;
    private final TokenService tokenService;
    private final SysPermissionService permissionService;
    private final SysUserService userService;
}
