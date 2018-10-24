package com.business.dao;

import org.springframework.stereotype.Repository;

import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.OutRecordEntity;

@Repository
public class OutRecordEntityDAO extends HibernateDao<OutRecordEntity, Long> {

	/**
	 * 分页查询
	 */
	public Page<OutRecordEntity> getByPage(int pageNo, int pageSize, Long userid,Integer status) {
		Page<OutRecordEntity> page = new Page<OutRecordEntity>(pageSize);
		page.setPageNo(pageNo);
		StringBuilder hql = new StringBuilder("from OutRecordEntity where 1=1");
		if (!WebUtils.isEmpty(userid)) {
			hql.append(" and userid = " + userid);
		}
		
		if (status.intValue() != -1){
			hql.append(" and status = " + status);
		}
		hql.append("  order by createtime desc");
		return this.find(page, hql.toString());
	}

}
