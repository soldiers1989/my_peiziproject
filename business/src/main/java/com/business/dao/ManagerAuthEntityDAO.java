package com.business.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;


import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.ManagerAuthEntity;
import com.business.enums.Status;


@Repository
public class ManagerAuthEntityDAO extends HibernateDao<ManagerAuthEntity, Long> {

    /**
     * 根据managerId查询相应的权限。
     */
    public List<ManagerAuthEntity> getByManagerid(Long managerid) {
	StringBuilder hql = new StringBuilder("from ManagerAuthEntity me  where ( me.status is null or me.status =" + Status.ACTIVE.value() + ") and  me.managerid=?");
	return this.find(hql.toString(), managerid);
    }

    /**
     * 根据managerid物理删除
     */
    public void deleteByManagerid(Long... managerids) {
	StringBuilder strIds = new StringBuilder();
	for (int i = 0; i < managerids.length - 1; i++) {
	    strIds.append(managerids[i]).append(",");
	}
	strIds.append(managerids[managerids.length - 1]);
	String hql = "delete from ManagerAuthEntity where managerid in (" + strIds.toString() + ")";
	Query query = this.createQuery(hql);
	query.executeUpdate();
    }

    /**
     * 根据authid物理删除
     */
    public void deleteByAuthid(Long... authids) {
	StringBuilder strIds = new StringBuilder();
	for (int i = 0; i < authids.length - 1; i++) {
	    strIds.append(authids[i]).append(",");
	}
	strIds.append(authids[authids.length - 1]);
	String hql = "delete from ManagerAuthEntity where authid in (" + strIds.toString() + ")";
	Query query = this.createQuery(hql);
	query.executeUpdate();
    }

    /**
     * 根据账号查找出它所具备的权限
     */
    public List<ManagerAuthEntity> getByAccount(String account) {

	StringBuilder hql = new StringBuilder("select me from ManagerAuthEntity me,ManagerEntity manager   where ( me.status is null or me.status =" + Status.ACTIVE.value()
		+ ") and me.managerid = manager.id");
	if (!WebUtils.isEmpty(account)) {
	    hql.append(" and manager.account = '" + account + "'");
	}
	hql.append(" order by me.createtime desc ");
	return this.find(hql.toString());
    }

    /**
     * 分页查询
     */
    public Page<ManagerAuthEntity> getByPage(int pageNo, int pageSize, String account, Date startTime, Date endTime) {
	Page<ManagerAuthEntity> page = new Page<ManagerAuthEntity>(pageSize);
	page.setPageNo(pageNo);
	StringBuilder hql = new StringBuilder("select me from ManagerAuthEntity me,ManagerEntity manager   where ( me.status is null or me.status =" + Status.ACTIVE.value()
		+ ") and me.managerid = manager.id");
	if (!WebUtils.isEmpty(account)) {
	    hql.append(" and manager.account like '%" + account + "%'");
	}

	DateFormat daf = new SimpleDateFormat("yyyy-MM-dd");
	String sTime = "";
	String eTime = "";
	if (!WebUtils.isEmpty(startTime)) {
	    sTime = daf.format(startTime).concat(" 00:00:00");
	    hql.append(" and me.createtime >='" + sTime + "'");
	}
	if (!WebUtils.isEmpty(endTime)) {
	    eTime = daf.format(endTime).concat(" 23:59:59");
	    hql.append(" and me.createtime <='" + eTime + "'");
	}
	hql.append(" group by me.managerid   order by me.createtime desc ");
	return this.find(page, hql.toString());
    }
}
