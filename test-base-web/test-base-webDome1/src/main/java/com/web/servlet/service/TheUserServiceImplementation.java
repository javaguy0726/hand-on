package com.web.servlet.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import com.web.servlet.common.UserApiServlet;
import com.web.servlet.intefaces.TheUserInterface;
import com.web.servlet.intefacesImpl.TheUserIntefacesImpl;

public class TheUserServiceImplementation {
	TheUserInterface userIntefaces = new TheUserIntefacesImpl();
	List<String> list  = new ArrayList<String>();
	UserApiServlet userApiServlet = new UserApiServlet();

	//登錄驗證
	public boolean selectUserIdAndPassword(Object[] objects) {
		String sql = "select * from user where username=? and password = ?";
		Result result = userIntefaces.servletUserAll(sql, objects);
		if (result.getRowCount() == 1) {
			return true;
		}
		return false;
	}
	
	//添加用戶。
	public boolean addUserService(Object[] objects){
		String sql = "insert into user (username,password,sex,age,country,address) values(?,?,?,?,?,?)";
		return userIntefaces.insertUserResult(sql, objects);
	}
	
	//註冊中，用戶名唯一驗證；
	public boolean selectUsernameServlet(String userName){
		//查詢所有的username ，存放到list集合中，。
		String sql = "select username from user";
		Result result = userIntefaces.servletUserALl(sql);
		list = userApiServlet.ResuleToList(result,"username");
			//遍歷list 集合比較username 是否相同
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).equals(userName)){
					return true;
				}
			}
			return false;
		}
		
	
	//查詢所有的country
	public List<String> selectAllCountry(){
		String sql = "select country from user";
		Result result = userIntefaces.servletUserALl(sql);
		return userApiServlet.ResuleToList(result,"country");
	}
	
	//根據country 查詢 地址。
	public List<String> selectCountryToAddress(Object[] objects){
		String sql = "select address from user where country =?";
		Result result = userIntefaces.servletUserAll(sql, objects);
		return userApiServlet.ResuleToList(result, "address");
	}
	
}
