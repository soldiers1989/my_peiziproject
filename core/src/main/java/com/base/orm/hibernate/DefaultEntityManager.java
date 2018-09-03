package com.base.orm.hibernate;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2009-5-10
 * Time: 9:52:13
 * To change this template use File | Settings | File Templates.
 */
import java.io.Serializable;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.base.orm.ReflectionUtils;


/**
 * 含默认泛型DAO的EntityManager.
 *
 * @param <T> 领域对象类型
 * @param <PK> 领域对象的主键类型
 *
 * eg.
 * public class UserManager extends DefaultEntityManager<User, Long>{
 * }
 *
 *  * @author calvin
 */
public class DefaultEntityManager<T, PK extends Serializable> extends EntityManager<T, PK> {

	protected HibernateDao<T, PK> entityDao;//默认的泛型DAO成员变量.

	/**
	 * 通过注入的sessionFactory初始化默认的泛型DAO成员变量.
	 */
	@SuppressWarnings("unchecked")
	@Autowired
	public void setSessionFactory(final SessionFactory sessionFactory) {
		Class<T> entityClass = ReflectionUtils.getSuperClassGenricType(getClass());
		entityDao = new HibernateDao<T, PK>(sessionFactory, entityClass);
	}

	@Override
	protected HibernateDao<T, PK> getEntityDao() {
		return entityDao;
	}


}
