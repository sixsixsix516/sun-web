package com.sixsixsix516.controller.system;

import java.util.List;
import java.util.stream.Collectors;

import com.sixsixsix516.mapper.SysRoleMapper;
import com.sixsixsix516.model.vo.Result;
import com.sixsixsix516.service.SysRoleService;
import com.sixsixsix516.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.sixsixsix516.annotation.Log;
import com.sixsixsix516.constant.UserConstants;
import com.sixsixsix516.core.controller.BaseController;
import com.sixsixsix516.model.domain.entity.SysRole;
import com.sixsixsix516.model.domain.entity.SysUser;
import com.sixsixsix516.model.domain.model.LoginUser;
import com.sixsixsix516.core.page.TableDataInfo;
import com.sixsixsix516.enums.BusinessType;
import com.sixsixsix516.utils.SecurityUtils;
import com.sixsixsix516.utils.ServletUtils;
import com.sixsixsix516.utils.StringUtils;
import com.sixsixsix516.utils.poi.ExcelUtil;
import com.sixsixsix516.web.service.TokenService;

/**
 * 用户信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/user")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService userService;
	@Autowired
	private SysRoleService roleService;
	@Autowired
	private TokenService tokenService;

	/**
	 * 获取用户列表
	 */
	@PreAuthorize("@ss.hasPermi('system:user:list')")
	@GetMapping("/list")
	public TableDataInfo list(SysUser user) {
		startPage();
		List<SysUser> list = userService.selectUserList(user);
		return getDataTable(list);
	}

	@Log(title = "用户管理", businessType = BusinessType.EXPORT)
	@PreAuthorize("@ss.hasPermi('system:user:export')")
	@GetMapping("/export")
	public Result export(SysUser user) {
		List<SysUser> list = userService.selectUserList(user);
		ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
		return util.exportExcel(list, "用户数据");
	}

	@Log(title = "用户管理", businessType = BusinessType.IMPORT)
	@PreAuthorize("@ss.hasPermi('system:user:import')")
	@PostMapping("/importData")
	public Result importData(MultipartFile file, boolean updateSupport) throws Exception {
		ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
		List<SysUser> userList = util.importExcel(file.getInputStream());
		LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
		String operName = loginUser.getUsername();
		String message = userService.importUser(userList, updateSupport, operName);
		return Result.success(message);
	}

	@GetMapping("/importTemplate")
	public Result importTemplate() {
		ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
		return util.importTemplateExcel("用户数据");
	}

	/**
	 * 根据用户编号获取详细信息
	 */
	@PreAuthorize("@ss.hasPermi('system:user:query')")
	@GetMapping(value = {"/", "/{userId}"})
	public Result getInfo(@PathVariable(value = "userId", required = false) Long userId) {
		Result ajax = Result.success();
		List<SysRole> roles = sysRoleMapper.selectList(null);
		ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
		if (StringUtils.isNotNull(userId)) {
			ajax.put(Result.DATA_TAG, userService.selectUserById(userId));
			ajax.put("roleIds", roleService.selectRoleListByUserId(userId));
		}
		return ajax;
	}

	/**
	 * 新增用户
	 */
	@PreAuthorize("@ss.hasPermi('system:user:add')")
	@Log(title = "用户管理", businessType = BusinessType.INSERT)
	@PostMapping
	public Result add(@Validated @RequestBody SysUser user) {
		if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserName()))) {
			return Result.error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
		} else if (UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
			return Result.error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
		} else if (UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
			return Result.error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
		}
		user.setCreateBy(SecurityUtils.getUsername());
		user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
		return toAjax(userService.insertUser(user));
	}

	/**
	 * 修改用户
	 */
	@PreAuthorize("@ss.hasPermi('system:user:edit')")
	@Log(title = "用户管理", businessType = BusinessType.UPDATE)
	@PutMapping
	public Result edit(@Validated @RequestBody SysUser user) {
		userService.checkUserAllowed(user);
		if (UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
			return Result.error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
		} else if (UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
			return Result.error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
		}
		user.setUpdateBy(SecurityUtils.getUsername());
		return toAjax(userService.updateUser(user));
	}

	/**
	 * 删除用户
	 */
	@PreAuthorize("@ss.hasPermi('system:user:remove')")
	@Log(title = "用户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
	public Result remove(@PathVariable Long[] userIds) {
		return toAjax(userService.deleteUserByIds(userIds));
	}

	/**
	 * 重置密码
	 */
	@PreAuthorize("@ss.hasPermi('system:user:edit')")
	@Log(title = "用户管理", businessType = BusinessType.UPDATE)
	@PutMapping("/resetPwd")
	public Result resetPwd(@RequestBody SysUser user) {
		userService.checkUserAllowed(user);
		user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
		user.setUpdateBy(SecurityUtils.getUsername());
		return toAjax(userService.resetPwd(user));
	}

	/**
	 * 状态修改
	 */
	@PreAuthorize("@ss.hasPermi('system:user:edit')")
	@Log(title = "用户管理", businessType = BusinessType.UPDATE)
	@PutMapping("/changeStatus")
	public Result changeStatus(@RequestBody SysUser user) {
		userService.checkUserAllowed(user);
		user.setUpdateBy(SecurityUtils.getUsername());
		return toAjax(userService.updateUserStatus(user));
	}

	@Autowired
	private SysRoleMapper sysRoleMapper;
}
