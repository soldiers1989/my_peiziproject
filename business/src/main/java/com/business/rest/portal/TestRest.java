package com.business.rest.portal;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.util.BusinessType;
import com.base.util.WebUtils;
import com.business.dto.model.TestModel;
import com.business.dto.model.base.ReturnInfo;
import com.business.dto.request.TestRequest;
import com.business.dto.response.TestResponse;
import com.business.help.RedisManager;

@Service
@Path("/appstore")
public class TestRest {

    @Autowired
    private RedisManager redisManager;
    
    /**
     * 测试
     */
    @POST
    @Path("/test")
    @Consumes({ MediaType.APPLICATION_JSON})
    @Produces({ MediaType.APPLICATION_JSON })
    public TestResponse test(TestRequest request) {
	TestResponse response = new TestResponse();
	response.setCallid("0");
	response.setServertime(WebUtils.formatDate2Str(new Date(),"yyyy-MM-dd HH:mm:ss"));
	response.setApiversion("1.0");
	response.setState(ReturnInfo.NORMAL.getCode());
	response.setNote(ReturnInfo.NORMAL.getMsg());
	List<TestModel> appstoreTestModels = new ArrayList<TestModel>();
	TestModel model1 = new TestModel();
	model1.setId(Long.valueOf("1"));
	model1.setName("zhaojinlong1");
	model1.setPasswod("xxx");
	model1.setAge(Integer.valueOf("20"));
	model1.setAddress("beijing");
	
	TestModel model2 = new TestModel();
	model2.setId(Long.valueOf("2"));
	model2.setName("zhaojinlong2");
	model2.setPasswod("xxx2");
	model2.setAge(Integer.valueOf("220"));
	model2.setAddress("beijing2");
	appstoreTestModels.add(model1);
	appstoreTestModels.add(model2);
	response.setAppstoreTestModels(appstoreTestModels);
	redisManager.set( BusinessType.APPSTORE.name() + "_test_key" , response);
	return response;
    }

   

}
