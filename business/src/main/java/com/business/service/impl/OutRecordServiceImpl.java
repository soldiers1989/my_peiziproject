package com.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.business.dao.OutRecordEntityDAO;
import com.business.entity.OutRecordEntity;
import com.business.service.OutRecordService;

@Service
@Transactional
public class OutRecordServiceImpl implements OutRecordService {

	@Autowired
	OutRecordEntityDAO outRecordEntityDAO;

	@Override
	public void saveOrUpdate(OutRecordEntity entity) throws Exception {
		outRecordEntityDAO.save(entity);
	}

}
