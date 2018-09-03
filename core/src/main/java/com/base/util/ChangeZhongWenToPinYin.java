/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 *
 * @author Tian Liang <tianliang@huan.tv>
 */
public class ChangeZhongWenToPinYin {

    /**
     * 获取中文字符串拼音缩写，如“JAVA程序员”返回“javacxy”
     *
     * @param zhongwen
     * @return
     * @throws BadHanyuPinyinOutputFormatCombination
     */
    public static String getPinYinShortcut(String zhongwen)
            throws BadHanyuPinyinOutputFormatCombination {
        if (zhongwen == null) {
            return null;
        }
        String zhongWenPinYin = "";
        char[] chars = zhongwen.toCharArray();

        for (int i = 0; i < chars.length; i++) {
            String[] pinYin = PinyinHelper.toHanyuPinyinStringArray(chars[i],
                    getDefaultOutputFormat());
            // 当转换不是中文字符时,返回null
            if (pinYin != null) {
                zhongWenPinYin += pinYin[0].charAt(0);
            } else {
                zhongWenPinYin += chars[i];
            }
        }

        return zhongWenPinYin.toLowerCase();
    }

    /**
     * 获取拼音
     *
     * @param zhongwen
     * @return
     * @throws BadHanyuPinyinOutputFormatCombination
     */
    public static String getPinYin(String zhongwen)
            throws BadHanyuPinyinOutputFormatCombination {
        if (zhongwen == null) {
            return null;
        }
        String zhongWenPinYin = "";
        char[] chars = zhongwen.toCharArray();

        for (int i = 0; i < chars.length; i++) {
            String[] pinYin = PinyinHelper.toHanyuPinyinStringArray(chars[i],
                    getDefaultOutputFormat());
            // 当转换不是中文字符时,返回null
            if (pinYin != null) {
                zhongWenPinYin += capitalize(pinYin[0]);
            } else {
                zhongWenPinYin += chars[i];
            }
        }

        return zhongWenPinYin;
    }

    /**
     * Default Format 默认输出格式
     *
     * @return
     */
    public static HanyuPinyinOutputFormat getDefaultOutputFormat() {
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        format.setCaseType(HanyuPinyinCaseType.LOWERCASE);// 小写
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);// 没有音调数字
        format.setVCharType(HanyuPinyinVCharType.WITH_U_AND_COLON);// u显示

        return format;
    }

    /**
     * Capitalize 首字母大写
     *
     * @param s
     * @return
     */
    public static String capitalize(String s) {
        char ch[];
        ch = s.toCharArray();
        if (ch[0] >= 'a' && ch[0] <= 'z') {
            ch[0] = (char) (ch[0] - 32);
        }
        String newString = new String(ch);
        return newString;
    }

//    public static void main(String[] args) {
//        try {
//            System.out.println(getPinYinShortcut(null));
//        } catch (BadHanyuPinyinOutputFormatCombination ex) {
//            Logger.getLogger(ChangeZhongWenToPinYin.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
