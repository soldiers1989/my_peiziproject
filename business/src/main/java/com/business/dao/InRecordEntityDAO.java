package com.business.dao;

import org.springframework.stereotype.Repository;

import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.InRecordEntity;

@Repository
public class InRecordEntityDAO extends HibernateDao<InRecordEntity, Long> {
	/**
	 * 分页查询
	 */
	public Page<InRecordEntity> getByPage(int pageNo, int pageSize, Long userid,Integer status) {
		Page<InRecordEntity> page = new Page<InRecordEntity>(pageSize);
		page.setPageNo(pageNo);
		StringBuilder hql = new StringBuilder("from InRecordEntity where 1=1");
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
