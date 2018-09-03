package com.base.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import javax.xml.bind.annotation.adapters.XmlAdapter;


public class DateFormat extends XmlAdapter<Date, Timestamp> {
    /**
     * 默认日期格式
     * yyyy-MM-dd HH:mm:ss
     */
    private static final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss";
    private final static int MAX_YEAR = 9999;
    private final static int MIN_YEAR = 1800;
    private final static int MAX_MONTH = 12;
    private final static int MIN_MONTH = 1;
    private final static int MAX_DAY = 31;
    private final static int MIN_DAY = 1;
    private final static String DATE_LIST = "0123456789-";

    /**
     * 距离入库时间以下面的形式显示
     */
    private static final long ONE_MINUTE = 60000L;
    private static final long ONE_HOUR = 3600000L;
    private static final long ONE_DAY = 86400000L;
    private static final long ONE_WEEK = 604800000L;

    private static final String ONE_SECOND_AGO = "秒前";
    private static final String ONE_MINUTE_AGO = "分钟前";
    private static final String ONE_HOUR_AGO = "小时前";
    private static final String ONE_DAY_AGO = "天前";
    private static final String ONE_MONTH_AGO = "月前";
    private static final String ONE_YEAR_AGO = "年前";

    /**
     * 字符串转换成日期 如果转换格式为空，则利用默认格式 (yyyy-MM-dd HH:mm:ss)进行转换操作
     * @param str 字符串
     * @param format 日期格式
     * @return 日期
     * @throws java.text.ParseException 
     */
    public static Date str2Date(String str, String format) {
	if (null == str || "".equals(str)) {
	    return null;
	}
	// 如果没有指定字符串转换的格式，则用默认格式 (yyyy-MM-dd HH:mm:ss)进行转换
	if (null == format || "".equals(format)) {
	    format = DEFAULT_FORMAT;
	}
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	Date date = null;
	try {
	    date = sdf.parse(str);
	    return date;
	} catch (ParseException e) {
	    e.printStackTrace();
	}
	return null;
    }

    /** 日期转换为字符串
     * @param date 日期
     * @param format 日期格式
     * @return 字符串
     */
    public static String date2Str(Date date, String format) {
	if (null == date) {
	    return null;
	}
	if (WebUtils.isEmpty(format)) {
	    format = DEFAULT_FORMAT;
	}
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	return sdf.format(date);
    }

    /**
     * 新建String时间
     * 使用默认格式 (yyyy-MM-dd HH:mm:ss)
     * @author Niejm
     */
    public static final String toDefaultString(Date date) {
	return date2Str(date, DEFAULT_FORMAT);
    }

    /** Date转换时间戳
     * @return
     */
    public static Timestamp date2Timestamp(Date date) {
	return new Timestamp(date.getTime());
    }

    /**
     * 时间戳转换为字符串
     * @param time
     * @return
     */
    public static String timestamp2Str(Timestamp time) {
	Date date = null;
	if (null != time) {
	    date = new Date(time.getTime());
	}
	return date2Str(date, DEFAULT_FORMAT);
    }

    /** 字符串转换时间戳
     * @param str
     * @return
     */
    public static Timestamp str2Timestamp(String str) {
	Date date = str2Date(str, DEFAULT_FORMAT);
	return new Timestamp(date.getTime());
    }

    /** DATE转换时间戳
     * @param str
     * @return
     */
    @Override
    public Timestamp unmarshal(Date v) {
	return new Timestamp(v.getTime());
    }

    /** 时间戳转换DATE
     * @param str
     * @return
     */
    @Override
    public Date marshal(Timestamp v) {
	return new Date(v.getTime());
    }

    /** 新建时间戳
     * @param str
     * @return
     */
    public static Timestamp newTimestamp() {
	Date date = Calendar.getInstance().getTime();
	return new Timestamp(date.getTime());
    }

    /**
     * 新建String时间
     * yyyy-MM-dd HH:mm:ss
     * @author Niejm
     */
    public static final String newDateString() {
	Date date = new Date();
	return DateFormat.toDefaultString(date);
    }

    /**
     * 新建时间Str
     * format为空则使用默认格式 (yyyy-MM-dd HH:mm:ss)
     * @param format
     * @return
     */
    public static String newTimeStr(String format) {
	Date date = Calendar.getInstance().getTime();
	if (WebUtils.isEmpty(format)) {
	    return date2Str(date, DEFAULT_FORMAT);
	}
	return date2Str(date, format);
    }

    /**
     * 新建String时间,系统日期前/后(amount)天
     * format为空则使用默认格式 (yyyy-MM-dd HH:mm:ss)
     * @author Niejm
     */
    public static final String newTimeStr(String format, int amount) {
	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.DAY_OF_MONTH, amount);
	Date date = calendar.getTime();
	if (WebUtils.isEmpty(format)) {
	    return date2Str(date, DEFAULT_FORMAT);
	}
	return date2Str(date, format);
    }

    /**
     * <p> 校验是否存在非法字符 </p>
     * @param str String
     * @return boolean
     */
    public static boolean validateNumber(String str) {
	String tmp = null;
	for (int i = 0; i < str.length(); i++) {
	    tmp = str.substring(i, i + 1);
	    if (DATE_LIST.indexOf(tmp) == -1) {
		return false;
	    }
	}
	return true;
    }

    /**
     * <p>计算输入日期格式校验</p>
     * @param strDate String
     * @return boolean
     */
    public static boolean validateDate(String strDate) {
	int yyyy = 0000;
	int mm = 00;
	int dd = 00;
	// 校验是否有非法字符
	if (!validateNumber(strDate)) {
	    return false;
	}

	if (strDate.indexOf("-") >= 0) {
	    StringTokenizer token = new StringTokenizer(strDate, "-");
	    int i = 0;
	    while (token.hasMoreElements()) {
		if (i == 0) {
		    yyyy = Integer.parseInt(token.nextToken());
		}
		if (i == 1) {
		    mm = Integer.parseInt(token.nextToken());
		}
		if (i == 2) {
		    dd = Integer.parseInt(token.nextToken());
		}
		i++;
	    }
	} else {
	    if (strDate.length() != 8) {
		return false;
	    }
	    yyyy = Integer.parseInt(strDate.substring(0, 4));
	    mm = Integer.parseInt(strDate.substring(4, 6));
	    dd = Integer.parseInt(strDate.substring(6, 8));
	}
	if (yyyy > MAX_YEAR || yyyy < MIN_YEAR) {
	    return false;
	}
	if (mm > MAX_MONTH || mm < MIN_MONTH) {
	    return false;
	}
	if (dd > MAX_DAY || dd < MIN_DAY) {
	    return false;
	}
	if ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && (dd == 31)) {
	    return false;
	}
	if (mm == 2) {
	    // 校验闰年的情况下__日期格式
	    boolean leap = (yyyy % 4 == 0 && (yyyy % 100 != 0 || yyyy % 400 == 0));
	    if (dd > 29 || (dd == 29 && !leap)) {
		return false;
	    }
	}

	return true;
    }

    public static String format(Date date) {
	long delta = new Date().getTime() - date.getTime();
	if (delta < 1L * ONE_MINUTE) {
	    long seconds = toSeconds(delta);
	    return (seconds <= 0 ? 1 : seconds) + ONE_SECOND_AGO;
	}
	if (delta < 45L * ONE_MINUTE) {
	    long minutes = toMinutes(delta);
	    return (minutes <= 0 ? 1 : minutes) + ONE_MINUTE_AGO;
	}
	if (delta < 24L * ONE_HOUR) {
	    long hours = toHours(delta);
	    return (hours <= 0 ? 1 : hours) + ONE_HOUR_AGO;
	}
	if (delta < 48L * ONE_HOUR) {
	    return "一天前";
	}
	if (delta < 30L * ONE_DAY) {
	    long days = toDays(delta);
	    return (days <= 0 ? 1 : days) + ONE_DAY_AGO;
	}
	if (delta < 12L * 4L * ONE_WEEK) {
	    long months = toMonths(delta);
	    return (months <= 0 ? 1 : months) + ONE_MONTH_AGO;
	} else {
	    long years = toYears(delta);
	    return (years <= 0 ? 1 : years) + ONE_YEAR_AGO;
	}
    }

    private static long toSeconds(long date) {
	return date / 1000L;
    }

    private static long toMinutes(long date) {
	return toSeconds(date) / 60L;
    }

    private static long toHours(long date) {
	return toMinutes(date) / 60L;
    }

    private static long toDays(long date) {
	return toHours(date) / 24L;
    }

    private static long toMonths(long date) {
	return toDays(date) / 30L;
    }

    private static long toYears(long date) {
	return toMonths(date) / 365L;
    }

}
