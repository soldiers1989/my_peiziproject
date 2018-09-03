package com.business.dto.response;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.TestModel;
import com.business.dto.model.base.Response;


@SuppressWarnings("serial")
@XmlRootElement
public class TestResponse extends Response {

    List<TestModel> appstoreTestModels;

    public List<TestModel> getAppstoreTestModels() {
	return appstoreTestModels;
    }

    public void setAppstoreTestModels(List<TestModel> appstoreTestModels) {
	this.appstoreTestModels = appstoreTestModels;
    }

}
