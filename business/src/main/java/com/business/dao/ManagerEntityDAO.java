package com.business.dao;

/**
 * Created by IntelliJ IDEA.
 * User: leoo
 * Date: 11-1-14
 * Time: 下午7:40
 * To change this template use File | Settings | File Templates.
 */

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;


import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.ManagerEntity;
import com.business.enums.Status;

@Repository
public class ManagerEntityDAO extends HibernateDao<ManagerEntity, Long> {

    /**
     * 验证用户登录信息
     */
    public List<ManagerEntity> getByAccount(String account) {
	StringBuilder hql = new StringBuilder("from ManagerEntity where   (  status is null or  status =" + Status.ACTIVE.value() + ") and  account=?");
	return this.find(hql.toString(), account);
    }

    /**
     * 根据条件查询账号信息，用于页面显示
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public Page<ManagerEntity> getByPage(int pageNo, int pageSize, String account, Date startTime, Date endTime) {
	String sTime = "";
	String eTime = "";
	DateFormat daf = new SimpleDateFormat("yyyy-MM-dd");
	StringBuffer sb = new StringBuffer("from ManagerEntity where status=" + Status.ACTIVE.value());

	if (!WebUtils.isEmpty(account)) {
	    sb.append(" and account like '%" + account + "%'");
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
	Page page = new Page();
	page.setPageNo(pageNo);
	page.setPageSize(pageSize);
	return this.find(page, sb.toString());
    }

    /**
     * 根据ID删除ManagerEntity信息
     */
    public void deleteByIds(Long... ids) {
	StringBuilder strIds = new StringBuilder();
	for (int i = 0; i < ids.length - 1; i++) {
	    strIds.append(ids[i]).append(",");
	}
	strIds.append(ids[ids.length - 1]);
	StringBuffer sb = new StringBuffer("delete from ManagerEntity  ");

	sb.append(" where id in (" + strIds.toString() + ")");
	Query query = this.createQuery(sb.toString());
	query.executeUpdate();
    }

    /**
     * 判断旧密码是否正确
     */
    public List<ManagerEntity> getByAccountAndPassword(String accountname, String password) {
	String hql = " from ManagerEntity where account like ? and password = ? and status=" + Status.ACTIVE.value();
	return this.find(hql, accountname, password);
    }

    /**
     * 查询所有管理员
     */
    public List<ManagerEntity> getAll() {
	String hql = " from ManagerEntity where status=" + Status.ACTIVE.value();
	return this.find(hql);
    }
    
    /**
     * 根据账号名称模糊
     */
    public List<ManagerEntity> getByLikeAccount(String account) {
	String hql = " from ManagerEntity where account like ? and status=" + Status.ACTIVE.value();
	return this.find(hql, account);
    }
    
    /**
     * 查询已经赋权限的管理员
     */
    public Page<ManagerEntity> getByPageWithAuth(int pageNo, int pageSize, String account, Date startTime, Date endTime) {
	String sTime = "";
	String eTime = "";
	DateFormat daf = new SimpleDateFormat("yyyy-MM-dd");
	StringBuffer sb = new StringBuffer("select a from ManagerEntity a,ManagerAuthEntity b where a.id=b.managerid and a.status=b.status and a.status=" + Status.ACTIVE.value());
	Page<ManagerEntity> page = new Page<ManagerEntity>(pageSize);
	page.setPageNo(pageNo);
	page.setPageSize(pageSize);
	
	if (!WebUtils.isEmpty(account)) {
	    sb.append(" and a.account like '%" + account + "%'");
	}

	if (!WebUtils.isEmpty(startTime)) {
	    sTime = daf.format(startTime).concat(" 00:00:00");
	    sb.append(" and a.createtime >='" + sTime + "'");
	}
	if (!WebUtils.isEmpty(endTime)) {
	    eTime = daf.format(endTime).concat(" 23:59:59");
	    sb.append(" and a.createtime <='" + eTime + "'");
	}
	sb.append(" group by a.id order by a.createtime desc");
	return this.find(page, sb.toString());
    }

}
