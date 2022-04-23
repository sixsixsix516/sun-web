package com.sixsixsix516.common.constant;

/**
 * @author sun 2020/3/20 10:07
 */
public interface WxProperties {

    // ===================================== 小程序信息 ===============================================

    /**
     * 用户端: 小程序APPID
     */
    String USER_SMART_APP_ID = "";
    /**
     * 用户端: 小程序APP密钥
     */
    String USER_SMART_APP_SECRET = "";

    /**
     * 陪诊员端: 小程序APPID
     */
    String MASTER_SMART_APP_ID = "";
    /**
     * 陪诊员端: 小程序APP密钥
     */
    String MASTER_SMART_APP_SECRET = "";

    /**
     * native方式支付的appid
     */
    String NATIVE_APP_ID = "";


    // ===================================== 移动端信息 ===============================================

    /**
     * 移动 用户端  APPID
     */
    String USER_APP_ID = "";


    /**
     * 移动 服务端 APPID
     */
    String OPERATOR_APP_ID = "";


    /**
     * 移动端APP密钥(服务端)
     */
    String MOBILE_APP_SECRET = "";


    // ===================================== 商户信息 ===============================================

    /**
     * 商户号
     */
    String MCH_ID = "";

    /**
     * 微信支付key(密钥)
     */
    String KEY = "";


    // ===================================== 通用 ===============================================

    /**
     * 支付回调地址
     */
    String PAY_NOTIFY_URL = "http://127.0.0.1:8080" + "/notify/wx";
    String SESSION_HOST = "https://api.weixin.qq.com/sns/jscode2session?appid={appid}&secret={srcret}&js_code={code}&grant_type={grantType}";
    String GRANT_TYPE = "authorization_code";


}
