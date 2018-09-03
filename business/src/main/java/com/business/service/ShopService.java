package com.business.service;

import java.util.List;

import com.base.orm.Page;
import com.business.entity.ShopEntity;

/**
 * 
 * @author chenghao
 *
 */
public interface ShopService {

    /**
     * 更新店铺
     */
    public void saveorUpdate(ShopEntity entity) throws Exception;

    /**
     * 删除店铺
     */
    public void deleteByIds(long... ids) throws Exception;

    /**
     * 分页查询
     */
    public Page<ShopEntity> getByPage(int pageNo, int pageSize, String name) throws Exception;

    /**
     * 根据id查询
     */
    public ShopEntity get(long id);

    /**
     * 更新店铺 状态
     */
    public void updateStatus(long id);

    /**
     * 查询所有店铺
     */
    public List<ShopEntity> getAll();
    


}
