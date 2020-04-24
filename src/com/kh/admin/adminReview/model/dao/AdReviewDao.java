package com.kh.admin.adminReview.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.admin.adminReview.model.dao.AdReviewDao;
import com.kh.admin.adminReview.model.vo.AdReview;
import com.kh.member.model.dao.MemberDao;


public class AdReviewDao {
	
private Properties prop = new Properties();
	
	public AdReviewDao() {
		String filePath = MemberDao.class.getResource("/sql/adReview/adReview-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AdReview> selectList(Connection conn) {
		
		ArrayList<AdReview> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReview");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new AdReview(rset.getInt("REVIEW_BOARD_NO"),
									  rset.getDate("REVIEW_CREATE_DATE"),
									  rset.getString("ORDER_NO"),
									  rset.getString("MEMBER_ID"),
									  rset.getString("REVIEW_TITLE"),
									  rset.getString("REVIEW_CONTENT"),
									  rset.getString("REVIEW_ATTACHMENT_YN"),
									  rset.getString("REVIEW_RESPONSE_YN")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(stmt);
		}
		return list;
	}

}
