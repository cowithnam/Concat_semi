package concat.member.model.service;

import java.sql.Connection;

import static concat.common.JDBCTemplate.*;

import concat.member.model.dao.MemberDao;
import concat.member.model.vo.Member;

public class MemberService {
	public Member loginMember(String memId, String memPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, memId, memPwd);
		
		close(conn);
		return m;
	}
	
	public int insertMember(Member loginMember) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(loginMember, conn);
		
	    if(result > 0) {
	    	commit(conn);
	    }else {
	    	rollback(conn);
	    }
	    
	    close(conn);
	    return result;
		
	}
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(m, conn); 
		
		Member up = null;
		
		if(result > 0) {
			commit(conn);
			
			up = new MemberDao().selectMember(conn, m.getMemId());

		}else {
			rollback(conn);
		}
		close(conn);
		return up;
	}
	
	public Member updatePwd(String memId, String memPwd, String updatePwd) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, memId, memPwd, updatePwd);
		Member upPwd = null;
		if(result > 0) {
			commit(conn);
			
			// 갱신된 회원객체 다시 조회해오기
			upPwd = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		close(conn);
		return upPwd;
	}
	
	public int deleteMember(String memPwd, String memId) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn ,memPwd , memId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
	

