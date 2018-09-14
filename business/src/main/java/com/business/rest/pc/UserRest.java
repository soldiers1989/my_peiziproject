package com.business.rest.pc;

import java.util.Date;
import java.util.UUID;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import jxl.common.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.util.WebUtils;
import com.business.dto.model.RestfulResult;
import com.business.dto.model.UserDTO;
import com.business.entity.UserEntity;
import com.business.entity.VerifyCodeEntity;
import com.business.enums.ReturnCode;
import com.business.service.UserService;
import com.business.service.VerifyCodeService;

@Service
@Path("/pc/user")
public class UserRest {

	private static final Logger logger = Logger.getLogger(UserRest.class);

	@Autowired
	UserService userService;

	@Autowired
	VerifyCodeService verifyCodeService;
	
	/**
     * 生成uid
     */
    @GET
    @Path("/getuid")
    @Produces(MediaType.TEXT_PLAIN)
    public String getuid() {
    	return UUID.randomUUID().toString().replaceAll("-", "");
    }
	
	/**
	 * 注册
	 */
	@Path("/register")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult register(@FormParam("uid") String uid,
			@FormParam("mobile") String phone, @FormParam("code") String code,
			@FormParam("password") String password) {
		RestfulResult result = new RestfulResult();
		Date now = new Date();
		try {

			// 判断是否存在该用户
			UserEntity entity = userService.getByPhone(phone);
			if (entity != null) {
				result.setResultCode(UserReturnCode.USER_REPEAT.getFlag());
				result.setResultMessage(UserReturnCode.USER_REPEAT.getDesc());
				return result;
			}
			
			//验证码校验工作
			VerifyCodeEntity verifyCodeEntity = verifyCodeService.getByUid(uid);
			if (null == verifyCodeEntity){
				result.setResultCode(UserReturnCode.CODE_NOTSEND.getFlag());
				result.setResultMessage(UserReturnCode.CODE_NOTSEND.getDesc());
				return result;
			} else {
				if (!code.equals(verifyCodeEntity.getCode())){
					result.setResultCode(UserReturnCode.CODE_ERROR.getFlag());
					result.setResultMessage(UserReturnCode.CODE_ERROR.getDesc());
					return result;
				}
			}
			
			UserDTO dto = new UserDTO();
			dto.setUid(uid);
			dto.setPhone(phone);
			dto.setPassword(password);
			// 设置属性并保存数据库
			entity = new UserEntity();
			WebUtils.beanCopy(UserDTO.class, UserEntity.class, dto, entity);
			entity.setCreatetime(now);
			entity.setOperatetime(now);
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("system", "register",WebUtils.objectToJson(dto)));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("system", "register", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
	
	
	/**
	 * 登录
	 */
	@Path("/login")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult login(@FormParam("mobile") String phone, @FormParam("password") String password) {
		RestfulResult result = new RestfulResult();
		try {

			// 判断是否存在该用户
			UserEntity entity = userService.getByPhone(phone);
			if (null == entity) {
				result.setResultCode(UserReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(UserReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}
			
			UserDTO dto = new UserDTO();
			dto.setPhone(phone);
			dto.setPassword(password);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("system", "login",WebUtils.objectToJson(dto)));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("system", "login", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}

}
