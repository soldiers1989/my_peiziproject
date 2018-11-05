package com.business.help;

import java.net.URLEncoder;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class MessageUtils {

	public static void sendPhoneMsg(String phone, String content) {
		try {
			String url = "http://api.qirui.com:7891/mt";
			// apiKey和APISecret
			String apiKey = "2250590010";
			String apiSecret = "96339051785957fa8fa7";

			// 短信内容(【签名】+短信内容)，系统提供的测试签名和内容，如需要发送自己的短信内容请在启瑞云平台申请签名和模板
			// String message = "【启瑞云】您的验证码是:" + code;
			String message = content;
			StringBuilder sb = new StringBuilder(2000);
			sb.append(url);
			sb.append("?dc=15");
			sb.append("&sm=").append(URLEncoder.encode(message, "utf8"));
			sb.append("&da=").append(phone);
			sb.append("&un=").append(apiKey);
			sb.append("&pw=").append(apiSecret);
			sb.append("&tf=3&rd=1&rf=2"); // 短信内容编码为 urlencode+utf8
			String request = sb.toString();
			// System.out.println(request);
			CloseableHttpClient client = HttpClients.createDefault();
			HttpGet httpGet = new HttpGet(request);
			CloseableHttpResponse response = client.execute(httpGet);
			String respStr = null;
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				respStr = EntityUtils.toString(entity, "UTF-8");
			}
			String resultStr = respStr.contains("id") ? "success" : "fail";
			System.out.println("send message result =" + resultStr);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
