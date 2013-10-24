package com.web.servlet.service;

import javax.servlet.jsp.jstl.sql.Result;

import com.web.servlet.intefaces.TheUserInterface;
import com.web.servlet.intefacesImpl.TheUserIntefacesImpl;

public class TheUserServiceImplementation {
	TheUserInterface userIntefaces = new TheUserIntefacesImpl();

	public boolean selectUserIdAndPassword(Object[] objects) {
		String sql = "select * from user where id=? and password = ?";
		Result result = userIntefaces.servletUserAll(sql, objects);
		if (result.getRowCount() == 1) {
			return true;
		}
		return false;
	}
}
