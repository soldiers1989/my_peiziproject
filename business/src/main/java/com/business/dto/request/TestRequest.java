package com.business.dto.request;

import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.base.Request;


@SuppressWarnings("serial")
@XmlRootElement
public class TestRequest extends Request{
    
    private Integer start;
    
    private Integer count;

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
    
    

}
