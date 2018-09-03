package com.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.business.entity.SystemConfigEntity;
import com.business.enums.Status;

@Repository
public class SystemConfigEntityDAO extends HibernateDao<SystemConfigEntity, Long> {


    /**
     * 分页查询
     */
    public Page<SystemConfigEntity> getByPage(int pageNo, int pageSize, String code, String name, String value) {
	Page<SystemConfigEntity> page = new Page<SystemConfigEntity>(pageSize);
	page.setPageNo(pageNo);
	StringBuilder hql = new StringBuilder("from SystemConfigEntity where (status is null or status =" + Status.ACTIVE.value());
	hql.append(") and code like ? and name like ? and value like ? order by createtime desc");
	return this.find(page, hql.toString(), code, name, value);
    }

    /**
     * 根据Code，精确查询，取到相关的设定
     */
    public SystemConfigEntity getByCode(String code) {
	StringBuilder hql = new StringBuilder("from SystemConfigEntity where (status is null or status =" + Status.ACTIVE.value());
	hql.append(") and code = ? ");
	List<SystemConfigEntity> entitys = this.find(hql.toString(), code);
	// 如果结果大于1个，只取1个
	if (entitys.size() > 0) {
	    SystemConfigEntity entity = entitys.get(0);
	    return entity;
	} else {
	    return null;
	}
    }
}
