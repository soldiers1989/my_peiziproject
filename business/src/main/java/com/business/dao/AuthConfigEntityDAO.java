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
import com.business.entity.AuthConfigEntity;
import com.business.enums.Status;

@Repository
public class AuthConfigEntityDAO extends HibernateDao<AuthConfigEntity, Long> {
    
    /**
     * 根据PID查询出导航菜单。
     */
    public List<AuthConfigEntity> getByPid(Long pid) {
	String hql = " from AuthConfigEntity where pid =  ? ";
	return this.find(hql, pid);
    }

    /**
     * 查询出所有的导航菜单。构造树结构
     */
    public List<AuthConfigEntity> getAll() {
	StringBuilder hql = new StringBuilder("from AuthConfigEntity me  where ( me.status is null or me.status =" + Status.ACTIVE.value() + ")");
	return this.find(hql.toString());
    }

    /**
     * 根据权限名称查询权限，用于页面显示
     */
    public Page<AuthConfigEntity> getByPage(int pageNo, int pageSize, String name, Date startTime, Date endTime) {
	String sTime = "";
	String eTime = "";
	DateFormat daf = new SimpleDateFormat("yyyy-MM-dd");
	StringBuffer sb = new StringBuffer("from AuthConfigEntity where status=" + Status.ACTIVE.value());
	Page<AuthConfigEntity> page = new Page<AuthConfigEntity>(pageSize);
	page.setPageNo(pageNo);
	page.setPageSize(pageSize);
	if (!WebUtils.isEmpty(name)) {
	    sb.append(" and name like '" + name + "'");
	}

	if (!WebUtils.isEmpty(startTime)) {
	    sTime = daf.format(startTime).concat(" 00:00:00");
	    sb.append(" and createtime >='" + sTime + "'");
	}
	if (!WebUtils.isEmpty(endTime)) {
	    eTime = daf.format(endTime).concat(" 23:59:59");
	    sb.append(" and createtime <='" + eTime + "'");
	}
	sb.append(" order by createtime desc");
	return this.find(page, sb.toString());
    }

    /**
     * 根据ID删除权限信息
     */
    public void delete(Long... ids) {
	StringBuilder strIds = new StringBuilder();
	for (int i = 0; i < ids.length - 1; i++) {
	    strIds.append(ids[i]).append(",");
	}
	strIds.append(ids[ids.length - 1]);
	StringBuffer sb = new StringBuffer("delete from AuthConfigEntity  ");

	sb.append(" where id in (" + strIds.toString() + ")");
	Query query = this.createQuery(sb.toString());
	query.executeUpdate();
    }

    /**
     * 验证权限名字是否重复
     */
    public List<AuthConfigEntity> getByName(String name) {
	StringBuilder hql = new StringBuilder("from AuthConfigEntity where   (  status is null or  status =" + Status.ACTIVE.value() + ") and  name=?");
	return this.find(hql.toString(), name);
    }

}
