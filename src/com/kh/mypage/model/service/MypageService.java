package com.kh.mypage.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.member.model.vo.Member;
import com.kh.mypage.model.dao.MypageDao;
public class MypageService
{
    /**
     * 1. 마이페이지 개인정보 및 회원탈퇴 시 비밀번호 확인
     * @author Taek
     * @param m     -> 회원 아이디, 비밀번호
     * @return      -> 조회한 결과 갯수
     */
    public int pwdCheck(Member m)
    {
        Connection conn = getConnection();
        int result = new MypageDao().pwdCheck(conn, m);
        close(conn);
        return result;
    }
    
    /**
     * 2. 회원 탈퇴
     * @author Taek
     * @param userId    --> 현재 접속중인 회원 아이디
     * @return          --> 회원상태 컬럼 변경 여부
     */
    public int deleteMember(String userId)
    {
        Connection conn = getConnection();
        
        int result = new MypageDao().deleteMember(conn, userId);
        
        if(result > 0)
        {
            commit(conn);
        }
        else
        {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    
    /**
     * 3. 회원정보 수정
     * @author Taek 
     * @param m     --> 회원이 입력한 데이터
     * @return      --> 회원 수정 결과 리턴
     */
    public int updateMember(Member m)
    {
        Connection conn = getConnection();
        
        int result = new MypageDao().updateMember(conn, m);
        
        if(result > 0)
        {
            commit(conn);
        }
        else
        {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
}
