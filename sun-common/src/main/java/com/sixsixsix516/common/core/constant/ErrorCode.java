package com.sixsixsix516.common.core.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author sun 2020/5/20 15:40
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum ErrorCode {


    /**
     * 当参数不正确时返回此错误码
     * message第一个占位符为参数名,第二个占位符为错误描述
     */
    PARAM_ERROR(-1, "参数%s: %s"),

    /**
     * 当用户使用微信登录时,如果未绑定手机号则返回此错误码
     */
    NOT_BIND_PHONE(3000, "未绑定手机号"),


    ORDER_PAY_ERROR(4000, "订单支付错误"),

    USER_STOP_WORK(4001, "您已停工")


    ;

    int code;
    String message;

}
