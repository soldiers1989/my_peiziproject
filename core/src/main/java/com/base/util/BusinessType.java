package com.base.util;

/**
 * 业务说明
 */
public enum BusinessType {
    APPSTORE(1, "APPSTORE", "商店"),
    LAUNCHER(2, "LAUNCHER", "桌面"),
    USER(3, "USER", "用户"),
    MISSION(4, "MISSION", "任务");

    private int code;
    private String name, display;

    BusinessType(int code, String name, String display) {
        this.code = code;
        this.name = name;
        this.display = display;
    }

    public int value() {
        return this.code;
    }

    public BusinessType valueof(String name) {
        for (BusinessType a : BusinessType.values()) {
            if (a.name.equals(name)) return a;
        }
        return null;
    }

    public String getDisplay() {
        return this.display;
    }
}
