package com.business.service;

import com.base.orm.Page;
import com.business.entity.UserEntity;

/**
 * 
 * @author zjl
 *
 */
public interface UserService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(UserEntity entity) throws Exception;

    /**
     * 根据phone查询
     */
    public UserEntity getByPhone(String phone) throws Exception;
    
    /**
	 * 分页查询
	 */
	public Page<UserEntity> getByPage(int pageNo, int pageSize, String phone) throws Exception;
	
	/**
	 * 通过id查询
	 */
	public UserEntity getById(Long id) throws Exception;
    
   
}