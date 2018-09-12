package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.business.dao.VerifyCodeEntityDAO;
import com.business.entity.VerifyCodeEntity;
import com.business.service.VerifyCodeService;

@Service
@Transactional
public class VerifyCodeServiceImpl implements VerifyCodeService {

	@Autowired
	VerifyCodeEntityDAO verifyCodeEntityDAO;

	@Override
	public void saveOrUpdate(VerifyCodeEntity entity) throws Exception {
		verifyCodeEntityDAO.save(entity);
	}

	@Override
	public VerifyCodeEntity getByUid(String uid) throws Exception {
		return verifyCodeEntityDAO.findByUnique("uid", uid);
	}

	
}
