package com.business.dao;

import org.springframework.stereotype.Repository;

import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.UserEntity;

@Repository
public class UserEntityDAO extends HibernateDao<UserEntity, Long> {

	/**
	 * 分页查询
	 */
	public Page<UserEntity> getByPage(int pageNo, int pageSize, String phone,String account) {
		Page<UserEntity> page = new Page<UserEntity>(pageSize);
		page.setPageNo(pageNo);
		StringBuilder hql = new StringBuilder("from UserEntity where 1=1");
		if (!WebUtils.isEmpty(phone)) {
			hql.append(" and phone = '" + phone + "'");
		}
		if (!WebUtils.isEmpty(account)) {
			hql.append(" and account = '" + account + "'");
		}
		hql.append(" order by createtime desc");
		return this.find(page, hql.toString());
	}
    
}
