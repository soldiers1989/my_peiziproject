package com.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.AccountEntity;

@Repository
public class AccountEntityDAO extends HibernateDao<AccountEntity, Long> {

	/**
	 * 分页查询
	 */
	public Page<AccountEntity> getByPage(int pageNo, int pageSize,String account, Integer status) {
		Page<AccountEntity> page = new Page<AccountEntity>(pageSize);
		page.setPageNo(pageNo);
		StringBuilder hql = new StringBuilder("from AccountEntity where 1=1 ");
		if (!WebUtils.isEmpty(account)) {
			hql.append(" and account = '" + account + "'");
		}
		if (status.intValue() != -1) {
			hql.append(" and status = " + status);
		}
		hql.append("  order by createtime desc");
		return this.find(page, hql.toString());
	}
	
    /**
     * 查询所有未使用的交易帐号
     */
    public List<AccountEntity> getAllNotUsed() {
		StringBuilder hql = new StringBuilder("from AccountEntity where status=0");
		return this.find(hql.toString());
    }

}
