package com.kh.admin.adminReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminReview.model.dao.AdReviewDao;
import com.kh.admin.adminReview.model.vo.AdReview;

import static com.kh.common.JDBCTemplate.*;

public class AdReviewService {

	/*
	 * 총 리뷰리스트 조회
	 */
	public ArrayList<AdReview> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<AdReview> list = new AdReviewDao().selectList(conn);
		close(conn);
		
		return list;
	}

}
