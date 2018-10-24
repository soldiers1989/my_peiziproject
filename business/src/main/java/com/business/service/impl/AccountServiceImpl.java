package com.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.AccountEntityDAO;
import com.business.entity.AccountEntity;
import com.business.service.AccountService;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {
    
    @Autowired
    private AccountEntityDAO accountEntityDAO;

	@Override
	public void saveOrUpdate(AccountEntity entity) throws Exception {
		accountEntityDAO.save(entity);
	}

	@Override
	public Page<AccountEntity> getByPage(int pageNo, int pageSize,String account, Integer status) throws Exception {
		return accountEntityDAO.getByPage(pageNo, pageSize,account, status);
	}

	@Override
	public AccountEntity getByAccount(String account) throws Exception {
		return accountEntityDAO.findByUnique("account", account);
	}

	@Override
	public List<AccountEntity> getAllNotUsed() throws Exception {
		return accountEntityDAO.getAllNotUsed();
	}

   



}
