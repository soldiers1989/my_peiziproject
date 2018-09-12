package com.business.service;

import com.business.entity.UserEntity;

/**
 * 
 * @author cy
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
    
   
}