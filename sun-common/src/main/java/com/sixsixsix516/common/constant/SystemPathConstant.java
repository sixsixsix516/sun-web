package com.sixsixsix516.common.constant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * 系统常量
 *
 * @author SUN
 * @date 2021/3/14
 */
@Configuration
public class SystemPathConstant {

    /// ================== 微信支付 ===================

    /**
     * 微信 - 统一下单
     */
    public static final String WX_PAY_UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    /**
     * 微信 - 退款
     */
    public static final String WX_REFUND_ORDER_URL = "https://api.mch.weixin.qq.com/secapi/pay/refund";

    /**
     * 当前项目的访问前缀
     */
    public static String PROJECT_PATH = null;



    @Value("${path.project_path}")
    public void setProjectPath(String projectPath) {
        PROJECT_PATH = projectPath;
    }
}
