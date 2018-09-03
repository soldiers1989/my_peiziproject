package com.base.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.cglib.beans.BeanCopier;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.codec.binary.Base64;

/**
 * Created by IntelliJ IDEA. User: leo Date: 2009-9-27 Time: 15:12:34
 */
@SuppressWarnings({ "rawtypes" })
public class WebUtils {

    /**
     * 将字符串转化为日期
     */
    public static Date formatStr2Date(String strDate, String pattern) {
	Date date = new Date();

	try {
	    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	    date = sdf.parse(strDate);
	} catch (Exception e) {
	    System.out.print(e.getMessage());
	}
	return date;

    }

    /**
     * 将日期转化为字符串
     */
    public static String formatDate2Str(Date date, String pattern) {
	if (date == null) {
	    return "";
	}
	SimpleDateFormat myFormatter = new SimpleDateFormat(pattern);
	return myFormatter.format(date);
    }

    /**
     * base64编码
     */
    public static String base64Encoder(String s) {
	if (s != null) {
	    return new String(Base64.encodeBase64(s.getBytes()));
	} else {
	    return "";
	}
    }

    /**
     * base64解码
     */
    public static String base64Decoder(String s) {
	if (s != null) {
	    return new String(Base64.decodeBase64(s.getBytes()));
	} else {
	    return "";
	}
    }

    /**
     * 字符串md5值
     */
    public static String md5(String s) {
	byte[] defaultBytes = s.getBytes();
	StringBuffer hexString = new StringBuffer();
	try {
	    MessageDigest algorithm = MessageDigest.getInstance("MD5");
	    algorithm.reset();
	    algorithm.update(defaultBytes);
	    byte messageDigest[] = algorithm.digest();
	    for (byte aMessageDigest : messageDigest) {
		String hex = Integer.toHexString(0xFF & aMessageDigest);
		if (hex.length() == 1) {
		    hexString.append('0');
		}

		hexString.append(hex);
	    }
	    // *** Testausgabe
	    System.out.println("pass " + s + "   md5 version is " + hexString.toString());
	    s = hexString + "";
	} catch (NoSuchAlgorithmException ignored) {
	}
	return hexString.toString();
    }

    /**
     * 判断空或null
     */
    public static boolean isEmpty(String value) {
	if (value == null || value.trim().length() == 0 || "null".equals(value)) {
	    return true;
	}
	return false;
    }

    /**
     * 0也是null
     */
    public static boolean isEmpty(Integer value) {
	if (value == null || value == 0) {
	    return true;
	}
	return false;
    }

    /**
     * 0也是null
     */
    public static boolean isEmpty(Long value) {
	if (value == null || value.longValue() == 0) {
	    return true;
	}
	return false;
    }

    /**
     * 0不认为是null
     */
    public static boolean isEmptyEx0(Integer value) {
	if (value == null) {
	    return true;
	}
	return false;
    }

    /**
     * 0不认为是null
     */
    public static boolean isEmptyEx0(Long value) {
	if (value == null) {
	    return true;
	}
	return false;
    }

    /**
     * list判空
     */
    public static boolean isEmpty(List value) {
	if (null == value || value.size() == 0) {
	    return true;
	}
	return false;
    }

    /**
     * Object判空
     */
    public static boolean isEmpty(Object value) {
	if (value == null) {
	    return true;
	}
	return false;
    }

    /**
     * Object数组判空
     */
    public static boolean isEmpty(Object[] value) {
	if (value == null || value.length == 0) {
	    return true;
	}
	return false;
    }

    /**
     * 判断字符串是否是int类型
     */
    public static boolean isInteger(String value) {
	try {
	    Integer.parseInt(value);
	    return true;
	} catch (Exception e) {
	    return false;
	}
    }

    /**
     * 判断字符串是否是long类型
     */
    public static boolean isLong(String value) {
	try {
	    Long.parseLong(value);
	    return true;
	} catch (Exception e) {
	    return false;
	}
    }

    /**
     * beanCopy
     */
    public static void beanCopy(Class source, Class target, Object sourceObj, Object targetObj) {
	BeanCopier beancopier = BeanCopier.create(source, target, false);
	beancopier.copy(sourceObj, targetObj, null);
    }

    /**
     * 通过URL下载资源到服务器 
     */
    public static void downloadHttpResource(String httpUrl, String localPath) throws Exception {
	URL url = new URI(httpUrl).toURL();
	HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	DataInputStream in = new DataInputStream(connection.getInputStream());
	DataOutputStream out = new DataOutputStream(new FileOutputStream(localPath, true));
	byte[] buffer = new byte[4096];
	int count = 0;
	while ((count = in.read(buffer)) > 0) {
	    out.write(buffer, 0, count);
	}
	out.close();
	in.close();
	connection.disconnect();
    }

    /**
     * 删除文件及文件夹下面的文件。
     */
    public static boolean deleteFile(File file) {
	if (file.exists()) { // 判断文件是否存在
	    if (file.isFile()) { // 判断是否是文件
		file.delete(); // delete()方法 你应该知道 是删除的意思;
	    } else if (file.isDirectory()) { // 否则如果它是一个目录
		File files[] = file.listFiles(); // 声明目录下所有的文件 files[];
		for (int i = 0; i < files.length; i++) { // 遍历目录下所有的文件
		    deleteFile(files[i]); // 把每个文件 用这个方法进行迭代
		}
	    }
	    file.delete();
	    return true;
	} else {
	    return false;
	}
    }

    /**
     * 判断url是否有效
     */
    public static boolean validateURL(String url) {
	boolean flag = false;
	if (url != null) {
	    URL cdnURL = null;
	    try {
		cdnURL = new URL(url);
		URLConnection connect = cdnURL.openConnection();
		connect.setConnectTimeout(5000);
		connect.setReadTimeout(5000);

		BufferedReader reader = new BufferedReader(new InputStreamReader(connect.getInputStream()));
		if (reader.readLine() != null) {
		    flag = true;
		}
		if (reader != null) {
		    reader.close();
		}
	    } catch (MalformedURLException mue) {
		flag = false;
	    } catch (FileNotFoundException fnfe) {
		flag = false;
	    } catch (IOException ioe) {
		flag = false;
	    }
	}
	return flag;
    }

    /**
     * 对象转换成json输出，并且过滤为空的 字段
     */
    public static String objectToJson(Object obj) {
	JsonConfig config = new JsonConfig();
	Method[] methods = obj.getClass().getMethods();
	final List<String> names = new ArrayList<String>();
	for (Method method : methods) {
	    String methodName = method.getName();
	    if (methodName.startsWith("get") && (method.getReturnType().equals(List.class))) {
		char[] chars = methodName.substring(3).toCharArray();
		chars[0] = Character.toLowerCase(chars[0]);
		StringBuilder sb = new StringBuilder();
		for (char c : chars) {
		    sb.append(c);
		}
		String fieldName = sb.toString();
		names.add(fieldName);
	    }
	}
	config.setJsonPropertyFilter(new PropertyFilter() {
	    @Override
	    public boolean apply(Object obj/* 属性的拥有者 */, String name /* 属性名字 */, Object value/* 属性值 */) {
		boolean flag = false;
		// 先对值 进行判断
		if (value == null) {
		    flag = true;
		}
		// 再对 是否为list 进行再次判断
		for (String fieldName : names) {
		    // 如果 有字段 是 属于 list类型的
		    if (name.equals(fieldName)) {
			flag = false;
			break;
		    }
		}
		return flag;
	    }
	});
	if (!(obj instanceof List)) {
	    return JSONObject.fromObject(obj, config).toString();
	} else {
	    return JSONArray.fromObject(obj, config).toString();
	}
    }

    // md5 for file begin
    protected static char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

    public static String md5(File file) throws Exception {
	MessageDigest messageDigest = MessageDigest.getInstance("MD5");
	FileInputStream in = new FileInputStream(file);
	FileChannel ch = in.getChannel();
	MappedByteBuffer byteBuffer = ch.map(FileChannel.MapMode.READ_ONLY, 0, file.length());
	messageDigest.update(byteBuffer);
	return bufferToHex(messageDigest.digest());
    }

    private static String bufferToHex(byte bytes[]) {
	return bufferToHex(bytes, 0, bytes.length);
    }

    private static String bufferToHex(byte bytes[], int m, int n) {
	StringBuffer stringbuffer = new StringBuffer(2 * n);
	int k = m + n;
	for (int l = m; l < k; l++) {
	    appendHexPair(bytes[l], stringbuffer);
	}
	return stringbuffer.toString();
    }

    private static void appendHexPair(byte bt, StringBuffer stringbuffer) {
	char c0 = hexDigits[(bt & 0xf0) >> 4];
	char c1 = hexDigits[bt & 0xf];
	stringbuffer.append(c0);
	stringbuffer.append(c1);
    }

    // md5 for file end

    /**
     * 输出日志
     */
    public static String outLogInfo(String operator, String operate, String content) {
	return "#[" + operator + "]-[" + operate + "]:[" + content + "]";
    }

    /**
     * 输出日志
     */
    public static String outLogError(String operator, String operate, String msg) {
	return "#[" + operator + "]-[" + operate + "]:[" + msg + "]";
    }
}
