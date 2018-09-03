package com.business.rest.admin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.base.util.WebUtils;
import com.business.help.FilePathHelper;

/**
 * 
 */
@Service
@Path("/business/upload")
public class UploadFileRest {

    private Logger logger = Logger.getLogger(getClass());

    @Context
    UriInfo uriInfo;

    @POST
    @Path("/picture")
    @Consumes(MediaType.APPLICATION_OCTET_STREAM)
    public void uploadShop(@Context HttpServletRequest request, @Context HttpServletResponse response) {
	String rootPath = request.getSession().getServletContext().getRealPath("");
	String realPath = rootPath.substring(0, rootPath.lastIndexOf(System.getProperty("file.separator"))) + FilePathHelper.uploadPath;
	System.out.println(realPath);
	// realURL=http://localhost:8080/service/server/materialIconUpload
	String realURL = request.getRequestURL().toString();
	// pathInfo=/service/server/materialIconUpload
	String pathInfo = request.getRequestURI();
	// realURL=http://localhost:8080/launcher/resources/
	realURL = realURL.replace(pathInfo, FilePathHelper.uploadPath);
	PrintWriter writer = null;
	InputStream is = null;
	FileOutputStream fos = null;

	try {
	    writer = response.getWriter();
	} catch (IOException ex) {
	    ex.printStackTrace();
	}

	String filename = request.getHeader("X-File-Name");
	String extendName = filename.substring(filename.lastIndexOf("."));
	String type = request.getParameter("type").trim();
	String requestCreatetime = request.getParameter("createtime");
	String pathChar = System.getProperty("file.separator");
	String fileClassPath = "";

	String createtimeUrl = "";
	if (WebUtils.isEmpty(requestCreatetime)) {
	    createtimeUrl = WebUtils.formatDate2Str(new Date(), "yyyy-MM-dd").replace("-", pathChar);
	} else {
	    requestCreatetime = requestCreatetime.trim();
	    createtimeUrl = requestCreatetime.substring(0, 10);
	    createtimeUrl = createtimeUrl.replace("-", pathChar);
	}

	try {
	    File appDir = new File(realPath, createtimeUrl + pathChar + fileClassPath);
	    if (!appDir.exists()) {// 应用对应的目录不存在
		appDir.mkdirs();
	    }
	    String newfilename = type + "_" + Calendar.getInstance().getTimeInMillis() + extendName;
	    String filepath = realPath + createtimeUrl + fileClassPath + pathChar + newfilename;
	    String fileUrl = realURL + createtimeUrl + fileClassPath + pathChar + newfilename;
	    is = request.getInputStream();
	    fos = new FileOutputStream(new File(filepath));
	    IOUtils.copy(is, fos);
	    writer.print("{success:true,filepath:\"" + fileUrl.replace(pathChar, "/") + "\",filename:\"" + newfilename + "\"}");
	} catch (FileNotFoundException ex) {
	    logger.error(ex.getMessage(), ex);
	    writer.print("{success:false,error:\"" + ex.getMessage() + "\"}");
	} catch (IOException ex) {
	    logger.error(ex.getMessage(), ex);
	    writer.print("{success:false,error:\"" + ex.getMessage() + "\"}");
	} finally {
	    try {
		fos.close();
		is.close();
	    } catch (IOException ignored) {
	    }
	}

	writer.flush();
	writer.close();
    }

}
