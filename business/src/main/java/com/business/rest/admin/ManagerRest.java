package com.business.rest.admin;

import java.net.URLDecoder;
import java.util.ArrayList;
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

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.ManagerDTO;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.entity.ManagerEntity;
import com.business.enums.ReturnCode;
import com.business.enums.Status;
import com.business.service.AuthConfigService;
import com.business.service.ManagerAuthService;
import com.business.service.ManagerService;

@Service
@Path("/business/manager")
public class ManagerRest {

    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    ManagerService managerService;
    @Autowired
    ManagerAuthService managerAuthService;
    @Autowired
    AuthConfigService authConfigService;

    /**
     * 用户登陆，验证账号是否正确。
     */
    @POST
    @Path("/login")
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult loginInfo(@FormParam("account") String account, @FormParam("password") String password) {
	RestfulResult result = new RestfulResult();
	ManagerEntity entity = null;
	String operate = "登录";
	try {
	    if (!"huanadmin".equals(account)) {
		password = WebUtils.md5(password);
	    }
	    entity = managerService.getByAccount(account);

	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(account, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	    return result;
	}
	if (entity == null) {
	    result.setResultCode(ReturnCode.USER_NOTEXIST.getFlag());
	    result.setResultMessage(ReturnCode.USER_NOTEXIST.getDesc());
	    logger.info(WebUtils.outLogInfo(account, operate, ReturnCode.USER_NOTEXIST.getDesc()));
	} else if (!password.equals(entity.getPassword())) {
	    result.setResultCode(ReturnCode.PASSWORD_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.PASSWORD_ERROR.getDesc());
	    logger.info(WebUtils.outLogInfo(account, operate, ReturnCode.USER_NOTEXIST.getDesc()));
	} else {
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(account, operate, ReturnCode.SUCCESS.getDesc()));
	}
	return result;
    }

    /**
     * 分页查询
     */
    @Path("/get/page")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public PageDTO<ManagerDTO> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("account") String account,
	    @FormParam("operator") String operator, @FormParam("startTime") String startTime, @FormParam("endTime") String endTime) {
	PageDTO<ManagerDTO> pagedtos = new PageDTO<ManagerDTO>();
	RestfulResult result = new RestfulResult();
	String operate = "分页查询管理员信息";
	try {
	    Date sTime = null;
	    Date eTime = null;

	    if (!WebUtils.isEmpty(startTime)) {
		sTime = java.sql.Date.valueOf(startTime);
	    }
	    if (!WebUtils.isEmpty(endTime)) {
		eTime = java.sql.Date.valueOf(endTime);
	    }
	    Page<ManagerEntity> entitys = managerService.getByPage(pageNo, pageSize, account, sTime, eTime);
	    pagedtos.setPageNo(pageNo);
	    pagedtos.setPageSize(pageSize);
	    pagedtos.setTotalPages(entitys.getTotalPages());
	    if (entitys.getResult().size() > 0) {
		pagedtos.setResult(new ArrayList<ManagerDTO>());
	    }
	    for (ManagerEntity entity : entitys.getResult()) {
		if (!"huanadmin".equals(entity.getAccount())) {
		    ManagerDTO dto = new ManagerDTO();
		    WebUtils.beanCopy(ManagerEntity.class, ManagerDTO.class, entity, dto);
		    dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		    dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
		    pagedtos.getResult().add(dto);
		}
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, account));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	pagedtos.setRestResult(result);
	return pagedtos;
    }

    /**
     * 保存账号
     */
    @Path("/save")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult save(ManagerDTO dto) {
	RestfulResult result = new RestfulResult();
	String operate = "保存管理员信息";
	try {
	    ManagerEntity managers = managerService.getByAccount(dto.getAccount());
	    if (managers != null) {
		result.setResultCode(ReturnCode.USER_REPEAT.getFlag());
		result.setResultMessage(ReturnCode.USER_REPEAT.getDesc());
		return result;
	    }
	    ManagerEntity entity = new ManagerEntity();
	    Date now = new Date();

	    WebUtils.beanCopy(ManagerDTO.class, ManagerEntity.class, dto, entity);
	    if (!"huanadmin".equals(dto.getAccount())) {
		if (dto.getPassword().length() != 32) {
		    entity.setPassword(WebUtils.md5(dto.getPassword()));
		}
	    } else {
		entity.setPassword(dto.getPassword());
	    }
	    entity.setStatus(Status.ACTIVE.value());
	    entity.setCreatetime(now);
	    entity.setOperatetime(now);
	    managerService.saveOrUpdate(entity);
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
    @Path("/get/primarykey")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public ManagerDTO getById(@FormParam("id") Long id, @FormParam("operator") String operator) {
	ManagerDTO dto = new ManagerDTO();
	RestfulResult result = new RestfulResult();
	String operate = "通过id查询管理员信息";
	try {
	    ManagerEntity entity = managerService.getById(id);
	    if (!WebUtils.isEmpty(entity)) {
		WebUtils.beanCopy(ManagerEntity.class, ManagerDTO.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
	    }

	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, id.toString()));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}

	dto.setResult(result);
	return dto;
    }

    /**
     * 修改账号信息
     */
    @Path("/update")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult update(ManagerDTO dto) {
	RestfulResult result = new RestfulResult();
	Date now = new Date();
	String operate = "更新管理员信息";
	try {
	    ManagerEntity entity = managerService.getById(dto.getId());
	    if (null == entity) {
		result.setResultCode(ReturnCode.USER_NOTEXIST.getFlag());
		result.setResultMessage(ReturnCode.USER_NOTEXIST.getDesc());
		return result;
	    } else {
		String pwd = entity.getPassword();
		WebUtils.beanCopy(ManagerDTO.class, ManagerEntity.class, dto, entity);
		if (!"huanadmin".equals(dto.getAccount())) {
		    if (dto.getPassword() != null) {
			if (dto.getPassword().length() != 32) {
			    entity.setPassword(WebUtils.md5(dto.getPassword()));
			}
		    } else {
			entity.setPassword(pwd);
		    }
		} else {
		    entity.setPassword(dto.getPassword());
		}
		entity.setOperatetime(now);
		entity.setStatus(Status.ACTIVE.value());
		managerService.saveOrUpdate(entity);
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
     * 批量删除账号信息
     */
    @Path("/delete/list")
    @POST
    @Consumes({ MediaType.APPLICATION_FORM_URLENCODED })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult batchRemove(@FormParam("id") List<String> listIds, @FormParam("operator") String operator) {
	RestfulResult result = new RestfulResult();
	String operate = "删除管理员信息";
	try {
	    Long[] ids = new Long[listIds.size()];
	    for (int i = 0; i < listIds.size(); i++) {
		ids[i] = Long.parseLong(listIds.get(i));
	    }
	    managerService.deleteByIds(ids);
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
     * 用于页面账号补全
     */
    @Path("/query/account/{name}")
    @GET
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public List<ManagerDTO> getByAccount(@PathParam("name") String name, @PathParam("operator") String operator) {
	List<ManagerDTO> dtos = new ArrayList<ManagerDTO>();
	RestfulResult result = new RestfulResult();
	String operate = "通过帐号模糊查询管理员信息";
	try {
	    name = URLDecoder.decode(name, "UTF-8");
	    if (WebUtils.isEmpty(name)) {
		name = "%%";
	    } else {
		name = "%" + name + "%";
	    }
	    List<ManagerEntity> entities = managerService.getByLikeAccount(name);
	    if (!WebUtils.isEmpty(entities)) {
		for (ManagerEntity entity : entities) {
		    ManagerDTO dto = new ManagerDTO();
		    WebUtils.beanCopy(ManagerEntity.class, ManagerDTO.class, entity, dto);
		    dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		    dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
		    dtos.add(dto);
		}
	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, name));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return dtos;
    }

    /**
     * 新增用户时，验证账号是否重复
     */
    @POST
    @Path("/validateAccount")
    @Consumes({ MediaType.APPLICATION_FORM_URLENCODED })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult validateAccount(@FormParam("account") String account, @PathParam("operator") String operator) {
	RestfulResult result = new RestfulResult();
	String operate = "验证管理员帐号是否重复";
	try {
	    ManagerEntity managerauths = managerService.getByAccount(account);
	    if (managerauths == null) {
		result.setResultCode(ReturnCode.SUCCESS.getFlag());
		result.setResultMessage(ReturnCode.SUCCESS.getDesc());
		logger.info(WebUtils.outLogInfo(operator, operate, account));
	    } else {
		result.setResultCode(ReturnCode.USER_REPEAT.getFlag());
		result.setResultMessage(ReturnCode.USER_REPEAT.getDesc());
		logger.info(WebUtils.outLogInfo(operator, operate, account));
	    }
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

    /**
     * 验证密码是否正确
     */
    @POST
    @Path("/validatePassword")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String validatePassword(@FormParam("currentpassword") String currentpassword, @FormParam("account") String account, @PathParam("operator") String operator) {
	// 修改密码时，验证密码是否正确。
	String RESTULT_SUCCESS = "1";
	String RESTULT_ERROR = "0";
	String operate = "验证管理员密码";
	try {
	    String password = "";
	    if (!"huanadmin".equals(account)) {
		if (currentpassword.length() != 32) {
		    password = WebUtils.md5(currentpassword);
		}
	    } else {
		password = currentpassword;
	    }
	    boolean isValiable = managerService.getByPassword(account, password);
	    if (isValiable) {
		return RESTULT_SUCCESS;
	    }
	    logger.info(WebUtils.outLogInfo(operator, operate, account));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    return RESTULT_ERROR;
	}

	return RESTULT_ERROR;
    }

    /**
     * 修改密码
     */
    @Path("/editPassword")
    @POST
    @Consumes({ MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult editPassword(String paras) {
	RestfulResult result = new RestfulResult();
	String account = "";
	String newPwd = "";
	String operate = "管理员修改密码";
	try {
	    JSONObject jsonObject = new JSONObject(paras);
	    account = jsonObject.getString("account");
	    newPwd = jsonObject.getString("newpassword");
	    ManagerEntity entity = managerService.getByAccount(account);
	    if (!"huanadmin".equals(account)) {
		if (newPwd.length() != 32) {
		    entity.setPassword(WebUtils.md5(newPwd));
		}
	    } else {
		entity.setPassword(newPwd);
	    }
	    entity.setStatus(Status.ACTIVE.value());
	    managerService.saveOrUpdate(entity);
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(account, operate, account + ":" + newPwd));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(account, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

}
