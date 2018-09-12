package com.business.dao;

import org.springframework.stereotype.Repository;

import com.base.orm.hibernate.HibernateDao;
import com.business.entity.UserEntity;

@Repository
public class UserEntityDAO extends HibernateDao<UserEntity, Long> {


    
}
