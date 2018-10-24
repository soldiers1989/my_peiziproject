package com.business.rest.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.AccountDTO;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.entity.AccountEntity;
import com.business.enums.ReturnCode;
import com.business.service.AccountService;

@Service
@Path("/business/account")
public class AdminAccountRest {

	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	AccountService accountService;

	/**
	 * 分页查询
	 */
	@Path("/get/page")
	@POST
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public PageDTO<AccountDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("account") String account,
			@FormParam("status") Integer status, @FormParam("operator") String operator) {
		PageDTO<AccountDTO> dtos = new PageDTO<AccountDTO>();
		RestfulResult result = new RestfulResult();
		String operate = "分页查询";
		try {

			Page<AccountEntity> entitys = accountService.getByPage(pageNo, pageSize,account, status);
			dtos.setPageNo(pageNo);
			dtos.setPageSize(pageSize);
			dtos.setTotalPages(entitys.getTotalPages());

			if (entitys.getResult().size() > 0) {
				dtos.setResult(new ArrayList<AccountDTO>());
			}
			for (AccountEntity entity : entitys.getResult()) {
				AccountDTO dto = new AccountDTO();
				WebUtils.beanCopy(AccountEntity.class, AccountDTO.class, entity, dto);
				if (entity.getStatus().intValue() == 0){
					dto.setStatusString("未使用");
				} else {
					dto.setStatusString("已使用");
				}
				dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
				dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
				dtos.getResult().add(dto);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(operator, operate, status + ""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		dtos.setRestResult(result);
		return dtos;
	}

	/**
	 * 保存权限信息
	 */
	@Path("/save")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult save(AccountDTO dto) {

		RestfulResult result = new RestfulResult();
		String operate = "保存权限";
		try {
			String[] arr = dto.getAccount().split("-");
			for (int i = 0; i < arr.length; i++) {
				AccountEntity accountEntity = accountService.getByAccount(arr[i]);
				if (accountEntity != null) {
					accountEntity.setAccount(arr[i]);
				} else {
					accountEntity = new AccountEntity();
					Date now = Calendar.getInstance().getTime();
					accountEntity.setCreatetime(now);
					accountEntity.setOperator(dto.getOperator());
					accountEntity.setOperatetime(now);
					accountEntity.setStatus(0);
					accountEntity.setAccount(arr[i]);

				}
				accountService.saveOrUpdate(accountEntity);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(dto.getOperator(), operate, WebUtils.objectToJson(dto)));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(dto.getOperator(), operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}

}
