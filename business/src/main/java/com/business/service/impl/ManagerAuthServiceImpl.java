package com.business.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.ManagerAuthEntityDAO;
import com.business.entity.ManagerAuthEntity;
import com.business.service.ManagerAuthService;

@Service
@Transactional
public class ManagerAuthServiceImpl implements ManagerAuthService {

    @Autowired
    ManagerAuthEntityDAO managerAuthEntityDAO;

    @Override
    public void save(ManagerAuthEntity entity) throws Exception {
	managerAuthEntityDAO.save(entity);

    }

    @Override
    public void saveBatch(List<ManagerAuthEntity> entities) throws Exception {

	for (ManagerAuthEntity entity : entities) {
	    managerAuthEntityDAO.save(entity);
	}

    }

    @Override
    public List<ManagerAuthEntity> getByManagerid(Long managerid) throws Exception {
	return managerAuthEntityDAO.getByManagerid(managerid);
    }

    @Override
    public void updateBatch(List<ManagerAuthEntity> entities) throws Exception {
	Long managerid = entities.get(0).getManagerid();
	List<ManagerAuthEntity> managerauthEntities = managerAuthEntityDAO.getByManagerid(managerid);
	for (ManagerAuthEntity managerauthEntity : managerauthEntities) {
	    managerAuthEntityDAO.delete(managerauthEntity);
	}
	this.saveBatch(entities);
    }

    @Override
    public void deleteByManagerid(Long[] managerids) throws Exception {
	managerAuthEntityDAO.deleteByManagerid(managerids);
    }

    @Override
    public List<ManagerAuthEntity> getByAccount(String account) throws Exception {
	return managerAuthEntityDAO.getByAccount(account);
    }

    @Override
    public Page<ManagerAuthEntity> getByPage(int pageNo, int pageSize, String account, Date startTime, Date endTime) throws Exception {
	return managerAuthEntityDAO.getByPage(pageNo, pageSize, account, startTime, endTime);
    }

}
