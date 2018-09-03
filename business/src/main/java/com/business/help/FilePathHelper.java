/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.help;

import java.util.Date;
import java.util.ResourceBundle;

import javax.ws.rs.core.UriInfo;

import com.base.util.WebUtils;

/**
 * 文件路径帮助类
 *
 */
public class FilePathHelper {

    public static String uploadPath;
    public static String cdnUrl;

    static {
	ResourceBundle resourceBundle = ResourceBundle.getBundle("appstore/appstore");
	uploadPath = resourceBundle.getString("file.uploadpath");
	cdnUrl = resourceBundle.getString("file.cdn.serverurl");
    }

    public static String getHttpRootPath(Date date) {

	String path = cdnUrl + uploadPath;
	String dateStr = WebUtils.formatDate2Str(date, "yyyyMMdd");
	String year = dateStr.substring(0, 4);
	String month = dateStr.substring(4, 6);
	String day = dateStr.substring(6, 8);
	return path + year + "/" + month + "/" + day + "/";
    }

    /**
     * 获取文件下载路径
     */
    public static String getFileUrl(Date date, String filename) {
	if (WebUtils.isEmpty(filename)) {
	    return filename;
	}
	String path = getHttpRootPath(date);
	// 如果是不是文件
	if (!filename.contains(".")) {
	    return filename;
	}
	return path + filename;
    }
    
    
    /**
     * 获取本地绝对路径
     */
    public static String getLocalPath(UriInfo uriInfo) {
	String url = uriInfo.getAbsolutePath().toString();
	String pathInfo = uriInfo.getAbsolutePath().getPath().toString();
	return url.replace(pathInfo, uploadPath);
    }
    
    /**
     * 获得cdn路径
     */
    public static String getCdnPath() {
	return cdnUrl + uploadPath;
    }

}
