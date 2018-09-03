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
import com.business.entity.UserRecordEntity;

@Repository
public class UserRecordEntityDAO extends HibernateDao<UserRecordEntity, Long> {

    /**
     * 根据realname、phone查询
     */
    public UserRecordEntity getByRealnameAndPhone(String realname, String phone) {
	StringBuilder hql = new StringBuilder("from UserRecordEntity where realname= ? and phone = ?");
	List<UserRecordEntity> entitys = this.find(hql.toString(), realname, phone);
	// 如果结果大于1个，只取1个
	if (entitys.size() > 0) {
	    UserRecordEntity entity = entitys.get(0);
	    return entity;
	} else {
	    return null;
	}
    }

    /**
     * 分页查询
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public Page<UserRecordEntity> getByPage(int pageNo, int pageSize, String realname,String phone,String accountbank, Date startTime, Date endTime) {
	String sTime = "";
	String eTime = "";
	DateFormat daf = new SimpleDateFormat("yyyy-MM-dd");
	StringBuffer sb = new StringBuffer("from UserRecordEntity where 1=1 ");

	if (!WebUtils.isEmpty(realname)) {
	    sb.append(" and realname like '%" + realname + "%'");
	}
	
	if (!WebUtils.isEmpty(phone)) {
	    sb.append(" and phone = '" + phone + "'");
	}
	
	if (!WebUtils.isEmpty(accountbank)) {
	    sb.append(" and accountbank like '%" + accountbank + "%'");
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
     * 根据ID删除
     */
    public void deleteByIds(Long... ids) {
	StringBuilder strIds = new StringBuilder();
	for (int i = 0; i < ids.length - 1; i++) {
	    strIds.append(ids[i]).append(",");
	}
	strIds.append(ids[ids.length - 1]);
	StringBuffer sb = new StringBuffer("delete from UserRecordEntity  ");

	sb.append(" where id in (" + strIds.toString() + ")");
	Query query = this.createQuery(sb.toString());
	query.executeUpdate();
    }
    
    /**
     * 根据条件查询
     */
    public List<UserRecordEntity> getByCondition(String realname,String phone,String accountbank, Date startTime, Date endTime) {
	String sTime = "";
	String eTime = "";
	DateFormat daf = new SimpleDateFormat("yyyy-MM-dd");
	StringBuffer sb = new StringBuffer("from UserRecordEntity where 1=1 ");

	if (!WebUtils.isEmpty(realname)) {
	    sb.append(" and realname like '%" + realname + "%'");
	}
	
	if (!WebUtils.isEmpty(phone)) {
	    sb.append(" and phone = '" + phone + "'");
	}
	
	if (!WebUtils.isEmpty(accountbank)) {
	    sb.append(" and accountbank like '%" + accountbank + "%'");
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
	
	return this.find(sb.toString());
    }

}
