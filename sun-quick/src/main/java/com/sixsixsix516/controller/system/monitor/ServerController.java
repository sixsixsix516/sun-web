package com.sixsixsix516.controller.system.monitor;

import com.sixsixsix516.vo.Result;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sixsixsix516.framework.web.domain.Server;

/**
 * 服务器监控
 *
 * @author SUN
 */
@RestController
@RequestMapping("/monitor/server")
public class ServerController {

    @GetMapping()
    @PreAuthorize("@ss.hasPermi('monitor:server:list')")
    public Result getInfo() {
        try {
            Server server = new Server();
            server.copyTo();
            return Result.ok(server);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.fail();
        }
    }
}
