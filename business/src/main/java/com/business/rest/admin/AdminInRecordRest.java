package com.business.rest.admin;

import java.util.ArrayList;

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
import com.business.dto.model.PageDTO;
import com.business.dto.model.InRecordDTO;
import com.business.dto.model.RestfulResult;
import com.business.entity.InRecordEntity;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.service.InRecordService;
import com.business.service.UserService;

/**
 * 入金REST类
 * 
 */
@Service
@Path("/business/inrecord")
public class AdminInRecordRest {

	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private InRecordService inRecordService;

	@Autowired
	private UserService userService;
	
	/**
	 * 分页查询
	 */
	@Path("/get/page")
	@POST
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public PageDTO<InRecordDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("phone") String phone,
			@FormParam("operator") String operator) {
		PageDTO<InRecordDTO> dtos = new PageDTO<InRecordDTO>();
		RestfulResult result = new RestfulResult();
		String operate = "分页查询配资信息";
		try {
			Long userid = null;
			if (null != phone && !"".equals(phone)){
				UserEntity userEntity = userService.getByPhone(phone);
				if (!WebUtils.isEmpty(userEntity)){
					userid = userEntity.getId();
					
				} else {
					dtos.setPageNo(pageNo);
					dtos.setPageSize(pageSize);
					dtos.setTotalPages(0);
					result.setResultCode(ReturnCode.SUCCESS.getFlag());
					result.setResultMessage(ReturnCode.SUCCESS.getDesc());
					logger.info(WebUtils.outLogInfo(operator, operate, phone + ""));
					dtos.setRestResult(result);
					return dtos;
				}
			}
			Page<InRecordEntity> entities = this.inRecordService.getByPage(pageNo, pageSize, userid);
			dtos.setPageNo(pageNo);
			dtos.setPageSize(pageSize);
			dtos.setTotalPages(entities.getTotalPages());
			if (entities.getTotalCount() > 0) {
				dtos.setResult(new ArrayList<InRecordDTO>());
			}
			for (InRecordEntity entity : entities.getResult()) {
				InRecordDTO dto = new InRecordDTO();
				WebUtils.beanCopy(InRecordEntity.class, InRecordDTO.class, entity, dto);
				UserEntity tmpEntity = userService.getById(dto.getUserid());
				dto.setPhone(tmpEntity.getPhone());
				dto.setAmount((double)entity.getAmount()/100);
				dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
				dtos.getResult().add(dto);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(operator, operate, userid + ""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		dtos.setRestResult(result);
		return dtos;
	}

}
