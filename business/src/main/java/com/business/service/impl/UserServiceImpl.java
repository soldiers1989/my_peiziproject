package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
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

	@Override
	public Page<UserEntity> getByPage(int pageNo, int pageSize, String phone) throws Exception {
		return userRecordEntityDAO.getByPage(pageNo, pageSize, phone);
	}

	@Override
	public UserEntity getById(Long id) throws Exception {
		return userRecordEntityDAO.get(id);
	}

}
