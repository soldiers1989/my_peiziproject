package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.InRecordEntityDAO;
import com.business.entity.InRecordEntity;
import com.business.service.InRecordService;

@Service
@Transactional
public class InRecordServiceImpl implements InRecordService {

	@Autowired
	InRecordEntityDAO inRecordEntityDAO;

	@Override
	public void saveOrUpdate(InRecordEntity entity) throws Exception {
		inRecordEntityDAO.save(entity);
	}

	@Override
	public Page<InRecordEntity> getByPage(int pageNo, int pageSize, Long userid,Integer status) throws Exception {
		return inRecordEntityDAO.getByPage(pageNo, pageSize, userid,status);
	}

	@Override
	public InRecordEntity getById(Long id) throws Exception {
		return inRecordEntityDAO.get(id);
	}


	
}
