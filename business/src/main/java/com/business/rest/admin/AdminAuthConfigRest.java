package com.business.rest.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.AuthConfigDTO;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.entity.AuthConfigEntity;
import com.business.enums.ReturnCode;
import com.business.enums.Status;
import com.business.help.AdaptationTree;
import com.business.help.Dynatree;
import com.business.service.AuthConfigService;

@Service
@Path("/business/authConfig")
public class AdminAuthConfigRest {

    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    AuthConfigService authConfigService;

    /**
     * 查询出所有的导航菜单。构造树结构
     */
    @Path("/getAll")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getAll(@PathParam("operator") String operator) {
	String operate = "查询所有导航信息";
	JSONArray jarr;
	try {
	    jarr = JSONArray.fromObject(this.getTreeList());
	    logger.info(WebUtils.outLogInfo(operator, operate, ""));
	    return jarr.toString();
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	}
	return null;

    }

    /**
     * 转换树形结构
     */
    private List<Dynatree> getTreeList() throws Exception {
	List<AuthConfigEntity> authconfigEntities = authConfigService.getAll();
	return AdaptationTree.getResultTrees(authconfigEntities);
    }

    /**
     * 页面显示manager列表
     * @author kevin
     * @return
     */
    @Path("/get/page")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public PageDTO<AuthConfigDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("name") String name,
	    @FormParam("operator") String operator, @FormParam("startTime") String startTime, @FormParam("endTime") String endTime) {
	PageDTO<AuthConfigDTO> dtos = new PageDTO<AuthConfigDTO>();
	RestfulResult result = new RestfulResult();
	String operate = "分页查询权限";
	try {

	    if (WebUtils.isEmpty(name)) {
		name = "%%";
	    } else {
		name = "%" + name + "%";
	    }
	    Date sTime = null;
	    Date eTime = null;
	    try {
		if (!WebUtils.isEmpty(startTime)) {
		    sTime = java.sql.Date.valueOf(startTime);
		}
		if (!WebUtils.isEmpty(endTime)) {
		    eTime = java.sql.Date.valueOf(endTime);
		}
	    } catch (IllegalArgumentException e) {
	    }
	    Page<AuthConfigEntity> entitys = authConfigService.getByPage(pageNo, pageSize, name, sTime, eTime);
	    dtos.setPageNo(pageNo);
	    dtos.setPageSize(pageSize);
	    dtos.setTotalPages(entitys.getTotalPages());

	    if (entitys.getResult().size() > 0) {
		dtos.setResult(new ArrayList<AuthConfigDTO>());
	    }
	    for (AuthConfigEntity entity : entitys.getResult()) {
		AuthConfigDTO dto = new AuthConfigDTO();
		WebUtils.beanCopy(AuthConfigEntity.class, AuthConfigDTO.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
		dtos.getResult().add(dto);
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, name));
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
    public RestfulResult save(AuthConfigDTO dto) {

	RestfulResult result = new RestfulResult();
	String operate = "保存权限";
	try {
	    List<AuthConfigEntity> managerauths = authConfigService.getByName(dto.getName());
	    if (managerauths != null && managerauths.size() != 0) {
		result.setResultCode(ReturnCode.AUTHNAME_REPEAT.getFlag());
		result.setResultMessage(ReturnCode.AUTHNAME_REPEAT.getDesc());
		return result;
	    }
	    AuthConfigEntity entity = new AuthConfigEntity();
	    Date now = Calendar.getInstance().getTime();
	    WebUtils.beanCopy(AuthConfigDTO.class, AuthConfigEntity.class, dto, entity);
	    entity.setCreatetime(now);
	    entity.setOperatetime(now);
	    entity.setStatus(Status.ACTIVE.value());
	    authConfigService.save(entity);
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
     * 修改账号信息时，传入managerid查询出此账号的信息
     */
    @Path("/query/{id}")
    @GET
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public AuthConfigDTO getById(@PathParam("id") Long id, @PathParam("operator") String operator) {
	AuthConfigDTO dto = new AuthConfigDTO();
	RestfulResult result = new RestfulResult();
	String operate = "通过id查询权限记录";
	try {
	    AuthConfigEntity entity = authConfigService.getById(id);
	    if (!WebUtils.isEmpty(entity)) {
		WebUtils.beanCopy(AuthConfigEntity.class, AuthConfigDTO.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(dto.getOperator(), operate, id.toString()));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(dto.getOperator(), operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return dto;
    }

    /**
     * 修改账号信息
     */
    @Path("/update")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult update(AuthConfigDTO dto) {
	RestfulResult result = new RestfulResult();
	Date now = Calendar.getInstance().getTime();
	String operate = "修改权限信息";
	try {
	    AuthConfigEntity entity = authConfigService.getById(dto.getId());
	    WebUtils.beanCopy(AuthConfigDTO.class, AuthConfigEntity.class, dto, entity);
	    entity.setOperatetime(now);
	    entity.setStatus(Status.ACTIVE.value());
	    authConfigService.save(entity);
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
     * 批量删除账号信息
     */
    @Path("/delete/list")
    @POST
    @Consumes({ MediaType.APPLICATION_FORM_URLENCODED })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult delete(@FormParam("id") List<String> listIds, @FormParam("operator") String operator) {
	RestfulResult result = new RestfulResult();
	String operate = "删除权限";
	try {
	    Long[] ids = new Long[listIds.size()];
	    for (int i = 0; i < listIds.size(); i++) {
		ids[i] = Long.parseLong(listIds.get(i));
	    }
	    authConfigService.delete(ids);
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, listIds.toString()));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

    /**
     * 新增权限时，验证权限名字是否重复
     */
    @POST
    @Path("/validateName")
    @Consumes({ MediaType.APPLICATION_FORM_URLENCODED })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult isValiableAccount(@FormParam("name") String name, @FormParam("operator") String operator) {
	RestfulResult result = new RestfulResult();
	String operate = "验证权限名称是否重复";
	try {
	    List<AuthConfigEntity> managerauths = authConfigService.getByName(name);
	    if (managerauths == null || managerauths.size() == 0) {
		result.setResultCode(ReturnCode.SUCCESS.getFlag());
		result.setResultMessage(ReturnCode.SUCCESS.getDesc());
		logger.info(WebUtils.outLogInfo(operator, operate, name));
	    } else {
		result.setResultCode(ReturnCode.AUTHNAME_REPEAT.getFlag());
		result.setResultMessage(ReturnCode.AUTHNAME_REPEAT.getDesc());
		logger.info(WebUtils.outLogInfo(operator, operate, name));
	    }
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

}
