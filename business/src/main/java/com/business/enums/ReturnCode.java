/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.enums;

/**
 * 后台返回码枚举类
 */
public enum ReturnCode {

    SUCCESS( 0, "0000", "成功"),
    CODE_REPEAT(1, "1001", "键值重复"),
    REPEAT_SUBMIT(1, "1001", "记录重复提交"),
    USER_NOTEXIST(1, "1002", "用户不存在"),
    PASSWORD_ERROR(1, "1003", "密码错误"),
    USER_REPEAT(1, "1004", "用户重复"),
    AUTHNAME_REPEAT(1, "1005", "权限名称重复"),
    BUSINESS_ERROR(1, "9999", "业务逻辑异常");
    private int flag;
    private String code, desc;

    ReturnCode(int flag, String code, String desc) {
        this.flag = flag;
        this.code = code;
        this.desc = desc;
    }

    public String value() {
        return this.code;
    }

    public String getDesc() {
        return this.desc;
    }

    public int getFlag() {
        return this.flag;
    }
}
