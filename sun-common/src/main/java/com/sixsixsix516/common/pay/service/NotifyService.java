package com.sixsixsix516.common.pay.service;

import com.alibaba.fastjson.JSON;
import com.sixsixsix516.common.pay.entity.attach.Attach;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author SUN
 * @date 2021/5/7
 */
@RequiredArgsConstructor
@Slf4j
@Service
public class NotifyService {

    /**
     * 微信支付
     */
    public void wx(Map<String, String> result) {
        // 校验返回结果
        String returnMsg = result.get("return_msg");
        String returnCode = result.get("return_code");
        if (!StringUtils.isEmpty(returnMsg) || !"SUCCESS".equals(returnCode)) {
            log.info("微信回调发生错误 - {}", returnMsg);
            return;
        }
        // 过滤重复回调
        String orderId = result.get("out_trade_no");
        String key = "pay_notify_" + orderId;
        String value = stringRedisTemplate.opsForValue().get(key);
        if (!StringUtils.isEmpty(value)) {
            return;
        } else {
            // 一天内不处理重复回调, 微信的回调只会在一天内重复
            stringRedisTemplate.opsForValue().set(key, "OK", 10, TimeUnit.DAYS);
        }
        log.info("微信支付 回调 - {}", result);

        // 微信订单号
        String transactionId = result.get("transaction_id");
        if (StringUtils.isEmpty(transactionId)) {
            return;
        }
        String openId = result.get("openid");

        // 订单类型
        String attachStr = result.get("attach");
        Attach attach = JSON.parseObject(attachStr, Attach.class);

        handler(attach.getOrderType().getType(), attachStr, transactionId, openId);
    }


    private void handler(String orderType, String attach, String transactionId, String openId) {

    }


    private final StringRedisTemplate stringRedisTemplate;

}
