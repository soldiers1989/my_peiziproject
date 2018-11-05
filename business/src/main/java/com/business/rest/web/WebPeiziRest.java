package com.business.rest.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import com.business.entity.AccountEntity;
import com.business.entity.PeiziEntity;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.help.MessageUtils;
import com.business.service.AccountService;
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

	@Autowired
	private AccountService accountService;

	/**
	 * 用户提交配资信息
	 */
	@POST
	@Path("/submit")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult submit(@FormParam("account") String account, @FormParam("type") Integer type, @FormParam("baozhengAmount") Long baozhengAmount, @FormParam("dayCount") Integer dayCount,
			@FormParam("rate") Long rate, @FormParam("peiziAmount") Long peiziAmount, @FormParam("caopanAmount") Long caopanAmount, @FormParam("warnLine") Long warnLine,
			@FormParam("pingcangLine") Long pingcangLine, @FormParam("tradeDay") Integer tradeDay, @FormParam("tradeCount") Integer tradeCount) {
		RestfulResult result = new RestfulResult();

		String operate = "配资提交";
		try {
			UserEntity userEntity = userService.getByPhone(account);
			if (null == userEntity) {
				result.setResultCode(ReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(ReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}

			Date today = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(today);
			int weekday = c.get(Calendar.DAY_OF_WEEK);
			if (weekday == 1 || weekday == 7) {
				result.setResultCode(PeiziReturnCode.INRECORD_TIMEERROR.getFlag());
				result.setResultMessage(PeiziReturnCode.INRECORD_TIMEERROR.getDesc());
				return result;
			} else {
				Date now = new Date();
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
				if (!((nowLong > date1 && nowLong < date2) || (nowLong > date3 && nowLong < date4) || (nowLong > date5 && nowLong < date6))) {
					result.setResultCode(PeiziReturnCode.INRECORD_TIMEERROR.getFlag());
					result.setResultMessage(PeiziReturnCode.INRECORD_TIMEERROR.getDesc());
					return result;
				}
			}

			String jiaoYiAccount = userEntity.getAccount();
			if (null == jiaoYiAccount || "".equals(jiaoYiAccount)) {
				List<AccountEntity> accountList = accountService.getAllNotUsed();
				if (null != accountList && accountList.size() > 0) {
					AccountEntity accountEntity = accountList.get(0);
					userEntity.setAccount(accountEntity.getAccount());
					userService.saveOrUpdate(userEntity);

					accountEntity.setStatus(1);
					accountService.saveOrUpdate(accountEntity);
				} else {
					result.setResultCode(PeiziReturnCode.ACCOUNT_NOTENOUGH.getFlag());
					result.setResultMessage(PeiziReturnCode.ACCOUNT_NOTENOUGH.getDesc());
					return result;
				}

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
			peiziEntity.setStatus(0);
			peiziService.saveOrUpdate(peiziEntity);

			String content = "【98配资】尊敬的98配资客户，您在平台系统申请的期货配资账户已开通，资金账号为" + userEntity.getAccount() + "，交易密码为577189，请您及时下载交易软件，修改初始交易密码。祝您投资愉快！期市有风险！投资需谨慎！";
			MessageUtils.sendPhoneMsg(userEntity.getPhone(), content);

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
