/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.dto.model;

import java.util.Collections;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.RestfulResult;




/**
 *
 * @author gjh
 */
@XmlRootElement
public class PageDTO<T> {
    //分页参数

    private int pageNo = 1;
    private int pageSize = 20;
    //返回结果
    private List<T> result = Collections.emptyList();
    private int totalPages = -1;
    private RestfulResult restResult;

    // 构造函数
    public PageDTO() {
        super();
    }

    public PageDTO(int pageSize) {
        setPageSize(pageSize);
    }

    //查询参数函数
    /**
     * 获得当前页的页号,序号从1开始,默认为1.
     */
    public int getPageNo() {
        return pageNo;
    }

    /**
     * 设置当前页的页号,序号从1开始,低于1时自动调整为1.
     */
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;

        if (pageNo < 1) {
            this.pageNo = 1;
        }
    }

    /**
     * 获得每页的记录数量,默认为10.
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置每页的记录数量.
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    // 查询结果函数
    /**
     * 取得页内的记录列表.
     */
    public List<T> getResult() {
        return result;
    }

    public void setResult(final List<T> result) {
        this.result = result;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public RestfulResult getRestResult() {
        return restResult;
    }

    public void setRestResult(RestfulResult restResult) {
        this.restResult = restResult;
    }
}
