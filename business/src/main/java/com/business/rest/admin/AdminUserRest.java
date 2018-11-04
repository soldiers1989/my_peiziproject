package com.business.rest.admin;

import java.util.ArrayList;
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
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.dto.model.UserDTO;
import com.business.entity.UserEntity;
import com.business.enums.ReturnCode;
import com.business.service.UserService;

/**
 * 用户REST类
 * 
 */
@Service
@Path("/business/user")
public class AdminUserRest {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private UserService userService;

	/**
	 * 保存更新
	 */
	@Path("/save")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult save(UserDTO dto) {
		RestfulResult result = new RestfulResult();
		Date now = new Date();
		String operate = "保存用户信息";
		try {
			UserEntity entity = userService.getById(dto.getId());
			entity.setAccount(dto.getAccount());
			entity.setOperatetime(now);
			if (null != dto.getRealName() && !"".equals(dto.getRealName()) && null != dto.getCentNo() && !"".equals(dto.getCentNo())){
				entity.setRealName(dto.getRealName());
				entity.setCentNo(dto.getCentNo());
				entity.setCentStatus(1);
			}
			if (null != dto.getBankName() && !"".equals(dto.getBankName()) && null != dto.getBankNo() && !"".equals(dto.getBankNo())){
				entity.setBankName(dto.getBankName());
				entity.setBankNo(dto.getBankNo());
				entity.setBankStatus(1);
			}
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("", operate, WebUtils.objectToJson(dto)));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("", operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}

	/**
	 * 分页查询
	 */
	@Path("/get/page")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public PageDTO<UserDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("phone") String phone,@FormParam("account") String account,
			@FormParam("operator") String operator) {
		PageDTO<UserDTO> dtos = new PageDTO<UserDTO>();
		RestfulResult result = new RestfulResult();
		String operate = "分页查询用户信息";
		try {
			Page<UserEntity> entities = userService.getByPage(pageNo, pageSize, phone,account);
			dtos.setPageNo(pageNo);
			dtos.setPageSize(pageSize);
			dtos.setTotalPages(entities.getTotalPages());
			if (entities.getTotalCount() > 0) {
				dtos.setResult(new ArrayList<UserDTO>());
			}
			for (UserEntity entity : entities.getResult()) {
				UserDTO dto = new UserDTO();
				WebUtils.beanCopy(UserEntity.class, UserDTO.class, entity, dto);
				dto.setAmount((double)entity.getAmount()/100);
				if (null == entity.getRemdPhone()){
					dto.setRemdPhone("无");
				}
				dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
				dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
				dtos.getResult().add(dto);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(operator, operate, phone));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		dtos.setRestResult(result);
		return dtos;
	}

	/**
	 * 通过id查询
	 */
	@Path("/get/primarykey")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public UserDTO getById(@FormParam("id") Long id, @FormParam("operator") String operator) {
		UserDTO dto = new UserDTO();
		RestfulResult result = new RestfulResult();
		String operate = "通过id查询店铺";
		try {
			UserEntity entity = userService.getById(id);
			if (entity != null) {
				WebUtils.beanCopy(UserEntity.class, UserDTO.class, entity, dto);
				dto.setAmount((double)entity.getAmount()/100);
			}
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo(operator, operate, id.toString()));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		dto.setRestfulResult(result);
		return dto;
	}

}
