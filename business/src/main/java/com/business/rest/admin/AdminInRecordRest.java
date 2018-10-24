package com.business.rest.admin;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.InRecordDTO;
import com.business.dto.model.PageDTO;
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
	public PageDTO<InRecordDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("phone") String phone,@FormParam("status") Integer status,
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
			Page<InRecordEntity> entities = this.inRecordService.getByPage(pageNo, pageSize, userid,status);
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
				if (dto.getWay().intValue() == 0){
					dto.setWayStr("配资");
				} else if (dto.getWay().intValue() == 1){
					dto.setWayStr("补仓");
				}
				if (dto.getStatus().intValue() == 0){
					dto.setStatusStr("未处理");
				} else if (dto.getStatus().intValue() == 1){
					dto.setStatusStr("已处理");
				}
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

	
	/**
	 * 批量更新状态
	 */
	@Path("/update/list")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult updateList(@FormParam("ids") List<Long> ids, @FormParam("operator") String operator) {
		RestfulResult result = new RestfulResult();
		String operate = "批量更新状态";
		try {
			long[] idArr = ArrayUtils.toPrimitive(ids.toArray(new Long[0]));
			for (int i=0 ;i <idArr.length;i++){
				InRecordEntity inRecordEntity = inRecordService.getById(idArr[i]);
				inRecordEntity.setStatus(1);
				inRecordService.saveOrUpdate(inRecordEntity);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(operator, operate, ids.toString()));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
}
