package com.business.rest.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import jxl.common.Logger;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.dto.model.SystemConfigDTO;
import com.business.entity.SystemConfigEntity;
import com.business.enums.ReturnCode;
import com.business.enums.Status;
import com.business.service.SystemConfigService;

@Service
@Path("/business/systemConfig")
public class SystemConfigRest {

    private static final Logger logger = Logger.getLogger(SystemConfigRest.class);

    @Autowired
    SystemConfigService sysconfigService;

    /**
     * 保存或更新
     */
    @Path("/save")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult saveSysconfig(SystemConfigDTO dto) {
	RestfulResult result = new RestfulResult();
	Date now = new Date();
	String operate = "保存或更新系统配置";
	try {
	    if (dto.getId() == null) {
		// 判断键值见否存在
		SystemConfigEntity entity = sysconfigService.getByCode(dto.getCode());
		if (entity != null) {
		    result.setResultCode(ReturnCode.CODE_REPEAT.getFlag());
		    result.setResultMessage(ReturnCode.CODE_REPEAT.getDesc());
		    return result;
		}
		// 设置属性并保存数据库
		entity = new SystemConfigEntity();
		WebUtils.beanCopy(SystemConfigDTO.class, SystemConfigEntity.class, dto, entity);
		entity.setStatus(Status.ACTIVE.value());
		entity.setCreatetime(now);
		entity.setOperatetime(now);
		sysconfigService.saveOrUpdate(entity);
	    } else {
		// 判断键值见否存在
		SystemConfigEntity entity = sysconfigService.getByCode(dto.getCode());
		if (entity != null && dto.getId().longValue() != entity.getId().longValue()) {
		    result.setResultCode(ReturnCode.CODE_REPEAT.getFlag());
		    result.setResultMessage(ReturnCode.CODE_REPEAT.getDesc());
		    return result;
		}
		WebUtils.beanCopy(SystemConfigDTO.class, SystemConfigEntity.class, dto, entity);
		entity.setStatus(Status.ACTIVE.value());
		entity.setOperatetime(now);
		sysconfigService.saveOrUpdate(entity);
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

    /**
     * 根据ID查询系统变量
     */
    @Path("/get/id")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public SystemConfigDTO getById(@FormParam("id") int id, @FormParam("operator") String operator) {
	SystemConfigDTO dto = new SystemConfigDTO();
	RestfulResult result = new RestfulResult();
	String operate = "通过id查询系统配置";
	try {
	    SystemConfigEntity entity = sysconfigService.get(id);
	    if (!WebUtils.isEmpty(entity)) {
		WebUtils.beanCopy(SystemConfigEntity.class, SystemConfigDTO.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, id+ ""));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	dto.setResult(result);
	return dto;
    }

    /**
     * 根据code查询系统变量
     */
    @Path("/get/code")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public SystemConfigDTO getSysconfigByCode(@FormParam("code") String code, @FormParam("operator") String operator) {
	SystemConfigDTO dto = new SystemConfigDTO();
	RestfulResult result = new RestfulResult();
	String operate = "通过code查询系统配置";
	try {
	    SystemConfigEntity entity = sysconfigService.getByCode(code);
	    if (!WebUtils.isEmpty(entity)) {
		WebUtils.beanCopy(SystemConfigEntity.class, SystemConfigDTO.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, code));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	dto.setResult(result);
	return dto;
    }

    /**
     * 分页查询
     */
    @Path("/get/page")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public PageDTO<SystemConfigDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("code") String code,
	    @FormParam("name") String name, @FormParam("value") String value, @FormParam("operator") String operator) {
	PageDTO<SystemConfigDTO> dtos = new PageDTO<SystemConfigDTO>();
	RestfulResult result = new RestfulResult();
	String operate = "分页查询系统配置";
	try {
	    if (WebUtils.isEmpty(code)) {
		code = "%%";
	    } else {
		code = "%" + code + "%";
	    }
	    if (WebUtils.isEmpty(name)) {
		name = "%%";
	    } else {
		name = "%" + name + "%";
	    }
	    if (WebUtils.isEmpty(value)) {
		value = "%%";
	    } else {
		value = "%" + value + "%";
	    }
	    Page<SystemConfigEntity> entities = this.sysconfigService.getByPage(pageNo, pageSize, code, name, value);
	    dtos.setPageNo(pageNo);
	    dtos.setPageSize(pageSize);
	    dtos.setTotalPages(entities.getTotalPages());
	    if (entities.getTotalCount() > 0) {
		dtos.setResult(new ArrayList<SystemConfigDTO>());
	    }
	    for (SystemConfigEntity entity : entities.getResult()) {
		SystemConfigDTO dto = new SystemConfigDTO();
		WebUtils.beanCopy(SystemConfigEntity.class, SystemConfigDTO.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
		dtos.getResult().add(dto);
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, code + ":" + name + ":" + value));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	dtos.setRestResult(result);
	return dtos;
    }

    /**
     * 根据ID批量删除系统变量，物理删除
     */
    @Path("/delete/list")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult deleteSysconfig(@FormParam("id") List<Long> ids, @FormParam("operator") String operator) {
	RestfulResult result = new RestfulResult();
	String operate = "删除系统配置";
	try {
	    sysconfigService.deleteByIds(ArrayUtils.toPrimitive(ids.toArray(new Long[0])));
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate,ids.toString()));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

    

}
