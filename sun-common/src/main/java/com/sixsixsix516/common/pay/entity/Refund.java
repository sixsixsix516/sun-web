package com.sixsixsix516.common.pay.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 微信退款对象
 *
 * @author SUN
 * @date 2021/11/5
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Refund {

    /**
     * 公众账号ID
     */
    private String appid;

    /**
     * 商户号
     */
    private String mch_id;

    /**
     * 随机字符串
     */
    private String nonce_str;

    /**
     * 商户订单号
     */
    private String out_trade_no;

    /**
     * 商户退款订单号
     */
    private String out_refund_no;

    /**
     * 订单金额
     */
    private String total_fee;

    /**
     * 退款原因
     */
    private String refund_desc;

    /**
     * 退款金额
     */
    private String refund_fee;

    /**
     * 签名
     */
    private String sign;

}
