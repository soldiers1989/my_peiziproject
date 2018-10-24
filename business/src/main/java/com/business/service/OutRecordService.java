package com.business.service;

import com.base.orm.Page;
import com.business.entity.OutRecordEntity;

/**
 * 
 * @author zjl
 *
 */
public interface OutRecordService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(OutRecordEntity entity) throws Exception;

	/**
	 * 分页查询
	 */
	public Page<OutRecordEntity> getByPage(int pageNo, int pageSize, Long userid,Integer status) throws Exception;
	
	/**
	 * 通过id查询
	 */
	public OutRecordEntity getById(Long id) throws Exception;
	
	
}