package com.sixsixsix516.manager.controller.system;

import java.util.HashMap;

import com.sixsixsix516.manager.service.SysUserService;
import com.sixsixsix516.manager.core.web.service.TokenService;
import com.sixsixsix516.common.vo.Result;
import com.sixsixsix516.manager.core.model.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.sixsixsix516.common.core.annotation.Log;
import com.sixsixsix516.common.model.system.SysUser;
import com.sixsixsix516.common.core.enums.BusinessType;
import com.sixsixsix516.manager.util.SecurityUtils;
import com.sixsixsix516.common.core.utils.ServletUtils;

/**
 * 个人信息 业务处理
 */
@RestController
@RequestMapping("/system/user/profile")
public class SysProfileController {


	@Autowired
	private SysUserService userService;
	@Autowired
	private TokenService tokenService;

	/**
	 * 个人信息
	 */
	@GetMapping
	public Result profile() {
		LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
		return Result.ok(new HashMap<String, Object>(2) {{
			put("user", loginUser.getUser());
			put("roleGroup", userService.selectUserRoleGroup(loginUser.getUsername()));
		}});
	}

	/**
	 * 修改用户
	 */
	@Log(title = "个人信息", businessType = BusinessType.UPDATE)
	@PutMapping
	public Result updateProfile(@RequestBody SysUser user) {
		if (userService.updateUserProfile(user) > 0) {
			LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
			// 更新缓存用户信息
			loginUser.getUser().setRealname(user.getRealname());
			loginUser.getUser().setPassword(user.getPhone());
			loginUser.getUser().setEmail(user.getEmail());
			loginUser.getUser().setSex(user.getSex());
			tokenService.setLoginUser(loginUser);
			return Result.ok();
		}
		return Result.fail("修改个人信息异常，请联系管理员");
	}

	/**
	 * 重置密码
	 */
	@Log(title = "个人信息", businessType = BusinessType.UPDATE)
	@PutMapping("/updatePwd")
	public Result updatePwd(String oldPassword, String newPassword) {
		LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
		String userName = loginUser.getUsername();
		String password = loginUser.getPassword();
		if (!SecurityUtils.matchesPassword(oldPassword, password)) {
			return Result.fail("修改密码失败，旧密码错误");
		}
		if (SecurityUtils.matchesPassword(newPassword, password)) {
			return Result.fail("新密码不能与旧密码相同");
		}
		if (userService.resetUserPwd(userName, SecurityUtils.encryptPassword(newPassword)) > 0) {
			// 更新缓存用户密码
			loginUser.getUser().setPassword(SecurityUtils.encryptPassword(newPassword));
			tokenService.setLoginUser(loginUser);
			return Result.ok();
		}
		return Result.fail("修改密码异常，请联系管理员");
	}

	/**
	 * 头像上传
	 */
	@Log(title = "用户头像", businessType = BusinessType.UPDATE)
	@PostMapping("/avatar")
	public Result avatar(@RequestParam("avatarfile") MultipartFile file) {
		if (!file.isEmpty()) {
			LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
			// todo
			String avatar = "";
			if (userService.updateUserAvatar(loginUser.getUsername(), avatar)) {
				Result ajax = Result.ok();
				// 更新缓存用户头像
				loginUser.getUser().setAvatar(avatar);
				tokenService.setLoginUser(loginUser);
				return ajax;
			}
		}
		return Result.fail("上传图片异常，请联系管理员");
	}
}
