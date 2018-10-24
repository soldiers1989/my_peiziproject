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
import com.business.entity.InRecordEntity;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.service.InRecordService;
import com.business.service.UserService;

@Service
@Path("/web/inrecord")
public class WebInRecordRest {

	private static final Logger logger = Logger.getLogger(WebInRecordRest.class);

	@Autowired
	InRecordService inRecordService;

	@Autowired
	UserService userService;
	
	/**
	 * 保存
	 */
	@Path("/save")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult register(@FormParam("rechargeAmount") Long amount, @FormParam("accNumber") String serialno, @FormParam("rechargeType") String way, @FormParam("account") String phone) {
		RestfulResult result = new RestfulResult();
		Date now = new Date();
		try {
			UserEntity userEntity = userService.getByPhone(phone);
			InRecordEntity inRecordEntity = new InRecordEntity();
			inRecordEntity.setUserid(userEntity.getId());
			inRecordEntity.setAmount(amount*100);
			inRecordEntity.setWay(1);
			inRecordEntity.setStatus(0);
			inRecordEntity.setCreatetime(now);
			inRecordService.saveOrUpdate(inRecordEntity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("inrecord", "inrecord save", ""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("inrecord", "inrecord save", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
	
	

}
