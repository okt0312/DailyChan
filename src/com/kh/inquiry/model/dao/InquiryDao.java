package com.kh.inquiry.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.inquiry.model.vo.Inquiry;

public class InquiryDao {

	private Properties prop = new Properties();

	public InquiryDao() {

		String filePath = InquiryDao.class.getResource("/sql/inquiry/inquiry.properties").getPath();

		try {
			prop.load(new FileReader(filePath));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int insertInquiry(Connection conn, Inquiry i) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, i.getMemberId());
			pstmt.setString(2, i.getInquiryType());
			pstmt.setString(3, i.getInquiryTitle());
			pstmt.setString(4, i.getInquiryContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Inquiry selectInquiry(Connection conn, int ino) {

		Inquiry i = null;
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiry");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ino);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				i = new Inquiry();
				i.setInquiryType(rset.getString("INQUIRY_TYPE"));
				i.setInquiryContent(rset.getString("INQUIRY_CONTENT"));
				i.setInquiryCreateDate(rset.getDate("INQUIRY_CREATE_DATE"));
				i.setInquiryResponseYn(rset.getString("INQUIRY_RESPONSE_YN"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;

	}

	
	public ArrayList<Inquiry> selectInquiryList(Connection conn, String memberId) {

		ArrayList<Inquiry> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectInquiryList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Inquiry(rset.getString("INQUIRY_TYPE"),
									 rset.getString("INQUIRY_CONTENT"),
									 rset.getDate("INQUIRY_CREATE_DATE"),
									 rset.getString("INQUIRY_RESPONSE_YN")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
	

	
//	  public Inquiry selectInquiryList(Connection conn, String memberId) {
//	  
//	  Inquiry i = null;
//	  
//	  PreparedStatement pstmt = null; ResultSet rset = null;
//	  
//	  String sql = prop.getProperty("selectInquiryList");
//	  
//	  try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, memberId);
//	  
//	  rset = pstmt.executeQuery();
//	  
//	  if (rset.next()) { i = new Inquiry();
//	  i.setInquiryType(rset.getString("INQUIRY_TYPE"));
//	  i.setInquiryContent(rset.getString("INQUIRY_CONTENT"));
//	  i.setInquiryCreateDate(rset.getDate("INQUIRY_CREATE_DATE"));
//	  i.setInquiryResponseYn(rset.getString("INQUIRY_RESPONSE_YN"));
//	  
//	  }
//	  
//	  } catch (SQLException e) { e.printStackTrace(); }
//	  
//	  return i;
//	  
//	  }
	 
	
}
