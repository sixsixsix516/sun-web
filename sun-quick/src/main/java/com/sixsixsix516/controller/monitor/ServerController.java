package com.sixsixsix516.controller.monitor;

import com.sixsixsix516.model.vo.Result;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.framework.web.domain.Server;

/**
 * 服务器监控
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/monitor/server")
public class ServerController {

	@PreAuthorize("@ss.hasPermi('monitor:server:list')")
	@GetMapping()
	public Result getInfo() throws Exception {
		Server server = new Server();
		server.copyTo();
		return Result.ok(server);
	}
}
