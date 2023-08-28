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
		int result = MemberDao.updateMember(m, conn); 
		
		Member up = null;
		
		if(result > 0) {
			commit(conn);
			
			Member up = MemberDao.selectMember(conn, m.getMemId());
		}else {
			rollback(conn);
		}
		close(conn);
		return up;
	}
	
}
