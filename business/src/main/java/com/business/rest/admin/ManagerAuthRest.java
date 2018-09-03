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
import com.business.dto.model.AuthConfig;
import com.business.dto.model.ManagerAuth;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.entity.AuthConfigEntity;
import com.business.entity.ManagerAuthEntity;
import com.business.entity.ManagerEntity;
import com.business.enums.ReturnCode;
import com.business.enums.Status;
import com.business.help.AdaptationTree;
import com.business.help.Dynatree;
import com.business.service.AuthConfigService;
import com.business.service.ManagerAuthService;
import com.business.service.ManagerService;

@Service
@Path("/business/managerAuth")
public class ManagerAuthRest {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    ManagerAuthService managerAuthService;
    @Autowired
    AuthConfigService authConfigService;
    @Autowired
    ManagerService managerService;

    /**
     * 分页显示managerAuth列表
     */
    @Path("/get/page")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public PageDTO<ManagerAuth> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("account") String account,
	    @FormParam("startTime") String startTime, @FormParam("operator") String operator, @FormParam("endTime") String endTime) {
	PageDTO<ManagerAuth> dtos = new PageDTO<ManagerAuth>();
	RestfulResult result = new RestfulResult();
	Date sTime = null;
	Date eTime = null;
	String operate = "分页查询用户权限";
	try {
	    if (!WebUtils.isEmpty(startTime)) {
		sTime = java.sql.Date.valueOf(startTime);
	    }
	    if (!WebUtils.isEmpty(endTime)) {
		eTime = java.sql.Date.valueOf(endTime);
	    }

	    Page<ManagerEntity> appstoreManagerEntities = managerService.getByPageWithAuth(pageNo, pageSize, account, sTime, eTime);
	    // 总数，用于分页
	    int count = appstoreManagerEntities.getTotalCount();
	    if (appstoreManagerEntities.getResult().size() > 0) {
		dtos.setResult(new ArrayList<ManagerAuth>());
	    }
	    for (ManagerEntity entity : appstoreManagerEntities.getResult()) {

		List<ManagerAuthEntity> appstoreManagerAuthEntities = managerAuthService.getByManagerid(entity.getId());
		if (null != appstoreManagerAuthEntities && appstoreManagerAuthEntities.size() > 0) {
		    String authnames = "";
		    for (ManagerAuthEntity appstoreManagerAuthEntity : appstoreManagerAuthEntities) {
			AuthConfigEntity authconfigEntity = authConfigService.getById(appstoreManagerAuthEntity.getAuthid());
			authnames += authconfigEntity.getName() + ",";
		    }
		    if (authnames.lastIndexOf(",") != -1) {
			authnames = authnames.substring(0, authnames.lastIndexOf(","));
		    }
		    ManagerAuth dto = new ManagerAuth();
		    dto.setAuthnames(authnames);
		    dto.setAccount(entity.getAccount());
		    dto.setOperator(appstoreManagerAuthEntities.get(0).getOperator());
		    
		    dto.setManagerid(entity.getId());
		    dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		    dto.setOperatetime(WebUtils.formatDate2Str(appstoreManagerAuthEntities.get(0).getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
		    dtos.getResult().add(dto);
		}
	    }
	    dtos.setPageNo(pageNo);
	    dtos.setPageSize(pageSize);
	    appstoreManagerEntities.setTotalCount(count);
	    // 设置分页
	    dtos.setTotalPages(appstoreManagerEntities.getTotalPages());
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, account));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	dtos.setRestResult(result);
	return dtos;
    }

    /**
     * 给账号赋权限
     */
    @Path("/save")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult saveManagerauth(ManagerAuth dto) {
	RestfulResult result = new RestfulResult();
	String operate = "保存用户权限";
	try {
	    ManagerEntity managerEntity = managerService.getByAccount(dto.getAccount());
	    if (managerEntity == null) {
		result.setResultCode(ReturnCode.USER_NOTEXIST.getFlag());
		result.setResultMessage(ReturnCode.USER_NOTEXIST.getDesc());
		return result;
	    }
	    List<ManagerAuthEntity> managerauthEntities = this.saveOrUpdateManageAuth(dto);
	    managerAuthService.saveBatch(managerauthEntities);
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
     * 修改账号权限
     */
    @Path("/update")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult updateManagerauth(ManagerAuth dto) {
	RestfulResult result = new RestfulResult();
	String operate = "修改用户权限";
	try {
	    List<ManagerAuthEntity> managerauthEntities = this.saveOrUpdateManageAuth(dto);
	    managerAuthService.saveBatch(managerauthEntities);
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
     * 得到需要保存的权限合集
     */
    private List<ManagerAuthEntity> saveOrUpdateManageAuth(ManagerAuth managerauth) {
	List<ManagerAuthEntity> managerauthEntities = new ArrayList<ManagerAuthEntity>();
	try {
	    if (WebUtils.isEmpty(managerauth.getSelectKeys())) {
		return null;
	    }
	    String[] selectKeys = managerauth.getSelectKeys().split(",");
	    if (selectKeys != null && selectKeys.length > 0) {
		Date createtime = Calendar.getInstance().getTime();
		for (String selectKey : selectKeys) {
		    ManagerAuthEntity managerauthEntity = new ManagerAuthEntity();
		    ManagerEntity managerEntity = managerService.getByAccount(managerauth.getAccount());
		    managerauthEntity.setManagerid(managerEntity.getId());
		    managerauthEntity.setAuthid(Long.valueOf(selectKey.trim()));
		    managerauthEntity.setOperator(managerauth.getOperator());
		    managerauthEntity.setCreatetime(createtime);
		    managerauthEntity.setOperatetime(createtime);
		    managerauthEntity.setStatus(Integer.valueOf(Status.ACTIVE.value()));
		    managerauthEntities.add(managerauthEntity);
		}
	    }
	} catch (Exception ex) {
	    logger.error(ex.getMessage(), ex);
	}
	return managerauthEntities;
    }

    /**
     * 删除权限
     */
    @Path("/delete/list")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult deleteManagerauth(@FormParam("id") List<String> ids, @FormParam("userId") String userid) {
	RestfulResult result = new RestfulResult();
	String operate = "删除用户权限";
	try {
	    Long[] managerids = new Long[ids.size()];
	    for (int i = 0; i < ids.size(); i++) {
		managerids[i] = Long.parseLong(ids.get(i));
	    }

	    managerAuthService.deleteByManagerid(managerids);
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(userid, operate, ids.toString()));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(userid, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

    /**
     * 修改管理员权限信息时，查询出此管理员所具有的权限
     */
    @Path("/query/{managerid}")
    @GET
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public ManagerAuth getManagerauth(@PathParam("managerid") String managerid, @PathParam("operator") String operator) {
	ManagerAuth managerauth = new ManagerAuth();
	RestfulResult result = new RestfulResult();
	String operate = "通过managerid查询用户权限";
	String selectKeys = "";
	try {
	    List<Dynatree> dynatrees = AdaptationTree.getResultTrees(authConfigService.getAll());
	    List<ManagerAuthEntity> managerauthEntities = managerAuthService.getByManagerid(Long.valueOf(managerid));
	    ManagerEntity managerEntity = managerService.getById(Long.valueOf(managerid));
	    if (managerauthEntities != null && managerauthEntities.size() > 0) {
		managerauth.setAccount(managerEntity.getAccount());
		for (ManagerAuthEntity managerauthEntity : managerauthEntities) {
		    selectKeys += managerauthEntity.getAuthid() + ",";
		    String key = managerauthEntity.getAuthid() + "";
		    setEachSelectKey(dynatrees, key);
		}
	    }

	    if (selectKeys.lastIndexOf(",") != -1) {
		selectKeys = selectKeys.substring(0, selectKeys.lastIndexOf(","));
	    }
	    JSONArray jarr = JSONArray.fromObject(dynatrees);
	    managerauth.setDynatrees(jarr.toString());
	    managerauth.setSelectKeys(selectKeys);
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo(operator, operate, managerid));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	managerauth.setResult(result);
	return managerauth;
    }

    /**
     * 取得账号所具有的权限
     */
    @Path("/queryAuth/{account}")
    @GET
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public List<AuthConfig> getManagerauthByAccount(@PathParam("account") String account, @PathParam("operator") String operator) {
	List<AuthConfig> authconfigs = new ArrayList<AuthConfig>();
	String operate = "通过account查询用户权限";
	try {
	    // 取得用户的权限，并将结果转为DTO
	    List<ManagerAuthEntity> managers = managerAuthService.getByAccount(account);
	    for (ManagerAuthEntity managerauthEntity : managers) {
		AuthConfig authconfig = new AuthConfig();
		AuthConfigEntity authconfigEntity = authConfigService.getById(managerauthEntity.getAuthid());
		WebUtils.beanCopy(AuthConfigEntity.class, AuthConfig.class, authconfigEntity, authconfig);
		authconfig.setName(authconfigEntity.getName());
		authconfig.setUrl(authconfigEntity.getUrl());
		authconfigs.add(authconfig);
	    }
	    logger.info(WebUtils.outLogInfo(operator, operate, account));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError(operator, operate, ex.getMessage()), ex);
	}
	return authconfigs;
    }

    /**
     * 设置选中节点
     */
    private void setEachSelectKey(List<Dynatree> dynatrees, String key) {
	if (dynatrees == null) {
	    return;
	}
	for (Dynatree dynatree : dynatrees) {
	    if (key.equals(dynatree.getKey())) {
		dynatree.setSelect(true);
		break;
	    }
	    if (dynatree.getChildren() == null) {
		break;
	    }
	    for (Dynatree dynatree2 : dynatree.getChildren()) {
		if (key.equals(dynatree2.getKey())) {
		    dynatree2.setSelect(true);
		    break;
		}
		this.setEachSelectKey(dynatree2.getChildren(), key);
	    }
	}
    }
}
