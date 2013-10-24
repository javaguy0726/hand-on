package com.web.servlet.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TheUserServlet
 */
public class TheUserServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			TheUserServiceImplementation userServiceImplementation = new TheUserServiceImplementation();
			String id = request.getParameter("id");
			String passWord = request.getParameter("passWord");
			Object[] objects = {id,passWord};
			boolean mark = userServiceImplementation.selectUserIdAndPassword(objects);
			//TODO  System.out.println(mark);
			if(mark){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/userPage.jsp"); 
			dispatcher .forward(request, response);
			}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp"); 
			dispatcher .forward(request, response);
			}
		}
	}

