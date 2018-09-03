package com.base.orm.hibernate;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2009-5-10
 * Time: 9:53:03
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.base.orm.Page;
import com.base.orm.PropertyFilter;


/**
 * 领域对象业务管理类基类.
 *
 * @author calvin
 * @param <T> 领域对象类型
 * @param <PK> 领域对象的主键类型
 * <p/>
 * eg.
 * public class UserManager extends EntityManager<User, Long>{
 * }
 */
public abstract class EntityManager<T, PK extends Serializable> {


    protected Logger logger = LoggerFactory.getLogger(getClass());

    protected abstract HibernateDao<T, PK> getEntityDao();

    // CRUD函数 //

    @Transactional(readOnly = true)
    public T get(final PK id) {
        return getEntityDao().get(id);
    }

    @Transactional(readOnly = true)
    public Page<T> getAll(final Page<T> page) {
        return getEntityDao().getAll(page);
    }

    @Transactional(readOnly = true)
    public List<T> getAll() {
        return getEntityDao().getAll();
    }

    @Transactional(readOnly = true)
    public Page<T> search(final Page<T> page, final List<PropertyFilter> filters) {
        return getEntityDao().find(page, filters);
    }
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public void save(final T entity) {
        getEntityDao().save(entity);
    }
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public void delete(final PK id) {
        getEntityDao().delete(id);
    }
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public List<T> findBy(final String hSql, final Object... values) {
        return getEntityDao().find(hSql, values);
    }
    /*
    * 查询记录行数
    * */
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public int countByHsql(final String hsql, final Object... values) {
        return getEntityDao().countByHsql(hsql, values);
    }

}
