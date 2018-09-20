package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.PeiziEntityDAO;
import com.business.entity.PeiziEntity;
import com.business.service.PeiziService;

@Service
@Transactional
public class PeiziServiceImpl implements PeiziService {

	@Autowired
	PeiziEntityDAO peiziEntityDAO;

	@Override
	public void saveOrUpdate(PeiziEntity entity) throws Exception {
		peiziEntityDAO.save(entity);
	}

	@Override
	public Page<PeiziEntity> getByPage(int pageNo, int pageSize, Long userid, Integer type) throws Exception {
		return peiziEntityDAO.getByPage(pageNo, pageSize, userid, type);
	}

	
}
