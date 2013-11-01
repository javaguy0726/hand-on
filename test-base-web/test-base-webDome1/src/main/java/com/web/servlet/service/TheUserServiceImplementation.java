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

	//�����C
	public boolean selectUserIdAndPassword(Object[] objects) {
		String sql = "select * from user where username=? and password = ?";
		Result result = userIntefaces.servletUserAll(sql, objects);
		if (result.getRowCount() == 1) {
			return true;
		}
		return false;
	}
	
	//����Ñ���
	public boolean addUserService(Object[] objects){
		String sql = "insert into user (username,password,sex,age,country,address) values(?,?,?,?,?,?)";
		return userIntefaces.insertUserResult(sql, objects);
	}
	
	//�]���У��Ñ���Ψһ��C��
	public boolean selectUsernameServlet(String userName){
		//��ԃ���е�username ����ŵ�list�����У���
		String sql = "select username from user";
		Result result = userIntefaces.servletUserALl(sql);
		list = userApiServlet.ResuleToList(result,"username");
			//��vlist ���ϱ��^username �Ƿ���ͬ
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).equals(userName)){
					return true;
				}
			}
			return false;
		}
		
	
	//��ԃ���е�country
	public List<String> selectAllCountry(){
		String sql = "select country from user";
		Result result = userIntefaces.servletUserALl(sql);
		return userApiServlet.ResuleToList(result,"country");
	}
	
	//����country ��ԃ ��ַ��
	public List<String> selectCountryToAddress(Object[] objects){
		String sql = "select address from user where country =?";
		Result result = userIntefaces.servletUserAll(sql, objects);
		return userApiServlet.ResuleToList(result, "address");
	}
	
}
