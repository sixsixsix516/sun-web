package com.sixsixsix516.common.pay.util;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import com.thoughtworks.xstream.io.xml.XppDriver;
import net.sf.json.xml.XMLSerializer;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 */
public class XmlUtil {
    /**
     * 扩展xstream，使其支持CDATA块
     *
     * @date 2013-05-19
     */
    public static XStream xstream = new XStream(new XppDriver() {
        @Override
        public HierarchicalStreamWriter createWriter(Writer out) {
            return new PrettyPrintWriter(out) {
                // 对所有xml节点的转换都增加CDATA标记
                final boolean cdata = true;

                @Override
                public void startNode(String name, @SuppressWarnings("rawtypes") Class clazz) {
                    super.startNode(name, clazz);
                }

                @Override
                protected void writeText(QuickWriter writer, String text) {
                    if (cdata) {
                        writer.write("<![CDATA[");
                        writer.write(text);
                        writer.write("]]>");
                    } else {
                        writer.write(text);
                    }
                }
            };
        }
    });


    public static Map<String, String> parseXml(InputStream inputStream) {
        // 解析xml数据，将解析结果存储在HashMap中
        Map<String, String> map = new HashMap<>();
        // 读取输入流
        SAXReader reader = new SAXReader();
        Document document;
        try {
            document = reader.read(inputStream);
            // 得到xml根元素
            Element root = document.getRootElement();
            parserXml(root, map);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return map;

    }

    /**
     * xml解析为map
     *
     * @param root 根节点
     * @param map  返回的map
     */
    public static void parserXml(Element root, Map<String, String> map) {
        // 得到根元素的所有子节点
        List<Element> elementList = root.elements();
        // 判断有没有子元素列表
        if (elementList.size() == 0) {
            map.put(root.getName(), root.getText());
        } else {
            // 遍历
            for (Element e : elementList) {
                parserXml(e, map);
            }
        }
    }

    /**
     * 将对象转为XML格式的字符串
     */
    public static String toString(Object data) {
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        xStreamForRequestPostData.alias("xml", data.getClass());
        return xStreamForRequestPostData.toXML(data);
    }

    /**
     * 将xml格式的字符串转为json
     */
    public static String toJSONStr(String xmlStr) {
        XMLSerializer xmlSerializer = new XMLSerializer();
        return xmlSerializer.read(xmlStr).toString();
    }
}
