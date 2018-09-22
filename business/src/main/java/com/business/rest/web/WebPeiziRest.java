package com.business.rest.web;

import java.util.Date;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.util.WebUtils;
import com.business.dto.model.RestfulResult;
import com.business.entity.PeiziEntity;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.service.PeiziService;
import com.business.service.UserService;

/**
 * 页面配资REST类
 * 
 */
@Service
@Path("/web/peizi")
public class WebPeiziRest {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private PeiziService peiziService;

	@Autowired
	private UserService userService;

	/**
	 * 用户提交配资信息
	 */
	@POST
	@Path("/submit")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult submit(@FormParam("account") String account, @FormParam("type") Integer type, @FormParam("baozhengAmount") Long baozhengAmount, @FormParam("dayCount") Integer dayCount,
			@FormParam("rate") Long rate, @FormParam("peiziAmount") Long peiziAmount, @FormParam("caopanAmount") Long caopanAmount, @FormParam("warnLine") Long warnLine,
			@FormParam("pingcangLine") Long pingcangLine, @FormParam("tradeDay") Integer tradeDay,@FormParam("tradeCount") Integer tradeCount) {
		RestfulResult result = new RestfulResult();

		String operate = "配资提交";
		try {
			UserEntity userEntity = userService.getByPhone(account);
			if (null == userEntity) {
				result.setResultCode(ReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(ReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}
			long amount = userEntity.getAmount() - baozhengAmount * 100 - rate * 100;
			if (amount<0){
				result.setResultCode(PeiziReturnCode.AMOUNT_NOTENOUGH.getFlag());
				result.setResultMessage(PeiziReturnCode.AMOUNT_NOTENOUGH.getDesc());
				return result;
			}
			PeiziEntity peiziEntity = new PeiziEntity();
			peiziEntity.setUserid(userEntity.getId());
			peiziEntity.setType(type);
			peiziEntity.setBaozhengAmount(baozhengAmount * 100);
			peiziEntity.setDayCount(dayCount);
			peiziEntity.setRate(rate * 100);
			peiziEntity.setPeiziAmount(peiziAmount * 100);
			peiziEntity.setCaopanAmount(caopanAmount * 100);
			peiziEntity.setWarnLine(warnLine * 100);
			peiziEntity.setPingcangLine(pingcangLine * 100);
			peiziEntity.setTradeDay(tradeDay);
			peiziEntity.setTradeCount(tradeCount);
			peiziEntity.setCreatetime(new Date());
			peiziService.saveOrUpdate(peiziEntity);
			
			userEntity.setAmount(amount);
			userService.saveOrUpdate(userEntity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(account, operate, ReturnCode.SUCCESS.getDesc()));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(account, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}

		return result;
	}

}
