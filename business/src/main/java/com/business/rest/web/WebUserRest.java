package com.business.rest.web;

import java.util.Date;
import java.util.UUID;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
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
@Path("/web/user")
public class WebUserRest {

	private static final Logger logger = Logger.getLogger(WebUserRest.class);

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
	public RestfulResult register(@FormParam("uid") String uid, @FormParam("mobile") String phone, @FormParam("code") String code, @FormParam("password") String password, @FormParam("remdPhone") String remdPhone) {
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

			// 验证码校验工作
			VerifyCodeEntity verifyCodeEntity = verifyCodeService.getByUid(uid);
			if (null == verifyCodeEntity) {
				result.setResultCode(UserReturnCode.CODE_NOTSEND.getFlag());
				result.setResultMessage(UserReturnCode.CODE_NOTSEND.getDesc());
				return result;
			} else {
				if (!code.equals(verifyCodeEntity.getCode())) {
					result.setResultCode(UserReturnCode.CODE_ERROR.getFlag());
					result.setResultMessage(UserReturnCode.CODE_ERROR.getDesc());
					return result;
				}
			}

			UserDTO dto = new UserDTO();
			dto.setUid(uid);
			dto.setPhone(phone);
			dto.setPassword(password);
			dto.setRemdPhone(remdPhone);
			// 设置属性并保存数据库
			entity = new UserEntity();
			WebUtils.beanCopy(UserDTO.class, UserEntity.class, dto, entity);
			entity.setCreatetime(now);
			entity.setOperatetime(now);
			entity.setAmount(Long.valueOf("0"));
			entity.setCentStatus(0);
			entity.setBankStatus(0);
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("user", "register", WebUtils.objectToJson(dto)));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("user", "register", ex.getMessage()), ex);
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
			if (!password.equals(entity.getPassword())){
				result.setResultCode(UserReturnCode.PASSWORD_ERROR.getFlag());
				result.setResultMessage(UserReturnCode.PASSWORD_ERROR.getDesc());
				return result;
			}
			UserDTO dto = new UserDTO();
			dto.setPhone(phone);
			dto.setPassword(password);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("user", "login", WebUtils.objectToJson(dto)));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("user", "login", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}

	/**
	 * 找回密码
	 */
	@Path("/getpassword")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult getpassword(@FormParam("mobile") String phone, @FormParam("code") String code, @FormParam("password") String password) {
		RestfulResult result = new RestfulResult();
		try {

			// 判断是否存在该用户
			UserEntity entity = userService.getByPhone(phone);
			if (entity == null) {
				result.setResultCode(UserReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(UserReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}

			// 验证码校验工作
			VerifyCodeEntity verifyCodeEntity = verifyCodeService.getByUid(entity.getUid());
			if (null == verifyCodeEntity) {
				result.setResultCode(UserReturnCode.CODE_NOTSEND.getFlag());
				result.setResultMessage(UserReturnCode.CODE_NOTSEND.getDesc());
				return result;
			} else {
				if (!code.equals(verifyCodeEntity.getCode())) {
					result.setResultCode(UserReturnCode.CODE_ERROR.getFlag());
					result.setResultMessage(UserReturnCode.CODE_ERROR.getDesc());
					return result;
				}
			}

			entity.setPassword(password);
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("user", "getpassword",""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("user", "getpassword", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
	
	/**
	 * 获得余额
	 */
	@GET
	@Path("/getamount/{phone}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public UserDTO getamount(@PathParam("phone") String phone) {
		UserDTO dto = new UserDTO();
		try{
			UserEntity userEntity = userService.getByPhone(phone);
			if (null != userEntity){
				WebUtils.beanCopy(UserEntity.class, UserDTO.class, userEntity, dto);
				dto.setAmount((double)userEntity.getAmount()/100);
			}
			
		} catch(Exception ex){
			ex.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * 修改密码
	 */
	@Path("/modifypassword")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult modifypassword(@FormParam("account") String account, @FormParam("oldPassword") String oldPassword, @FormParam("newPassword") String newPassword) {
		RestfulResult result = new RestfulResult();
		try {

			// 判断是否存在该用户
			UserEntity entity = userService.getByPhone(account);
			if (entity == null) {
				result.setResultCode(UserReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(UserReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}

			if(!entity.getPassword().equals(oldPassword)){
				result.setResultCode(UserReturnCode.OLDPASSWORD_ERROR.getFlag());
				result.setResultMessage(UserReturnCode.OLDPASSWORD_ERROR.getDesc());
				return result;
			}

			entity.setPassword(newPassword);
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("user", "modifypassword",""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("user", "modifypassword", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
	
	/**
	 * 身份认证
	 */
	@Path("/centauth")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult centauth(@FormParam("account") String account, @FormParam("realName") String realName, @FormParam("codeNumber") String centNo) {
		RestfulResult result = new RestfulResult();
		try {

			// 判断是否存在该用户
			UserEntity entity = userService.getByPhone(account);
			if (entity == null) {
				result.setResultCode(UserReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(UserReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}
			entity.setRealName(realName);
			entity.setCentNo(centNo);
			entity.setCentStatus(1);
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("user", "modifypassword",""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("user", "modifypassword", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
	
	/**
	 * 银行绑定
	 */
	@Path("/bankauth")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public RestfulResult bankauth(@FormParam("account") String account, @FormParam("bank") String bankName, @FormParam("codeNumber") String bankNo) {
		RestfulResult result = new RestfulResult();
		try {

			// 判断是否存在该用户
			UserEntity entity = userService.getByPhone(account);
			if (entity == null) {
				result.setResultCode(UserReturnCode.USER_NOTEXIST.getFlag());
				result.setResultMessage(UserReturnCode.USER_NOTEXIST.getDesc());
				return result;
			}
			entity.setBankName(bankName);
			entity.setBankNo(bankNo);
			entity.setBankStatus(1);
			userService.saveOrUpdate(entity);
			result.setResultCode(ReturnCode.SUCCESS.getFlag());
			result.setResultMessage(ReturnCode.SUCCESS.getDesc());
			logger.info(WebUtils.outLogInfo("user", "modifypassword",""));
		} catch (Exception ex) {
			logger.error(WebUtils.outLogError("user", "modifypassword", ex.getMessage()), ex);
			result.setResultCode(ReturnCode.BUSINESS_ERROR.getFlag());
			result.setResultMessage(ReturnCode.BUSINESS_ERROR.getDesc());
		}
		return result;
	}
}
