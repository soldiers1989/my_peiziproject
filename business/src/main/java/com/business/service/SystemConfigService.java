package com.business.service;

import java.util.List;

import com.base.orm.Page;
import com.business.entity.SystemConfigEntity;

/**
 * 
 * @author cy
 *
 */
public interface SystemConfigService {

    /**
     * 保存或更新
     */
    public void saveOrUpdate(SystemConfigEntity entity) throws Exception;


    /**
     * 根据id批量删除系统变量
     */
    public void deleteByIds(long... ids) throws Exception;
    
    /**
     * 批量保存更新
     */
    public void saveOrUpdateBatch(List<SystemConfigEntity> entitis) throws Exception;

    /**
     * 分页查询
     */
    public Page<SystemConfigEntity> getByPage(int pageNo, int pageSize, String code, String name, String value) throws Exception;

    /**
     * 根据Code，精确查询，取到相关的设定
     */
    public SystemConfigEntity getByCode(String code) throws Exception;

    /**
     * 根据id查询系统变量
     */
    public SystemConfigEntity get(long id) throws Exception;
}
