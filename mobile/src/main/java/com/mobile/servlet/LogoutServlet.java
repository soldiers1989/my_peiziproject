package com.mobile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet {

    /**
    * 
    */
    private static final long serialVersionUID = 8127434830667719055L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	doPost(req, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.getSession().removeAttribute("account");
	request.getSession().removeAttribute("type");
	response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

}