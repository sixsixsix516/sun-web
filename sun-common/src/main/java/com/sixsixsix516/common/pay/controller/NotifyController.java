package com.sixsixsix516.common.pay.controller;

import com.sixsixsix516.common.pay.service.NotifyService;
import com.sixsixsix516.common.pay.util.XmlUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 支付回调
 *
 * @author SUN
 * @date 2021/5/7
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/pay/notify")
public class NotifyController {

    @RequestMapping("/wx")
    public void wx() {
        Map<String, String> data = getData();
        if (data != null) {
            notifyService.wx(data);
        }
    }

    private Map<String, String> getData() {
        try {
            return XmlUtil.parseXml(request.getInputStream());
        } catch (Exception e) {
            return null;
        }
    }

    private final NotifyService notifyService;
    private final HttpServletRequest request;

}
