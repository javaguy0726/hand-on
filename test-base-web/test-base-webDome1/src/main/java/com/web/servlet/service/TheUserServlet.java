package com.web.servlet.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.servlet.common.BaseAction;

/**
 * Servlet implementation class TheUserServlet
 */
public class TheUserServlet extends HttpServlet {
	TheUserServiceImplementation userServiceImplementation = new TheUserServiceImplementation();
	List<String> list = new ArrayList<String>();
	BaseAction baseAction = new BaseAction();
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  PrintWriter pw = response.getWriter();
		String getUrl = request.getRequestURI();
		String url = getUrl.substring(getUrl.lastIndexOf("/"),
				getUrl.lastIndexOf("."));
		if (url.equals("/Login")) {
			String username = request.getParameter("userName");
			String passWord = request.getParameter("passWord");
			Object[] objects = { username, passWord };
			boolean mark = userServiceImplementation
					.selectUserIdAndPassword(objects);
			if (mark) {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("userPage/userPage.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/error.jsp");
				dispatcher.forward(request, response);
				}
		}else if(url.equals("/ValidationuserName")){
			String username = request.getParameter("username");
			boolean mark = userServiceImplementation.selectUsernameServlet(username);
		//	JSONObject jsonObject = new JSONObject();
			//把boolean類型裝換成String類型。 
			String a = mark+"";
			pw.print(a);
			pw.close();
			
			
		}else if(url.equals("/AddUser")){
			String userName = request.getParameter("userName");
			String passWord = request.getParameter("passWord");
			String sex = request.getParameter("user_gender1");
			int age = Integer.parseInt(request.getParameter("age"));
			String country = request.getParameter("country");
			String address = request.getParameter("address");
			Object[] objects = {userName,passWord,sex,age,country,address};
			if(userServiceImplementation.addUserService(objects)){
				RequestDispatcher dispatcher = request.getRequestDispatcher("userPage/userLogin.jsp");
				dispatcher.forward(request, response);
			}
		}else if(url.equals("/SelectCountry")){
			list = userServiceImplementation.selectAllCountry();
		//	baseAction.getSession().put("aaa", list);
			request.getSession().setAttribute("countryList", list);
			String name = "123";
			request.getSession().setAttribute("name", name);
		//	System.out.println(countryList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("userPage/addUserPage.jsp");
			dispatcher.forward(request, response);
		}
	}
}
