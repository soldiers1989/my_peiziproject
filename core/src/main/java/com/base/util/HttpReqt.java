package com.base.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.Vector;

import org.apache.log4j.Logger;



/** 
 * HTTP请求类
 */
public class HttpReqt {
    private Logger logger = Logger.getLogger(getClass());
    private String defaultContentEncoding;

    public HttpReqt() {
	this.defaultContentEncoding = Charset.forName("UTF-8").name();
    }

    /** 
     * 发送GET请求 
     *  
     * @param urlString URL地址 
     * @param logFlag 	是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendGet(String urlString, Boolean logFlag) throws IOException {
	return this.send(urlString, "GET", null, null, logFlag);
    }

    /** 
     * 发送GET请求 
     *  
     * @param urlString URL地址 
     * @param params 	参数集合 
     * @param logFlag 	是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendGet(String urlString, Map<String, String> params, Boolean logFlag) throws IOException {
	return this.send(urlString, "GET", params, null, logFlag);
    }

    /** 
     * 发送GET请求 
     *  
     * @param urlString  URL地址 
     * @param params  	   参数集合 
     * @param propertys  请求属性 
     * @param logFlag 	  是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendGet(String urlString, Map<String, String> params, Map<String, String> propertys, Boolean logFlag) throws IOException {
	return this.send(urlString, "GET", params, propertys, logFlag);
    }

    /** 
     * 发送POST请求 
     *  
     * @param urlString URL地址 
     * @param logFlag 	是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendPost(String urlString, Boolean logFlag) throws IOException {
	return this.send(urlString, "POST", null, null, logFlag);
    }

    /** 
     * 发送POST请求 
     *  
     * @param urlString URL地址 
     * @param params 	参数集合 
     * @param logFlag 	是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendPost(String urlString, Map<String, String> params, Boolean logFlag) throws IOException {
	return this.send(urlString, "POST", params, null, logFlag);
    }

    /** 
     * 发送POST请求 
     *  
     * @param urlString URL地址 
     * @param params 	参数集合 
     * @param propertys 请求属性 
     * @param logFlag 	是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendPost(String urlString, Map<String, String> params, Map<String, String> propertys, Boolean logFlag) throws IOException {
	return this.send(urlString, "POST", params, propertys, logFlag);
    }

    /** 
     * 发送POST请求 
     *  
     * @param urlString  URL地址 
     * @param paramsXML  xml参数 
     * @param logFlag 是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响应对象 
     * @throws IOException 
     */
    public HttpResp sendPostXml(String urlString, String paramsXML, Boolean logFlag) throws IOException {
	return this.sendXml(urlString, "POST", paramsXML, null, logFlag);
    };

    /**
     * 
     * @Description: 
     * @author niejianming@huan.tv
     * @param urlString
     * @param paramsJSON
     * @param logFlag	      是否打印日志,空:默认打印，true：打印，false：不打印
     * @return
     * @throws IOException
     */
    public HttpResp sendPostJson(String urlString, String paramsJSON, Boolean logFlag) throws IOException {
	return this.sendJson(urlString, "POST", paramsJSON, null, logFlag);
    };

    /** 
     * 发送POST请求 
     *  
     * @param urlString   URL地址 
     * @param paramsXML   xml参数 
     * @param propertys   请求属性 
     * @param logFlag 	      是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 		      响应对象 
     * @throws IOException 
     */
    public HttpResp sendPostXml(String urlString, String paramsXML, Map<String, String> propertys, Boolean logFlag) throws IOException {
	return this.sendXml(urlString, "POST", paramsXML, propertys, logFlag);
    };

    /** 
     * 发送HTTP请求 
     *  
     * @param urlString 
     * @param logFlag 是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响映对象 
     * @throws IOException 
     */
    private HttpResp send(String urlString, String method, Map<String, String> parameters, Map<String, String> propertys, Boolean logFlag) throws IOException {


	HttpURLConnection urlConnection = null;

	if (method.equalsIgnoreCase("GET") && parameters != null) {
	    StringBuffer param = new StringBuffer();
	    int i = 0;
	    for (String key : parameters.keySet()) {
		if (i == 0)
		    param.append("?");
		else
		    param.append("&");
		param.append(key).append("=").append(parameters.get(key));
		i++;
	    }
	    urlString += param;
	}
	URL url = new URL(urlString);
	urlConnection = (HttpURLConnection) url.openConnection();

	// 连接超时
	urlConnection.setConnectTimeout(1000 * 10);
	urlConnection.setRequestMethod(method);
	urlConnection.setDoOutput(true);
	urlConnection.setDoInput(true);
	urlConnection.setUseCaches(false);

	if (propertys != null)
	    for (String key : propertys.keySet()) {
		urlConnection.addRequestProperty(key, propertys.get(key));
	    }

	if (method.equalsIgnoreCase("POST") && parameters != null) {
	    StringBuffer param = new StringBuffer();
	    for (String key : parameters.keySet()) {
		param.append("&");
		param.append(key).append("=").append(parameters.get(key));
	    }
	    urlConnection.getOutputStream().write(param.toString().getBytes());
	    urlConnection.getOutputStream().flush();
	    urlConnection.getOutputStream().close();
	}

	HttpResp httpRespons = this.makeContent(urlString, urlConnection);
	return httpRespons;
    }

    /** 
     * 发送HTTP请求POST方式xml 
     *  
     * @param urlString 
     * @param logFlag 是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响映对象 
     * @throws IOException 
     */
    private HttpResp sendXml(String urlString, String method, String paramsXML, Map<String, String> propertys, Boolean logFlag) throws IOException {
	String[] urlArr = urlString.split("/");

	if (WebUtils.isEmpty(logFlag) || logFlag) {
	    if (urlArr.length >= 2) {
		logger.info("===" + urlArr[urlArr.length - 2] + "/" + urlArr[urlArr.length - 1] + "=URL:" + urlString);
		logger.info("===" + urlArr[urlArr.length - 2] + "/" + urlArr[urlArr.length - 1] + "=" + method + "_request:" + paramsXML);
	    }
	}
	HttpURLConnection urlConnection = null;
	URL url = new URL(urlString);
	urlConnection = (HttpURLConnection) url.openConnection();
	urlConnection.setRequestMethod(method);
	// 连接超时
	urlConnection.setConnectTimeout(1000 * 10);
	urlConnection.setDoOutput(true);
	urlConnection.setDoInput(true);
	urlConnection.setUseCaches(false);
	// 将xml数据发送到位置服务器
	urlConnection.setRequestProperty("Content-Type", "application/xml");
	urlConnection.setRequestProperty("Content-length", String.valueOf(paramsXML.getBytes().length));

	if (propertys != null) {
	    for (String key : propertys.keySet()) {
		urlConnection.addRequestProperty(key, propertys.get(key));
	    }
	}
	urlConnection.getOutputStream().write(paramsXML.getBytes());
	urlConnection.getOutputStream().flush();
	urlConnection.getOutputStream().close();
	HttpResp httpRespons = this.makeContent(urlString, urlConnection);

	if (WebUtils.isEmpty(logFlag) || logFlag) {
	    if (null != httpRespons && urlArr.length >= 2) {
		logger.info("===" + urlArr[urlArr.length - 2] + "/" + urlArr[urlArr.length - 1] + "=" + method + "_respons:" + httpRespons.getContent());
	    }
	}
	return httpRespons;
    }

    /** 
     * 发送HTTP请求POST方式xml 
     *  
     * @param urlString 
     * @param logFlag 是否打印日志,空:默认打印，true：打印，false：不打印
     * @return 响映对象 
     * @throws IOException 
     */
    private HttpResp sendJson(String urlString, String method, String paramsJSON, Map<String, String> propertys, Boolean logFlag) throws IOException {
	String[] urlArr = urlString.split("/");

	if (WebUtils.isEmpty(logFlag) || logFlag) {
	    if (urlArr.length >= 2) {
		logger.info("===" + urlArr[urlArr.length - 2] + "/" + urlArr[urlArr.length - 1] + "=URL:" + urlString);
		logger.info("===" + urlArr[urlArr.length - 2] + "/" + urlArr[urlArr.length - 1] + "=" + method + "_request:" + paramsJSON);
	    }
	}
	HttpURLConnection urlConnection = null;
	URL url = new URL(urlString);
	urlConnection = (HttpURLConnection) url.openConnection();
	urlConnection.setRequestMethod(method);
	// 连接超时
	urlConnection.setConnectTimeout(1000 * 10);
	urlConnection.setDoOutput(true);
	urlConnection.setDoInput(true);
	urlConnection.setUseCaches(false);
	// 将xml数据发送到位置服务器
	urlConnection.setRequestProperty("Content-Type", "application/json");
	urlConnection.setRequestProperty("Content-length", String.valueOf(paramsJSON.getBytes().length));

	if (propertys != null) {
	    for (String key : propertys.keySet()) {
		urlConnection.addRequestProperty(key, propertys.get(key));
	    }
	}
	urlConnection.getOutputStream().write(paramsJSON.getBytes());
	urlConnection.getOutputStream().flush();
	urlConnection.getOutputStream().close();
	HttpResp httpRespons = this.makeContent(urlString, urlConnection);
	if (WebUtils.isEmpty(logFlag) || logFlag) {
	    if (null != httpRespons && urlArr.length >= 2) {
		logger.info("===" + urlArr[urlArr.length - 2] + "/" + urlArr[urlArr.length - 1] + "=" + method + "_respons:" + httpRespons.getContent());
	    }
	}
	return httpRespons;
    }

    /** 
     * 得到响应对象 
     *  
     * @param urlConnection 
     * @return 响应对象 
     * @throws IOException 
     */
    private HttpResp makeContent(String urlString, HttpURLConnection urlConnection) throws IOException {
	HttpResp httpResponser = new HttpResp();
	try {
	    InputStream in = urlConnection.getInputStream();
	    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in));
	    httpResponser.contentCollection = new Vector<String>();
	    StringBuffer temp = new StringBuffer();
	    String line = bufferedReader.readLine();
	    while (line != null) {
		httpResponser.contentCollection.add(line);
		temp.append(line).append("\r\n");
		line = bufferedReader.readLine();
	    }
	    bufferedReader.close();

	    String ecod = urlConnection.getContentEncoding();
	    if (ecod == null)
		ecod = this.defaultContentEncoding;

	    httpResponser.urlString = urlString;

	    httpResponser.defaultPort = urlConnection.getURL().getDefaultPort();
	    httpResponser.file = urlConnection.getURL().getFile();
	    httpResponser.host = urlConnection.getURL().getHost();
	    httpResponser.path = urlConnection.getURL().getPath();
	    httpResponser.port = urlConnection.getURL().getPort();
	    httpResponser.protocol = urlConnection.getURL().getProtocol();
	    httpResponser.query = urlConnection.getURL().getQuery();
	    httpResponser.ref = urlConnection.getURL().getRef();
	    httpResponser.userInfo = urlConnection.getURL().getUserInfo();

	    httpResponser.content = new String(temp.toString().getBytes(), ecod);
	    httpResponser.contentEncoding = ecod;
	    httpResponser.code = urlConnection.getResponseCode();
	    httpResponser.message = urlConnection.getResponseMessage();
	    httpResponser.contentType = urlConnection.getContentType();
	    httpResponser.method = urlConnection.getRequestMethod();
	    httpResponser.connectTimeout = urlConnection.getConnectTimeout();
	    httpResponser.readTimeout = urlConnection.getReadTimeout();

	    return httpResponser;
	} catch (IOException e) {
	    throw e;
	} finally {
	    if (urlConnection != null)
		urlConnection.disconnect();
	}
    }

    /** 
     * 得到响应对象 
     *  
     * @param urlConnection 
     * @return 响应对象 
     * @throws IOException 
     */
    @SuppressWarnings("unused")
    private HttpResp makeContents(String urlString, HttpURLConnection urlConnection) throws IOException {
	HttpResp httpResponser = new HttpResp();
	try {
	    InputStream in = urlConnection.getInputStream();
	    DataInputStream input = new DataInputStream(in);
	    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(input));
	    httpResponser.contentCollection = new Vector<String>();
	    StringBuffer temp = new StringBuffer();
	    String line = bufferedReader.readLine();
	    while (line != null) {
		httpResponser.contentCollection.add(line);
		temp.append(line).append("\r\n");
		line = bufferedReader.readLine();
	    }
	    bufferedReader.close();

	    String ecod = urlConnection.getContentEncoding();
	    if (ecod == null)
		ecod = this.defaultContentEncoding;

	    httpResponser.urlString = urlString;

	    httpResponser.defaultPort = urlConnection.getURL().getDefaultPort();
	    httpResponser.file = urlConnection.getURL().getFile();
	    httpResponser.host = urlConnection.getURL().getHost();
	    httpResponser.path = urlConnection.getURL().getPath();
	    httpResponser.port = urlConnection.getURL().getPort();
	    httpResponser.protocol = urlConnection.getURL().getProtocol();
	    httpResponser.query = urlConnection.getURL().getQuery();
	    httpResponser.ref = urlConnection.getURL().getRef();
	    httpResponser.userInfo = urlConnection.getURL().getUserInfo();

	    httpResponser.content = new String(temp.toString().getBytes(), ecod);
	    httpResponser.contentEncoding = ecod;
	    httpResponser.code = urlConnection.getResponseCode();
	    httpResponser.message = urlConnection.getResponseMessage();
	    httpResponser.contentType = urlConnection.getContentType();
	    httpResponser.method = urlConnection.getRequestMethod();
	    httpResponser.connectTimeout = urlConnection.getConnectTimeout();
	    httpResponser.readTimeout = urlConnection.getReadTimeout();

	    return httpResponser;
	} catch (IOException e) {
	    throw e;
	} finally {
	    if (urlConnection != null)
		urlConnection.disconnect();
	}
    }

    /** 
     * 默认的响应字符集 
     */
    public String getDefaultContentEncoding() {
	return this.defaultContentEncoding;
    }

    /** 
     * 设置默认的响应字符集 
     */
    public void setDefaultContentEncoding(String defaultContentEncoding) {
	this.defaultContentEncoding = defaultContentEncoding;
    }
}