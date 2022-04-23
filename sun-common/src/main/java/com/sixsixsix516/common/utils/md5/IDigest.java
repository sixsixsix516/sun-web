package com.sixsixsix516.common.utils.md5;

/**
 *
 * 摘要算法接口
 *
 * @Date in Mar 5, 2013,3:41:48 PM
 *
 * @version v1.0
 *
 * @author KK David
 */
public interface IDigest {
    /**
     *
     * 获取算法名称
     * @Date in Mar 5, 2013,3:42:03 PM
     * @return 算法名称
     */
    String getAlgorithmName();

    /**
     *
     * 获取摘要数据的长度，以字节计算
     * @Date in Mar 5, 2013,3:42:22 PM
     * @return 摘要数据的长度
     */
    int getDigestLength();

    /**
     *
     * 获取摘要算法分组的长度，以字节计算
     * @Date in Mar 5, 2013,3:42:59 PM
     * @return 摘要算法分组的长度
     */
    int getBlockLength();

    /**
     *
     * 更新一个字节
     * @Date in Mar 5, 2013,3:44:02 PM
     * @param in 一个字节的摘要数据
     */
    void update(byte in);

    /**
     *
     * 更新一个字节数组
     * @Date in Mar 5, 2013,3:45:06 PM
     * @param in 一个字节数组的摘要数据
     */
    void update(byte[] in);

    /**
     *
     * 更新一个字节数组
     * @Date in Mar 5, 2013,3:47:46 PM
     * @param in    一个字节数组的摘要数据
     * @param inOff 起始位置
     * @param len 长度
     */
    void update(byte[] in, int inOff, int len);

    /**
     *
     * 生成摘要值
     * @Date in Mar 5, 2013,3:48:20 PM
     * @param out    摘要值存放缓冲区
     * @param outOff 起始位置
     */
    void digest(byte[] out, int outOff);

    /**
     *
     * 生成摘要值
     * @Date in Mar 5, 2013,3:49:03 PM
     * @param out   摘要值存放缓冲区
     */
    void digest(byte[] out);

    /**
     *
     * 生成摘要值
     * @Date in Mar 5, 2013,3:49:21 PM
     * @return 摘要值字节数组
     */
    byte[] digest();

    /**
     *
     * 重置
     * @Date in Mar 5, 2013,3:49:42 PM
     */
    void reset();
}
