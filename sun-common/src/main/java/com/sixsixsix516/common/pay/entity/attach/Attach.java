package com.sixsixsix516.common.pay.entity.attach;

import com.sixsixsix516.common.pay.entity.OrderType;
import lombok.Data;

/**
 * 支付附加数据
 *
 * @author SUN
 * @date 2021/9/13
 */
@Data
public class Attach {

    /**
     * 必填
     */
    private String orderNo;

    /**
     * 必填
     */
    private OrderType orderType;
}
