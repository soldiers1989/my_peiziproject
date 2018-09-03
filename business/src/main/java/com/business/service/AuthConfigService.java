package com.business.service;

import java.util.Date;
import java.util.List;

import com.base.orm.Page;
import com.business.entity.AuthConfigEntity;

public interface AuthConfigService {

    /**
     * 查询出所有的导航菜单。构造树结构
     */
    List<AuthConfigEntity> getAll() throws Exception;


    /**
     * 保存AuthConfigEntity信息
     */
    public void save(AuthConfigEntity entity) throws Exception;

    /**
     * 根据ID条件查询AuthConfigEntity信息
     */
    public AuthConfigEntity getById(Long id) throws Exception;

    /**
     * 根据ID删除AuthConfigEntity信息
     */
    public void delete(Long[] ids) throws Exception;

    /**
     * 根据条件分页查询
     */
    public Page<AuthConfigEntity> getByPage(int pageNo, int pageSize, String name, Date startTime, Date endTime) throws Exception;

    /**
     * 验证权限名称是否重复
     */
    public List<AuthConfigEntity> getByName(String name) throws Exception;
}
