package com.business.rest.web;

import java.util.Date;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import jxl.common.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.util.WebUtils;
import com.business.dto.model.RestfulResult;
import com.business.entity.OutRecordEntity;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.service.OutRecordService;
import com.business.service.UserService;

@Service
@Path("/web/outrecord")
public class WebOutRecordRest {

	private static final Logger logger = Logger.getLogger(WebOutRecordRest.class);

	@Autowired
	OutRecordService outRecordService;

	@Autowired
	UserService userService;
	
	/**
	 * 保存
	 */
	@Path("/save")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult save(@FormParam("amount") Long amount, @FormParam("account") String phone) {
		RestfulResult result = new RestfulResult();
		Date now = new Date();
		try {

			UserEntity userEntity = userService.getByPhone(phone);
			OutRecordEntity entity = new OutRecordEntity();
			entity.setUserid(userEntity.getId());
			entity.setAmount(amount*100);
			entity.setStatus(0);
			entity.setCreatetime(now);
			outRecordService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("outrecord", "inrecord save", ""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("outrecord", "inrecord save", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}

}
