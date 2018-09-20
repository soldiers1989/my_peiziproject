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
	public Page<InRecordEntity> getByPage(int pageNo, int pageSize, Long userid) throws Exception;

   
}