package com.sixsixsix516.common.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sixsixsix516.common.constant.WxProperties;
import com.sixsixsix516.common.pay.util.XmlUtil;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;

/**
 * @author SUN
 * @date 2021/3/15
 */
@Slf4j
public class HttpUtil {

    private static final RestTemplate REST_TEMPLATE = new RestTemplate();

    static {
        REST_TEMPLATE.getMessageConverters().set(1, new StringHttpMessageConverter(StandardCharsets.UTF_8));
    }

    /**
     * 发送POST JSON请求
     *
     * @param url  请求地址
     * @param data 请求数据
     */
    public static JSONObject post(String url, Object data) {
        return post(url, data, JSONObject.class);
    }

    /**
     * 发送POST JSON请求
     *
     * @param url         请求地址
     * @param data        请求数据
     * @param returnClass 返回类型
     */
    public static <T> T post(String url, Object data, Class<T> returnClass) {
        log.info("发送HTTP post请求 url: {},data: {}", url, data);
        String resultStr = REST_TEMPLATE.postForObject(url, data, String.class);
        log.info("HTTP POST请求返回数据: {}", resultStr);
        return JSON.parseObject(resultStr, returnClass);
    }

    /**
     * 发送GET请求
     */
    public static <T> T get(String url, Class<T> returnClass) {
        log.info("发送HTTP GET请求 url: {}", url);
        String resultStr = REST_TEMPLATE.getForObject(URI.create(url), String.class);
        log.info("HTTP GET请求返回数据: {}", resultStr);
        return JSON.parseObject(resultStr, returnClass);
    }


    /**
     * 发送post表单请求
     * <p>
     * 上传文件示例 {@code data.put("file", new FileSystemResource()));}
     */
    public static <T> T postFormData(String url, MultiValueMap<String, Object> data, Class<T> returnClass) {
        log.info("发送HTTP POST 表单请求 url: {} ,data: {}", url, data);
        String resultStr = REST_TEMPLATE.postForObject(url, data, String.class);
        log.info("HTTP POST表单请求返回数据: {}", resultStr);
        return JSON.parseObject(resultStr, returnClass);
    }

    /**
     * 发送post xml请求
     */
    public static <T> T postXml(String url, Object data, Class<T> returnClass) {
        log.info("发送HTTP POST XML 请求 url: {} ,data: {}", url, data);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_XML);
        String resultStr = REST_TEMPLATE.postForObject(url, new HttpEntity<>(XmlUtil.toString(data), httpHeaders), String.class);
        log.info("HTTP POST XML返回数据: {}", resultStr);
        return JSON.parseObject(XmlUtil.toJSONStr(resultStr), returnClass);
    }


    /**
     * 发送POST请求
     */
    @SneakyThrows
    public static String sendWxPostWithSSL(String url, Object xmlObj) {
        HttpPost httpPost = new HttpPost(url);
        //解决XStream对出现双下划线的bug
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        xStreamForRequestPostData.alias("xml", xmlObj.getClass());
        //将要提交给API的数据对象转换成XML格式数据Post给API
        String postDataXML = xStreamForRequestPostData.toXML(xmlObj);
        log.info("微信统一支付: 参数 \n {}", postDataXML);

        StringEntity postEntity = new StringEntity(postDataXML, "UTF-8");
        httpPost.addHeader("Content-Type", "text/xml");
        httpPost.setEntity(postEntity);

        // 设置请求器的配置
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(30000).build();
        httpPost.setConfig(requestConfig);

        ClassPathResource resource = new ClassPathResource("wx/apiclient_cert.p12");
        KeyStore keyStore = KeyStore.getInstance("PKCS12");
        keyStore.load(resource.getInputStream(), WxProperties.MCH_ID.toCharArray());
        SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, WxProperties.MCH_ID.toCharArray()).build();
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[]{"TLSv1"},
                null, SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
        CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(sslsf).build();

        HttpResponse response = httpClient.execute(httpPost);
        org.apache.http.HttpEntity entity = response.getEntity();
        return EntityUtils.toString(entity, "UTF-8");
    }

}
