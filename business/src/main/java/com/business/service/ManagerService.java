package com.business.service;

import java.util.Date;
import java.util.List;

import com.base.orm.Page;
import com.business.entity.ManagerAuthEntity;
import com.business.entity.ManagerEntity;

public interface ManagerService {

    /**
     * 根据account查找账户信息
     */
    public ManagerEntity getByAccount(String account) throws Exception;
    
    /**
     * 根据条件查询
     */
    public Page<ManagerEntity> getByPage(int pageNo, int pageSize, String account, Date startTime, Date endTime) throws Exception;

    /**
     * 保存manager信息
     */
    public void saveOrUpdate(ManagerEntity entity) throws Exception;

    /**
     * 根据id查询
     */
    public ManagerEntity getById(Long id) throws Exception;

    /**
     * 根据条件删除
     */
    public void deleteByIds(Long[] ids) throws Exception;

    /**
     * 同步保存账户信息和权限配置信息
     */
    public void saveOrUpdateManagerAndManagerAuth(ManagerEntity entity, ManagerAuthEntity authentity) throws Exception;


    /**
     * 判断旧密码是否正确
     */
    public boolean getByPassword(String account, String password) throws Exception;

    /**
     * 查询所有的用户
     */
    public List<ManagerEntity> getAll();
    
    /**
     * 根据账号名称模糊
     */
    public List<ManagerEntity> getByLikeAccount(String account) throws Exception;
    
    /**
     * 查询已经赋权限的管理员
     */
    public Page<ManagerEntity> getByPageWithAuth(int pageNo, int pageSize, String account, Date startTime, Date endTime) throws Exception;

}
