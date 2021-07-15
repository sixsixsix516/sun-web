package com.sixsixsix516.controller.system.tool;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.sixsixsix516.vo.Result;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.framework.utils.StringUtils;

/**
 * swagger 用户测试方法
 *
 * @author SUN
 */
@RestController
@RequestMapping("/test/user")
public class TestController {

	private final static Map<Integer, UserEntity> users = new LinkedHashMap<Integer, UserEntity>();

	{
		users.put(1, new UserEntity(1, "admin", "admin123", "15888888888"));
		users.put(2, new UserEntity(2, "ry", "admin123", "15666666666"));
	}

	@GetMapping("/list")
	public Result userList() {
		List<UserEntity> userList = new ArrayList<UserEntity>(users.values());
		return Result.ok(userList);
	}

	@GetMapping("/{userId}")
	public Result getUser(@PathVariable Integer userId) {
		if (!users.isEmpty() && users.containsKey(userId)) {
			return Result.ok(users.get(userId));
		} else {
			return Result.fail("用户不存在");
		}
	}

	@PostMapping("/save")
	public Result save(UserEntity user) {
		if (StringUtils.isNull(user) || StringUtils.isNull(user.getUserId())) {
			return Result.fail("用户ID不能为空");
		}
		return Result.ok(users.put(user.getUserId(), user));
	}

	@PutMapping("/update")
	public Result update(UserEntity user) {
		if (StringUtils.isNull(user) || StringUtils.isNull(user.getUserId())) {
			return Result.fail("用户ID不能为空");
		}
		if (users.isEmpty() || !users.containsKey(user.getUserId())) {
			return Result.fail("用户不存在");
		}
		users.remove(user.getUserId());
		return Result.ok(users.put(user.getUserId(), user));
	}

	@DeleteMapping("/{userId}")
	public Result delete(@PathVariable Integer userId) {
		if (!users.isEmpty() && users.containsKey(userId)) {
			users.remove(userId);
			return Result.ok();
		} else {
			return Result.fail("用户不存在");
		}
	}
}

@Data
@AllArgsConstructor
@NoArgsConstructor
class UserEntity {

	private Integer userId;

	private String username;

	private String password;

	private String mobile;

}
