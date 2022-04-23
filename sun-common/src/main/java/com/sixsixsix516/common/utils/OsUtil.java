package com.sixsixsix516.common.utils;

public class OsUtil {

    public static boolean isWindows() {
        return System.getProperty("os.name").toLowerCase().contains("windows");
    }
}
