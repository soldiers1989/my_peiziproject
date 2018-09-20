package com.business.service;

import com.base.orm.Page;
import com.business.entity.PeiziEntity;

/**
 * 
 * @author zjl
 *
 */
public interface PeiziService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(PeiziEntity entity) throws Exception;

	/**
	 * 分页查询
	 */
	public Page<PeiziEntity> getByPage(int pageNo, int pageSize, Long userid,Integer type) throws Exception;
}