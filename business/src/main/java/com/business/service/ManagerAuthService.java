package com.business.service;

import java.util.Date;
import java.util.List;

import com.base.orm.Page;
import com.business.entity.ManagerAuthEntity;

public interface ManagerAuthService {

    /**
     * 单个保存
     */
    public void save(ManagerAuthEntity entity) throws Exception;
    
    /**
     * 批量保存用户权限信息
     */
    public void saveBatch(List<ManagerAuthEntity> entities) throws Exception;

    /**
     * 根据managerid查询出账户拥有的权限
     */
    public List<ManagerAuthEntity> getByManagerid(Long managerid) throws Exception;

    /**
     * 修改用户权限信息
     */
    public void updateBatch(List<ManagerAuthEntity> entities) throws Exception;



    /**
     * 根据managerid删除管理员权限
     */
    public void deleteByManagerid(Long[] managerids) throws Exception;

    /**
     * 根据账号查找出它所具备的权限
     */
    public List<ManagerAuthEntity> getByAccount(String account) throws Exception;

    /**
     * 分页查询
     */
    public Page<ManagerAuthEntity> getByPage(int pageNo, int pageSize, String account, Date startTime, Date endTime) throws Exception;

}
