package com.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.business.dao.ShopEntityDAO;
import com.business.entity.ShopEntity;
import com.business.service.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {
    
    @Autowired
    private ShopEntityDAO shopEntityDAO;

    @Override
    public void saveorUpdate(ShopEntity entity) throws Exception {
	shopEntityDAO.save(entity);
    }

    @Override
    public void deleteByIds(long... ids) throws Exception {
	for (long id : ids) {
	    shopEntityDAO.delete(id);

	}
    }

    @Override
    public Page<ShopEntity> getByPage(int pageNo, int pageSize, String name) {
	return shopEntityDAO.getByPage(pageNo, pageSize, name);
    }

    @Override
    public ShopEntity get(long id) {
	return shopEntityDAO.get(id);
    }

    @Override
    public void updateStatus(long id) {
	shopEntityDAO.updateStatus(id);
    }

    @Override
    public List<ShopEntity> getAll() {
	return shopEntityDAO.getAll();
    }

   



}
