package com.web.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbhelp {
	private static String DRIVER = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://10.10.55.147:3306/test";
	private static String USERNAME = "testuser";
	private static String PASSWORD = "123";
	private static Connection conn = null;

	public static Connection getConnection() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return conn;
		}

	}
}
