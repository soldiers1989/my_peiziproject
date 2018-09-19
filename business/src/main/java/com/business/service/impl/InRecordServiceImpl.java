package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


	
}
