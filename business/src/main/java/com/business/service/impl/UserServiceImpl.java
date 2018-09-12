package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.business.dao.UserEntityDAO;
import com.business.entity.UserEntity;
import com.business.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserEntityDAO userRecordEntityDAO;

	@Override
	public void saveOrUpdate(UserEntity entity) throws Exception {
		userRecordEntityDAO.save(entity);
	}

	@Override
	public UserEntity getByPhone(String phone) throws Exception {
		return userRecordEntityDAO.findByUnique("phone", phone);
	}

}
