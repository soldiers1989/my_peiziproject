/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.help;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;


import com.business.help.JAXBContextResolver;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.config.DefaultClientConfig;

/**
 *生成Client实例且为singleton
 * @author 
 */
@SuppressWarnings("rawtypes")
public class ClientFactoryBean implements FactoryBean {

    JAXBContextResolver resolver;

    @Override
    public Object getObject() throws Exception {
	DefaultClientConfig clientConfig = new DefaultClientConfig();
	// clientConfig.getClasses().add(JAXBContextResolver.class);
	clientConfig.getSingletons().add(resolver);
	return Client.create(clientConfig);
    }

    @Override
    public Class getObjectType() {
	return Client.class;
    }

    @Override
    public boolean isSingleton() {
	return true;
    }

    public JAXBContextResolver getResolver() {
	return resolver;
    }

    @Autowired
    public void setResolver(JAXBContextResolver resolver) {
	this.resolver = resolver;
    }
}
