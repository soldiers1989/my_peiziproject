package com.business.rest.web;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import jxl.common.Logger;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.dto.model.UserRecord;
import com.business.entity.UserRecordEntity;
import com.business.enums.ReturnCode;
import com.business.help.ExportExcel;
import com.business.service.UserRecordService;

@Service
@Path("/business/userrecord")
public class UserRecordRest {

    private static final Logger logger = Logger.getLogger(UserRecordRest.class);

    @Autowired
    UserRecordService userRecordService;

    /**
     * 保存或更新
     */
    @Path("/save")
    @POST
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult saveOrUpdate(@FormParam("user_name") String realname, @FormParam("mobile") String phone, @FormParam("subBranch") String accountbank) {
	RestfulResult result = new RestfulResult();
	Date now = new Date();
	try {

	    // 判断是否重复提交
	    UserRecordEntity entity = userRecordService.getByRealnameAndPhone(realname, phone);
	    if (entity != null) {
		result.setResultCode(ReturnCode.REPEAT_SUBMIT.getFlag());
		result.setResultMessage(ReturnCode.REPEAT_SUBMIT.getDesc());
		return result;
	    }
	    UserRecord dto = new UserRecord();
	    dto.setRealname(realname);
	    dto.setPhone(phone);
	    dto.setAccountbank(accountbank);
	    // 设置属性并保存数据库
	    entity = new UserRecordEntity();
	    WebUtils.beanCopy(UserRecord.class, UserRecordEntity.class, dto, entity);
	    entity.setCreatetime(now);
	    userRecordService.saveOrUpdate(entity);
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	    logger.info(WebUtils.outLogInfo("system", "保存记录", WebUtils.objectToJson(dto)));
	} catch (Exception ex) {
	    logger.error(WebUtils.outLogError("system", "保存记录", ex.getMessage()), ex);
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
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public PageDTO<UserRecord> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("realname") String realname,
	    @FormParam("phone") String phone, @FormParam("accountbank") String accountbank, @FormParam("startTime") String startTime, @FormParam("endTime") String endTime) {
	PageDTO<UserRecord> pagedtos = new PageDTO<UserRecord>();
	RestfulResult result = new RestfulResult();
	try {
	    Date sTime = null;
	    Date eTime = null;

	    if (!WebUtils.isEmpty(startTime)) {
		sTime = java.sql.Date.valueOf(startTime);
	    }
	    if (!WebUtils.isEmpty(endTime)) {
		eTime = java.sql.Date.valueOf(endTime);
	    }
	    Page<UserRecordEntity> entitys = userRecordService.getByPage(pageNo, pageSize, realname, phone, accountbank, sTime, eTime);
	    pagedtos.setPageNo(pageNo);
	    pagedtos.setPageSize(pageSize);
	    pagedtos.setTotalPages(entitys.getTotalPages());
	    if (entitys.getResult().size() > 0) {
		pagedtos.setResult(new ArrayList<UserRecord>());
	    }
	    for (UserRecordEntity entity : entitys.getResult()) {
		UserRecord dto = new UserRecord();
		WebUtils.beanCopy(UserRecordEntity.class, UserRecord.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		pagedtos.getResult().add(dto);

	    }
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	} catch (Exception ex) {
	    ex.printStackTrace();
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	pagedtos.setRestResult(result);
	return pagedtos;
    }

    /**
     * 批量删除账号信息
     */
    @Path("/delete/list")
    @POST
    @Consumes({ MediaType.APPLICATION_FORM_URLENCODED })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult batchRemove(@FormParam("id") List<String> listIds) {
	RestfulResult result = new RestfulResult();
	try {
	    Long[] ids = new Long[listIds.size()];
	    for (int i = 0; i < listIds.size(); i++) {
		ids[i] = Long.parseLong(listIds.get(i));
	    }
	    userRecordService.deleteByIds(ids);
	    result.setResultCode(ReturnCode.SUCCESS.getFlag());
	    result.setResultMessage(ReturnCode.SUCCESS.getDesc());
	} catch (Exception ex) {
	    ex.printStackTrace();
	    result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
	    result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
	}
	return result;
    }

    /**
     * 导出上报信息
     */
    @Path("/exportUserRecords")
    @GET
    @Produces(MediaType.APPLICATION_OCTET_STREAM)
    public Response exportUserRecords(@QueryParam("realname") String realname, @QueryParam("phone") String phone, @QueryParam("accountbank") String accountbank, @QueryParam("startTime") String startTime,
	    @QueryParam("endTime") String endTime) {
	// 创建 一个 内存输出流
	ByteArrayOutputStream bos = new ByteArrayOutputStream();
	String fileName = "";
	Date sTime = null;
	Date eTime = null;

	if (!WebUtils.isEmpty(startTime)) {
	    sTime = java.sql.Date.valueOf(startTime);
	}
	if (!WebUtils.isEmpty(endTime)) {
	    eTime = java.sql.Date.valueOf(endTime);
	}
	try {
	    List<UserRecordEntity> userRecordEntities = userRecordService.getByCondition(realname, phone, accountbank, sTime, eTime);
	    List<UserRecord> dtos = new ArrayList<UserRecord>();
	    for (UserRecordEntity entity : userRecordEntities) {
		UserRecord dto = new UserRecord();
		dto.setRealname(entity.getRealname());
		dto.setPhone(entity.getPhone());
		dto.setAccountbank(entity.getAccountbank());
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "YYYY-MM-dd HH:mm:ss"));
		dtos.add(dto);
	    }
	    // 将结果转化为json数组
	    JSONArray jarray = JSONArray.fromObject(WebUtils.objectToJson(dtos));
	    String[] headers = { "姓名", "电话", "所在球迷会", "上报时间" };
	    String[] keys = { "realname", "phone", "accountbank", "createtime" };
	    fileName = "UserRecords";
	    ExportExcel.exportExcel("上报导出", headers, jarray, keys, bos);
	    fileName += ".xls";
	    fileName = new String(fileName.getBytes("utf-8"), "ISO8859-1");
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
	// 输出 excel
	return Response.ok(bos.toByteArray()).header("Content-Disposition", "attachment; filename=" + fileName).build();
    }

}
