package concat.member.model.service;

import java.sql.Connection;

import static concat.common.JDBCTemplate.*;

import concat.image.model.vo.Profile;
import concat.mem_grade.model.vo.MemGrade;
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
	
	public Member updateMember(Member m, Profile profile ) {
		Connection conn = getConnection();
		int result1 = new MemberDao().updateMember(m, conn);
		
		int result2 = 1;
		if(profile != null) {
			result2 = new MemberDao().updateProfile(conn , profile);
		}
		
		
		if(result2 == 0) {
			result2 = new MemberDao().insertProfile(conn,m.getMemNo() , profile);
		}
		
		Member up = null;
		
		if(result1 > 0 && result2> 0) {
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
	
	public Profile selectProfile(int memNo) {
		Connection conn = getConnection();
		
		Profile pro = new MemberDao().selectProfile(memNo, conn);
		
		close(conn);
		
		return pro;
	}
	
	public String findId(Member m) {
		Connection conn = getConnection();
		String id = new MemberDao().findId(conn, m);
		
		close(conn);
		return id;
	}
	
	public String findPwd(Member m) {
		Connection conn = getConnection();
		String pwd = new MemberDao().findPwd(conn, m);
		
		close(conn);
		return pwd;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(checkId, conn);
		
		close(conn);
		return count;
	}
	
	public MemGrade gradeimg(int memNo) {
		Connection conn = getConnection();
		MemGrade grade = new MemberDao().gradeimg(memNo, conn);
		
		close(conn);
		return grade;
	}
	
	public int nickCheck(String checkNick) {
		Connection conn = getConnection();
		
		int nick = new MemberDao().nickCheck(conn, checkNick);
		
		close(conn);
		return nick;
	}

	
}
	

