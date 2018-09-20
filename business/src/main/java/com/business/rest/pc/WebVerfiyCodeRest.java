package com.business.rest.pc;

import java.net.URLEncoder;
import java.util.Date;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import jxl.common.Logger;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.util.WebUtils;
import com.business.dto.model.RestfulResult;
import com.business.entity.VerifyCodeEntity;
import com.business.enums.ReturnCode;
import com.business.service.VerifyCodeService;

@Service
@Path("/pc/code")
public class WebVerfiyCodeRest {

	private static final Logger logger = Logger.getLogger(WebVerfiyCodeRest.class);

	@Autowired
	VerifyCodeService verifyCodeService;

	/**
	 * 发送验证码
	 */
	@Path("/send")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult send(@FormParam("uid") String uid,
			@FormParam("mobile") String phone) {
		RestfulResult result = new RestfulResult();
		try {
			String url = "http://api.qirui.com:7891/mt";
			// apiKey和APISecret
			String apiKey = "2250590010";
			String apiSecret = "96339051785957fa8fa7";
			// 接受手机号
			String mobile = phone;

			// 验证码
			String code = "5277";
			// 短信内容(【签名】+短信内容)，系统提供的测试签名和内容，如需要发送自己的短信内容请在启瑞云平台申请签名和模板
//			String message = "【启瑞云】您的验证码是:" + code;
//			StringBuilder sb = new StringBuilder(2000);
//			sb.append(url);
//			sb.append("?dc=15");
//			sb.append("&sm=").append(URLEncoder.encode(message, "utf8"));
//			sb.append("&da=").append(mobile);
//			sb.append("&un=").append(apiKey);
//			sb.append("&pw=").append(apiSecret);
//			sb.append("&tf=3&rd=1&rf=2"); // 短信内容编码为 urlencode+utf8
//			String request = sb.toString();
//			// System.out.println(request);
//			CloseableHttpClient client = HttpClients.createDefault();
//			HttpGet httpGet = new HttpGet(request);
//			CloseableHttpResponse response = client.execute(httpGet);
//			String respStr = null;
//			HttpEntity entity = response.getEntity();
//			if (entity != null) {
//				respStr = EntityUtils.toString(entity, "UTF-8");
//			}
//			String resultStr = respStr.contains("id") ? "success" : "fail";
//			logger.info("send verify code =" + resultStr);
			String resultStr = "success";
			if ("fail".equals(resultStr)){
				result.setResultCode(VerifyCodeReturnCode.MSG_SENDERROR.getFlag());
				result.setResultMessage(VerifyCodeReturnCode.MSG_SENDERROR.getDesc());
				return result;
			}
			VerifyCodeEntity verifyCodeEntity = verifyCodeService.getByUid(uid);
			if (null == verifyCodeEntity){
				verifyCodeEntity = new VerifyCodeEntity();
				verifyCodeEntity.setCode(code);
				verifyCodeEntity.setUid(uid);
				verifyCodeEntity.setCreatetime(new Date());
				verifyCodeService.saveOrUpdate(verifyCodeEntity);
			} else {
				verifyCodeEntity.setCode(code);
				verifyCodeEntity.setCreatetime(new Date());
				verifyCodeService.saveOrUpdate(verifyCodeEntity);
			}
			
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("system", "verify code send",""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("system", "verify code send", ex.getMessage()),ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}

}
