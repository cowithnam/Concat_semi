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
	
	public Member updatePwd(String memId, String memPwd, String updatePwd) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, memId, memPwd, updatePwd);
		Member upPwd = null;
		if(result > 0) {
			commit(conn);
			
			// 갱신???�원객체 ?�시 조회?�오�?
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
