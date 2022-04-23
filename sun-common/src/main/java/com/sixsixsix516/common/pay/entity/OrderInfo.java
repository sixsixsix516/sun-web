package com.sixsixsix516.common.pay.entity;

import com.sixsixsix516.common.constant.WxProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 预订单
 *
 * @author sun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuppressWarnings("all")
public class OrderInfo {

	/**
	 * 小程序ID
	 */
    private String appid;
	/**
	 * 商户号
	 */
    private String mch_id = WxProperties.MCH_ID;
	/**
	 * 随机字符串
	 */
    private String nonce_str;
	/**
	 * 签名类型
	 */
	private String sign_type = "MD5";
	/**
	 * 签名
	 */
    private String sign;
	/**
	 * 商品描述
	 */
	private String body;
	/**
	 * 商户订单号
	 */
    private String out_trade_no;
	/**
	 * 标价金额 ,单位为分
	 */
	private int total_fee;
	/**
	 * 终端IP
	 */
    private String spbill_create_ip;

	/**
	 * 通知地址
	 */
	private String notify_url;
	/**
	 * 交易类型
	 */
    private String trade_type = "JSAPI";
	/**
	 * 用户标识
	 */
	private String openid;

	/**
	 * 附加数据
	 */
	private String attach;

}
