package com.sixsixsix516.common.pay;

import lombok.Getter;

/**
 * @author SUN
 * @date 2021/10/26
 */
@Getter
public enum ClientType {

    /**
     * 微信小程序 - 用户端
     */
    MP_USER,

    /**
     * 微信小程序 - 师傅端
     */
    MP_MASTER,

    /**
     * 网站支付
     */
    WEB


}
