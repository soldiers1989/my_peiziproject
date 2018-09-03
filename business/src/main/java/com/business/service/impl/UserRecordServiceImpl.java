package com.business.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.UserRecordEntityDAO;
import com.business.entity.UserRecordEntity;
import com.business.service.UserRecordService;

@Service
@Transactional
public class UserRecordServiceImpl implements UserRecordService {

    @Autowired
    UserRecordEntityDAO userRecordEntityDAO;

    @Override
    public void saveOrUpdate(UserRecordEntity entity) throws Exception {
	userRecordEntityDAO.save(entity);
    }

    @Override
    public UserRecordEntity getByRealnameAndPhone(String realname, String phone) throws Exception {
	return userRecordEntityDAO.getByRealnameAndPhone(realname, phone);
    }

    @Override
    public Page<UserRecordEntity> getByPage(int pageNo, int pageSize, String realname, String phone, String accountbank, Date startTime, Date endTime) {
	return userRecordEntityDAO.getByPage(pageNo, pageSize, realname, phone, accountbank, startTime, endTime);
    }

    @Override
    public void deleteByIds(Long... ids) {
	userRecordEntityDAO.deleteByIds(ids);
    }

    @Override
    public List<UserRecordEntity> getByCondition(String realname, String phone, String accountbank, Date startTime, Date endTime) {
	return userRecordEntityDAO.getByCondition(realname, phone, accountbank, startTime, endTime);
    }

}
