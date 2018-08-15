package com.cfl.util;

public class CommonUtil {
    public static String stringFormat(String s, int length) {
        if (s.length() > length) {
            return s.substring(0, 16) + ".....";
        } else {
            return s;
        }
    }
}
