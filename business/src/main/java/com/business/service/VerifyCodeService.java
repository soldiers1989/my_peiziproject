package com.business.service;

import com.business.entity.VerifyCodeEntity;

/**
 * 
 * @author zjl
 *
 */
public interface VerifyCodeService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(VerifyCodeEntity entity) throws Exception;

    /**
     * 根据uid查询
     */
    public VerifyCodeEntity getByUid(String uid) throws Exception;
    
   
}