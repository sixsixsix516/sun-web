package com.sixsixsix516.common.pay.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sixsixsix516.common.constant.SystemPathConstant;
import com.sixsixsix516.common.constant.WxProperties;
import com.sixsixsix516.common.core.utils.DateUtils;
import com.sixsixsix516.common.pay.ClientType;
import com.sixsixsix516.common.pay.entity.OrderInfo;
import com.sixsixsix516.common.pay.entity.OrderType;
import com.sixsixsix516.common.pay.entity.Refund;
import com.sixsixsix516.common.pay.entity.attach.Attach;
import com.sixsixsix516.common.utils.EnvUtil;
import com.sixsixsix516.common.utils.HttpUtil;
import com.sixsixsix516.common.utils.OsUtil;
import com.sixsixsix516.common.utils.md5.MD5;
import com.sixsixsix516.common.vo.Result;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.sql.Timestamp;
import java.util.*;


/**
 * 微信工具类
 *
 * @author sun 2020/5/11 15:47
 */
@Slf4j
public class WxPayUtil {

    /**
     * 微信统一下单
     */
    public static Result createOrder(Attach attach, String openId, BigDecimal payPrice, ClientType clientType) {
        if (EnvUtil.isTest) {
            payPrice = new BigDecimal("0.01");
        }
        String orderNo = attach.getOrderNo();
        OrderType orderType = attach.getOrderType();

        OrderInfo order = new OrderInfo();

        if (clientType == ClientType.MP_USER) {
            order.setAppid(WxProperties.USER_SMART_APP_ID);
        } else if (clientType == ClientType.MP_MASTER) {
            order.setAppid(WxProperties.MASTER_SMART_APP_ID);
        } else if (clientType == ClientType.WEB) {
            order.setTrade_type("NATIVE");
            order.setAppid(WxProperties.NATIVE_APP_ID);
        }

        order.setNotify_url(SystemPathConstant.PROJECT_PATH + "/user/pay/notify/wx");

        // 价格单位为分,不能有小数
        String orderAmountStr = payPrice.multiply(new BigDecimal("100")).toString();
        if (orderAmountStr.contains(".")) {
            orderAmountStr = orderAmountStr.substring(0, orderAmountStr.indexOf("."));
        }
        order.setTotal_fee(Integer.parseInt(orderAmountStr));

        order.setNonce_str(generateUUID());
        order.setBody(OsUtil.isWindows() ? "test" : orderType.getGoodDesc());
        order.setOut_trade_no(orderNo);

        order.setSpbill_create_ip(getIpAddress());
        order.setOpenid(openId);
        order.setAttach(JSON.toJSONString(attach));
        //生成签名
        order.setSign(getSign(order));

        JSONObject result = HttpUtil.postXml(SystemPathConstant.WX_PAY_UNIFIED_ORDER_URL, order, JSONObject.class);
        String returnMsg = (String) result.get("return_code");
        if (!"SUCCESS".equals(returnMsg)) {
            log.info("微信统一下单 发生错误 - {}", returnMsg);
            return Result.fail();
        }
        Map<String, String> map = new HashMap<>(11);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String timestampNumber = timestamp.getTime() + "";
        timestampNumber = timestampNumber.substring(0, timestampNumber.length() - 3);

        map.put("appId", order.getAppid());
        map.put("timeStamp", timestampNumber);
        map.put("nonceStr", getRandomStringByLength());
        map.put("package", "prepay_id=" + result.getString("prepay_id"));
        map.put("signType", "MD5");
        map.put("sign", getSignForPayResultForMap(map));

        map.put("key", WxProperties.KEY);
        map.put("messageInfo", "调用成功");
        map.put("partnerid", WxProperties.MCH_ID);
        map.put("prepayid", result.getString("prepay_id"));
        map.put("orderId", orderNo);
        map.put("codeUrl", result.getString("code_url"));
        return Result.ok(map);
    }


    /**
     * 订单退款
     */
    public static boolean refund(String outTradeNo, String outRefundNo, BigDecimal originAmount, BigDecimal amount) {
        Refund refund = new Refund();
        refund.setAppid(WxProperties.USER_SMART_APP_ID);
        refund.setMch_id(WxProperties.MCH_ID);
        refund.setNonce_str(generateUUID());
        refund.setOut_trade_no(outTradeNo);
        refund.setOut_refund_no(outRefundNo);
        refund.setTotal_fee(originAmount.multiply(BigDecimal.valueOf(100)).stripTrailingZeros().toPlainString());
        refund.setRefund_desc("主动退款");
        refund.setRefund_fee(amount.multiply(BigDecimal.valueOf(100)).stripTrailingZeros().toPlainString());
        refund.setSign(getSign(refund));
        String result = XmlUtil.toJSONStr(HttpUtil.sendWxPostWithSSL(SystemPathConstant.WX_REFUND_ORDER_URL, refund));
        log.info("微信退款返回值: {}", result);
        JSONObject resultJSON = JSON.parseObject(result);
        String returnMsg = resultJSON.getString("result_code");
        boolean success = "SUCCESS".equals(returnMsg);
        if (!success) {
            // 提现失败
            String errorMsg = resultJSON.getString("err_code_des");
//            FeiShuUtil.sendTxt("[订单退款出现问题] 用户退款出现问题, 原因: " + errorMsg);
        }
        return success;
    }


    ///================ 工具区  ================
    static String getIpAddress() {
        try {
            Enumeration<NetworkInterface> allNetInterfaces = NetworkInterface.getNetworkInterfaces();
            InetAddress ip = null;
            while (allNetInterfaces.hasMoreElements()) {
                NetworkInterface netInterface = allNetInterfaces.nextElement();
                if (netInterface.isLoopback() || netInterface.isVirtual() || !netInterface.isUp()) {
                } else {
                    Enumeration<InetAddress> addresses = netInterface.getInetAddresses();
                    while (addresses.hasMoreElements()) {
                        ip = addresses.nextElement();
                        if (ip instanceof Inet4Address) {
                            return ip.getHostAddress();
                        }
                    }
                }
            }
        } catch (Exception ignored) {
        }
        return "127.0.0.1";
    }


    /**
     * 获取一定长度的随机字符串
     *
     * @return 一定长度的字符串
     */
    static String getRandomStringByLength() {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 32; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    private static String getSign(Object o) {
        ArrayList<String> list = new ArrayList<>();
        Class cls = o.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            try {
                if (f.get(o) != null && f.get(o) != "") {
                    String name = f.getName();
                    XStreamAlias anno = f.getAnnotation(XStreamAlias.class);
                    if (anno != null) {
                        name = anno.value();
                    }
                    list.add(name + "=" + f.get(o) + "&");
                }
            } catch (IllegalAccessException e) {
                return "";
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "key=" + WxProperties.KEY;
        result = MD5.MD5Encode(result).toUpperCase();
        return result;
    }

    private static String getSignForPayResultForMap(Map<String, String> map) {
        ArrayList<String> list = new ArrayList<String>(map.size());
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (!"".equals(entry.getValue())) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb + "key=" + WxProperties.KEY;
        return MD5.MD5Encode(result).toUpperCase();
    }


    /**
     * 生成订单号
     */

    public static String generateOrderNo(String orderNoPrefix) {
        return orderNoPrefix + DateUtils.getOrderNoCurrentDate() + random(3);
    }


    /**
     * 生成 uuid， 即用来标识一笔单，也用做 nonce_str
     */

    private static String generateUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 32).toUpperCase();
    }

    private static String random(int length) {
        StringBuilder randomStr = new StringBuilder();
        for (int i = 0; i < length; i++) {
            randomStr.append(new Random().nextInt(9));
        }
        return randomStr.toString();
    }

}

