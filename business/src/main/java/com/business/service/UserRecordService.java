package com.business.service;

import java.util.Date;
import java.util.List;

import com.base.orm.Page;
import com.business.entity.UserRecordEntity;

/**
 * 
 * @author cy
 *
 */
public interface UserRecordService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(UserRecordEntity entity) throws Exception;

    /**
     * 根据realname、phone查询
     */
    public UserRecordEntity getByRealnameAndPhone(String realname, String phone) throws Exception;
    
    /**
     * 分页查询
     */
    public Page<UserRecordEntity> getByPage(int pageNo, int pageSize, String realname,String phone,String accountbank, Date startTime, Date endTime) ;

    /**
     * 根据ID删除
     */
    public void deleteByIds(Long... ids);
    
    /**
     * 根据条件查询
     */
    public List<UserRecordEntity> getByCondition(String realname,String phone,String accountbank, Date startTime, Date endTime) ;
}
