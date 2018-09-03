/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.business.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.ManagerAuthEntityDAO;
import com.business.dao.ManagerEntityDAO;
import com.business.entity.ManagerAuthEntity;
import com.business.entity.ManagerEntity;
import com.business.service.ManagerService;

/**
 * 
 * @author kevin
 */
@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    ManagerEntityDAO managerEntityDAO;

    @Autowired
    ManagerAuthEntityDAO managerAuthEntityDAO;

    /**
     * 验证用户登录信息
     */
    @Override
    public ManagerEntity getByAccount(String account) throws Exception {
	ManagerEntity entity = null;
	List<ManagerEntity> mans = managerEntityDAO.getByAccount(account);
	if (mans != null && mans.size() > 0) {
	    entity = mans.get(0);
	}
	return entity;
    }

    /**
     * 根据条件查询账号信息，用于页面显示
     */
    @Override
    public Page<ManagerEntity> getByPage(int pageNo, int pageSize, String account, Date startTime, Date endTime) throws Exception {
	return managerEntityDAO.getByPage(pageNo, pageSize, account, startTime, endTime);
    }

    @Override
    public void saveOrUpdate(ManagerEntity entity) throws Exception {
	managerEntityDAO.save(entity);
    }

    @Override
    public ManagerEntity getById(Long id) throws Exception {
	return managerEntityDAO.get(id);
    }

    @Override
    public void deleteByIds(Long... ids) throws Exception {
	managerEntityDAO.deleteByIds(ids);
	managerAuthEntityDAO.deleteByManagerid(ids);
    }

    @Override
    public void saveOrUpdateManagerAndManagerAuth(ManagerEntity entity, ManagerAuthEntity authentity) throws Exception {
	managerEntityDAO.save(entity);
	managerAuthEntityDAO.save(authentity);
    }

    @Override
    public boolean getByPassword(String account, String password) throws Exception {
	boolean flag = false;
	List<ManagerEntity> entitys = managerEntityDAO.getByAccountAndPassword(account, password);
	if (entitys != null && entitys.size() != 0) {
	    flag = true;
	}
	return flag;
    }

    @Override
    public List<ManagerEntity> getAll() {
	return managerEntityDAO.getAll();
    }

    @Override
    public List<ManagerEntity> getByLikeAccount(String account) throws Exception {
	return managerEntityDAO.getByLikeAccount(account);
    }

    @Override
    public Page<ManagerEntity> getByPageWithAuth(int pageNo, int pageSize, String account, Date startTime, Date endTime) throws Exception {
	return managerEntityDAO.getByPageWithAuth(pageNo, pageSize, account, startTime, endTime);
    }

}
