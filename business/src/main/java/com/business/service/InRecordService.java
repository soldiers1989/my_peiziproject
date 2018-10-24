package com.business.service;

import com.base.orm.Page;
import com.business.entity.InRecordEntity;

/**
 * 
 * @author zjl
 *
 */
public interface InRecordService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(InRecordEntity entity) throws Exception;
    
    /**
	 * 分页查询
	 */
	public Page<InRecordEntity> getByPage(int pageNo, int pageSize, Long userid,Integer status) throws Exception;

	
	/**
	 * 通过id查询
	 */
	public InRecordEntity getById(Long id) throws Exception;
   
}