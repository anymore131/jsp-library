package com.bean;

public class Tools {
    // 如果字符串不为空或者长度不为零返回true
    public static boolean isNotNull( String value ) {
        if( value == null || "".equals( value.trim()) || "null".equalsIgnoreCase(value) ) {
            return false;
        }
        return true;
    }

    //ISO编码转换成UTF8编码
    public static String ISOtoUTF8(String s) {
        try {
            s = new String(s.getBytes("iso-8859-1"), "utf-8");
        } catch (Exception e) {

        }
        return s;
    }

    //是否为num
    public static boolean isNum(String str){
        return str.matches("^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$");
    }
}