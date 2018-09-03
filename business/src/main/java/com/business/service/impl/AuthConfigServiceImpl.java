package com.business.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.AuthConfigEntityDAO;
import com.business.dao.ManagerAuthEntityDAO;
import com.business.entity.AuthConfigEntity;
import com.business.service.AuthConfigService;

@Service
@Transactional
public class AuthConfigServiceImpl implements AuthConfigService {

    @Autowired
    AuthConfigEntityDAO authConfigEntityDAO;

    @Autowired
    ManagerAuthEntityDAO managerAuthEntityDAO;

    @Override
    public List<AuthConfigEntity> getAll() throws Exception {
	return authConfigEntityDAO.getAll();
    }

    @Override
    public Page<AuthConfigEntity> getByPage(int pageNo, int pageSize, String name, Date startTime, Date endTime) throws Exception {
	return authConfigEntityDAO.getByPage(pageNo, pageSize, name, startTime, endTime);
    }

    @Override
    public void save(AuthConfigEntity entity) throws Exception {
	authConfigEntityDAO.save(entity);
    }

    @Override
    public AuthConfigEntity getById(Long id) {
	return authConfigEntityDAO.get(id);
    }

    @Override
    @Transactional
    public void delete(Long... ids) throws Exception {
	authConfigEntityDAO.delete(ids);
	managerAuthEntityDAO.deleteByAuthid(ids);

    }

    @Override
    public List<AuthConfigEntity> getByName(String name) throws Exception {
	return authConfigEntityDAO.getByName(name);
    }

}
