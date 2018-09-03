package com.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.SystemConfigEntityDAO;
import com.business.entity.SystemConfigEntity;
import com.business.service.SystemConfigService;

@Service
@Transactional
public class SystemConfigServiceImpl implements SystemConfigService {

    @Autowired
    SystemConfigEntityDAO systemConfigEntityDAO;

    @Override
    public void saveOrUpdate(SystemConfigEntity entity) throws Exception {
	systemConfigEntityDAO.save(entity);
    }

    @Override
    public SystemConfigEntity get(long id) {
	return systemConfigEntityDAO.get(id);
    }

    @Override
    public void deleteByIds(long... ids) throws Exception {
	for (long id : ids) {
	    systemConfigEntityDAO.delete(id);
	}
    }

    @Override
    public void saveOrUpdateBatch(List<SystemConfigEntity> entitis) throws Exception {
	for (SystemConfigEntity entity : entitis) {
	    this.systemConfigEntityDAO.save(entity);
	}
    }

    @Override
    public Page<SystemConfigEntity> getByPage(int pageNo, int pageSize, String code, String name, String value) {
	return systemConfigEntityDAO.getByPage(pageNo, pageSize, code, name, value);
    }

    @Override
    public SystemConfigEntity getByCode(String code) {
	return systemConfigEntityDAO.getByCode(code);
    }
}
