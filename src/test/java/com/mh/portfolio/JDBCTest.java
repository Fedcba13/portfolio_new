package com.mh.portfolio;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import com.mh.portfolio.service.AppConfigManager;

public class JDBCTest {
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try {
			Connection conn = DriverManager.getConnection(
					AppConfigManager.getInstance().getConfig("database.url"),
					AppConfigManager.getInstance().getConfig("database.user"),
					AppConfigManager.getInstance().getConfig("database.password"));
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
