package com.business.service;

import java.util.List;

import com.base.orm.Page;
import com.business.entity.AccountEntity;

/**
 * 
 * @author zjl
 *
 */
public interface AccountService {

    /**
     * 更新店铺
     */
    public void saveOrUpdate(AccountEntity entity) throws Exception;

    /**
	 * 分页查询
	 */
	public Page<AccountEntity> getByPage(int pageNo, int pageSize,String account, Integer status) throws Exception;
    
	/**
	 * 通过帐号查询
	 */
	public AccountEntity getByAccount(String account) throws Exception;
	
    /**
     * 查询所有未使用的交易帐号
     */
    public List<AccountEntity> getAllNotUsed() throws Exception;

}
