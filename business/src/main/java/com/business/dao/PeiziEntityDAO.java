package com.business.dao;

import org.springframework.stereotype.Repository;

import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.PeiziEntity;

@Repository
public class PeiziEntityDAO extends HibernateDao<PeiziEntity, Long> {

	/**
	 * 分页查询
	 */
	public Page<PeiziEntity> getByPage(int pageNo, int pageSize, Long userid,Integer type,Integer status) {
		Page<PeiziEntity> page = new Page<PeiziEntity>(pageSize);
		page.setPageNo(pageNo);
		StringBuilder hql = new StringBuilder("from PeiziEntity where 1=1");
		if (!WebUtils.isEmpty(userid)) {
			hql.append(" and userid = " + userid);
		}
		if (!WebUtils.isEmpty(type)) {
			hql.append(" and type = " + type);
		}
		if (status.intValue() != -1){
			hql.append(" and status = " + status);
		}
		hql.append("  order by createtime desc");
		return this.find(page, hql.toString());
	}

}
