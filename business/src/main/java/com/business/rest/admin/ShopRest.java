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

import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.orm.Page;
import com.base.util.WebUtils;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.dto.model.Shop;
import com.business.entity.ShopEntity;
import com.business.enums.ReturnCode;
import com.business.enums.Status;
import com.business.help.FilePathHelper;
import com.business.service.ShopService;

/**
 * 店铺REST类
 * 
 */
@Service
@Path("/business/shop")
public class ShopRest {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private ShopService shopService;

    /**
     * 保存更新
     */
    @Path("/save")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult save(Shop dto) {
	RestfulResult result = new RestfulResult();
	Date now = new Date();
	String operate = "保存店铺";
	try {
	    if (dto.getId() == null) {
		ShopEntity entity = new ShopEntity();
		WebUtils.beanCopy(Shop.class, ShopEntity.class, dto, entity);
		entity.setOperatetime(now);
		entity.setCreatetime(now);
		entity.setStatus(Status.ACTIVE.value());// 默认 通过
		shopService.saveorUpdate(entity);
	    } else {
		ShopEntity entity = shopService.get(dto.getId());
		WebUtils.beanCopy(Shop.class, ShopEntity.class, dto, entity);
		entity.setOperatetime(now);
		entity.setStatus(Status.ACTIVE.value());// 默认 通过
		shopService.saveorUpdate(entity);
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
     * 分页查询
     */
    @Path("/get/page")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public PageDTO<Shop> getByPage(@DefaultValue("1") @FormParam("pageNo") int pageNo, @DefaultValue("10") @FormParam("pageSize") int pageSize, @FormParam("name") String name,
	    @FormParam("operator") String operator) {
	PageDTO<Shop> dtos = new PageDTO<Shop>();
	RestfulResult result = new RestfulResult();
	String operate = "分页查询店铺";
	try {
	    Page<ShopEntity> entities = this.shopService.getByPage(pageNo, pageSize, name);
	    dtos.setPageNo(pageNo);
	    dtos.setPageSize(pageSize);
	    dtos.setTotalPages(entities.getTotalPages());
	    if (entities.getTotalCount() > 0) {
		dtos.setResult(new ArrayList<Shop>());
	    }
	    for (ShopEntity entity : entities.getResult()) {
		Shop dto = new Shop();
		WebUtils.beanCopy(ShopEntity.class, Shop.class, entity, dto);
		dto.setCreatetime(WebUtils.formatDate2Str(entity.getCreatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setOperatetime(WebUtils.formatDate2Str(entity.getOperatetime(), "yyyy-MM-dd HH:mm:ss"));
		dto.setIconurl(FilePathHelper.getFileUrl(entity.getCreatetime(), dto.getIcon()));
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
     * 通过id查询
     */
    @Path("/get/primarykey")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public Shop getById(@FormParam("id") Long id, @FormParam("operator") String operator) {
	Shop dto = new Shop();
	RestfulResult result = new RestfulResult();
	String operate = "通过id查询店铺";
	try {
	    ShopEntity entity = shopService.get(id);
	    if (entity != null) {
		WebUtils.beanCopy(ShopEntity.class, Shop.class, entity, dto);
		dto.setIconurl(FilePathHelper.getFileUrl(entity.getCreatetime(), dto.getIcon()));
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

    /**
     * 批量删除
     */
    @Path("/delete/list")
    @POST
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public RestfulResult deleteByIds(@FormParam("ids") List<Long> ids, @FormParam("operator") String operator) {
	RestfulResult result = new RestfulResult();
	String operate = "删除店铺";
	try {
	    shopService.deleteByIds(ArrayUtils.toPrimitive(ids.toArray(new Long[0])));
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
