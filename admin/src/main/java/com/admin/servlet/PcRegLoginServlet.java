package com.admin.servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PcRegLoginServlet extends HttpServlet {

    /**
    * 
    */
    private static final long serialVersionUID = 3903883700668890114L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	doPost(req, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String account = URLDecoder.decode(request.getParameter("account"), "utf-8");
	request.getSession().setAttribute("account", account);
	response.sendRedirect(request.getContextPath() +"/index.jsp");
    }

}