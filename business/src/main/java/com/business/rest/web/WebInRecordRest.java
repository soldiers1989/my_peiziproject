package com.business.rest.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
	public RestfulResult register(@FormParam("rechargeAmount") Long amount,  @FormParam("account") String phone) {
		RestfulResult result = new RestfulResult();
		Date now = new Date();
		try {
			Date today = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(today);
			int weekday = c.get(Calendar.DAY_OF_WEEK);
			if (weekday == 1 || weekday == 7) {
				result.setResultCode(PeiziReturnCode.INRECORD_TIMEERROR.getFlag());
				result.setResultMessage(PeiziReturnCode.INRECORD_TIMEERROR.getDesc());
				return result;
			} else {

				long nowLong = now.getTime();
				SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
				String todayYMDStr = formatYMD.format(now);
				SimpleDateFormat formatYMDHMD = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long date1 = formatYMDHMD.parse(todayYMDStr + " 00:00:00").getTime();
				long date2 = formatYMDHMD.parse(todayYMDStr + " 03:00:00").getTime();
				
				long date3 = formatYMDHMD.parse(todayYMDStr + " 08:30:00").getTime();
				long date4 = formatYMDHMD.parse(todayYMDStr + " 17:30:00").getTime();
				
				long date5 = formatYMDHMD.parse(todayYMDStr + " 20:30:00").getTime();
				long date6 = formatYMDHMD.parse(todayYMDStr + " 23:59:59").getTime();
				if (!((nowLong > date1 && nowLong<date2)|| (nowLong > date3 && nowLong<date4)||(nowLong > date5 && nowLong<date6) )){
					result.setResultCode(PeiziReturnCode.INRECORD_TIMEERROR.getFlag());
					result.setResultMessage(PeiziReturnCode.INRECORD_TIMEERROR.getDesc());
					return result;
				}
			}
			
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
