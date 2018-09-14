/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.help;

import javax.ws.rs.ext.ContextResolver;
import javax.ws.rs.ext.Provider;
import javax.xml.bind.JAXBContext;

import org.springframework.stereotype.Component;


import com.business.dto.model.AuthConfig;
import com.business.dto.model.Manager;
import com.business.dto.model.ManagerAuth;
import com.business.dto.model.PageDTO;
import com.business.dto.model.RestfulResult;
import com.business.dto.model.Shop;
import com.business.dto.model.SystemConfig;
import com.business.dto.model.TestModel;
import com.business.dto.model.UserDTO;
import com.business.dto.model.base.Request;
import com.business.dto.model.base.Response;
import com.business.dto.request.TestRequest;
import com.business.dto.response.TestResponse;
import com.sun.jersey.api.json.JSONConfiguration;
import com.sun.jersey.api.json.JSONJAXBContext;

/**
 * @author smith
 */
@Component
@Provider
public class JAXBContextResolver implements ContextResolver<JAXBContext> {

    private JAXBContext context;
    @SuppressWarnings("rawtypes")
    private Class[] types = { ManagerAuth.class, SystemConfig.class, PageDTO.class, AuthConfig.class, Manager.class, Shop.class,SystemConfig.class,RestfulResult.class ,TestModel.class,TestRequest.class,TestResponse.class,Request.class,Response.class,UserDTO.class};

    public JAXBContextResolver() throws Exception {
	this.context = new JSONJAXBContext(JSONConfiguration.natural().build(), types);
    }

    @SuppressWarnings("rawtypes")
    @Override
    public JAXBContext getContext(Class<?> objectType) {
	for (Class type : types) {
	    if (type == objectType) {
		return context;
	    }
	}
	return null;
    }
}
