package com.sixsixsix516.common.pay.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 支付订单类型
 *
 * @author sun 2020/5/29 11:25
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum OrderType {

    /**
     * 支付订单
     */
    PAY_ORDER("1", "支付订单"),


    ;
    String type;
    String goodDesc;

}
