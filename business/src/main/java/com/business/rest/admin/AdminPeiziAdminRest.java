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
import com.business.dto.model.PeiziDTO;
import com.business.dto.model.RestfulResult;
import com.business.entity.PeiziEntity;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.service.PeiziService;
import com.business.service.UserService;

/**
 * 配资REST类
 * 
 */
@Service
@Path("/business/peizi")
public class AdminPeiziAdminRest {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private PeiziService peiziService;

	@Autowired
	private UserService userService;
	
	/**
	 * 分页查询
	 */
	@Path("/get/page")
	@POST
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public PageDTO<PeiziDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("phone") String phone,
			@FormParam("type") String typeStr,@FormParam("operator") String operator) {
		PageDTO<PeiziDTO> dtos = new PageDTO<PeiziDTO>();
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
					logger.info(WebUtils.outLogInfo(operator, operate, phone + ":" +typeStr));
					dtos.setRestResult(result);
					return dtos;
				}
			}
			
			Integer type = null;
			if (null != typeStr && !"".equals(typeStr)){
				type = Integer.valueOf(typeStr);
			}
			Page<PeiziEntity> entities = this.peiziService.getByPage(pageNo, pageSize, userid,type);
			dtos.setPageNo(pageNo);
			dtos.setPageSize(pageSize);
			dtos.setTotalPages(entities.getTotalPages());
			if (entities.getTotalCount() > 0) {
				dtos.setResult(new ArrayList<PeiziDTO>());
			}
			for (PeiziEntity entity : entities.getResult()) {
				PeiziDTO dto = new PeiziDTO();
				WebUtils.beanCopy(PeiziEntity.class, PeiziDTO.class, entity, dto);
				UserEntity tmpEntity = userService.getById(dto.getUserid());
				dto.setPhone(tmpEntity.getPhone());
				if (dto.getType().intValue() == 0){
					dto.setTypeName("免息配资");
				} else if (dto.getType().intValue() == 1){
					dto.setTypeName("按天配资");
				} else if (dto.getType().intValue() == 2){
					dto.setTypeName("按月配资");
				}
				
				if (dto.getTradeDay().intValue() == 1){
					dto.setTradeDayName("今日");
				} else if (dto.getTradeDay().intValue() == 2){
					dto.setTradeDayName("下个交易日");
				}
				dto.setBaozhengAmount((double)entity.getBaozhengAmount().longValue()/100);
				dto.setRate((double)entity.getRate().longValue()/100);
				dto.setPeiziAmount((double)entity.getPeiziAmount().longValue()/100);
				dto.setCaopanAmount((double)entity.getCaopanAmount().longValue()/100);
				dto.setWarnLine((double)entity.getWarnLine().longValue()/100);
				dto.setPingcangLine((double)entity.getPingcangLine().longValue()/100);
				dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
				dtos.getResult().add(dto);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(operator, operate, phone + ":" +type));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		dtos.setRestResult(result);
		return dtos;
	}

	
}
