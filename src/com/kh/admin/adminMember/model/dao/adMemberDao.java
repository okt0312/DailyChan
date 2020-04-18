package com.kh.admin.adminMember.model.dao;

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

import com.kh.admin.adminMember.model.vo.adMember;
import com.kh.member.model.dao.MemberDao;



public class adMemberDao {
	
	private Properties prop = new Properties();
	
	public adMemberDao() {
		String filePath = MemberDao.class.getResource("/sql/adMember/adMember-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public adMember searchMember(Connection conn, String userId) {
		
		adMember m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new adMember(rset.getString("member_id"),
									    rset.getString("member_name"),
									    rset.getString("gender"),
										rset.getString("birth"),
										rset.getString("email"),
										rset.getString("phone"),
										rset.getDate("enroll_Date"),
										rset.getString("del_Member_Yn"),
										rset.getDate("del_date"),
										rset.getString("password"),
										rset.getDate("modify_Date"),
										rset.getString("blackList_Yn"),
										rset.getInt("point_Sum"),
										rset.getInt("reported_Num"),
										rset.getString("ref_Member_Id"));
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
		
		
		
	}

	public ArrayList<adMember> selectList(Connection conn) {
		
		ArrayList<adMember> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				
				list.add(new adMember(rset.getString("MEMBER_ID"),
						              rset.getString("MEMBER_NAME"),
						              rset.getString("EMAIL"),
						              rset.getString("PHONE"),
						              rset.getDate("ENROLL_DATE"),
						              rset.getString("DEL_MEMBER_YN"),
						              rset.getInt("POINT_SUM")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

}












