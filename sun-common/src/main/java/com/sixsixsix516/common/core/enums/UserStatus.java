package com.sixsixsix516.common.core.enums;

/**
 * 用户状态
 *
 * @author SUN
 */
public enum UserStatus {

    /**
     * 正常状态
     */
    OK(0, "正常"),

    /**
     * 停用状态
     */
    DISABLE(1, "停用"),

    /**
     * 删除状态
     */
    DELETED(2, "删除");

    private final Integer code;
    private final String info;

    UserStatus(Integer code, String info) {
        this.code = code;
        this.info = info;
    }

    public Integer getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
