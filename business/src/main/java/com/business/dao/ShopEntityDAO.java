package com.business.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;


import com.base.orm.Page;
import com.base.orm.hibernate.HibernateDao;
import com.base.util.WebUtils;
import com.business.entity.ShopEntity;
import com.business.enums.Status;

@Repository
@SuppressWarnings("unchecked")
public class ShopEntityDAO extends HibernateDao<ShopEntity, Long> {
    
    /**
     * 分页查询
     */
    public Page<ShopEntity> getByPage(int pageNo, int pageSize, String name) {
	Page<ShopEntity> page = new Page<ShopEntity>(pageSize);
	page.setPageNo(pageNo);
	StringBuilder hql = new StringBuilder("from ShopEntity where status ="  + Status.ACTIVE.value());
	if (!WebUtils.isEmpty(name)) {
	    hql.append(" and name like '%" + name + "%' ");
	}
	hql.append("  order by createtime desc");
	return this.find(page, hql.toString());
    }

    /**
     * 
     * @Description: 更新  status  状态  
     * @author cheng.hao
     * @param id
     */
    public void updateStatus(long id) {
	String sql = "update ShopEntity  set status =1 where  id = " + id;
	Query query = this.createQuery(sql);
	query.executeUpdate();
    }

    public List<ShopEntity> getAll() {
	String sql = "from ShopEntity  where status =1   order by createtime asc";
	return this.find(sql);
    }

    public ShopEntity getShopByDeviceAndType(Long deviceid, String type) {
	String hql = "select a from ShopEntity a,ShopAdaptorEntity b, DeviceAdaptorEntity c ";
	hql += " where a.id=b.shopid and b.deviceId=c.id ";
	hql += " and a.status=b.status and a.status=c.status ";
	hql += " and c.deviceId=:deviceid  and shop.type=:type and a.status=:status";
	hql += " group by a.id ";
	hql += " order by a.createtime asc";
	List<ShopEntity> list = this.createQuery(hql).setLong("deviceid", deviceid).setString("type", type).setInteger("status", Status.ACTIVE.value()).list();
	if (list != null && !list.isEmpty()) {
	    return list.get(0);
	}
	return null;
    }

    public void updateTime(long id, Date date) {
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String uptime = format.format(date);
	String sql = "update ShopEntity  set versioncode= versioncode+1,operatetime ='" + uptime + "' where  id = " + id;
	Query query = this.createQuery(sql);
	query.executeUpdate();
    }



}
