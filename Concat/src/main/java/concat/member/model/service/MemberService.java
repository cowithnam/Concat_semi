package concat.member.model.service;

import java.sql.Connection;

import static concat.common.JDBCTemplate.*;

import concat.image.model.vo.Image;
import concat.image.model.vo.Profile;
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
	
	public int updateMember(Member m, Profile profile ) {
		Connection conn = getConnection();
		int result1 = new MemberDao().updateMember(m, conn);
		int result2 = new MemberDao().updateImageM(conn , profile);
		
		Member up = null;
		
		if(result1 > 0) {
			commit(conn);
			
			up = new MemberDao().selectMember(conn, m.getMemId());

		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
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
	
	public int selectImg(Profile profile) {
		Connection conn = getConnection();
		int img = new MemberDao().selectImg(conn, profile);
		
		close(conn);
		
		return img;
		
	}
	
	public String findId(String memName,String phone) {
		Connection conn = getConnection();
		String memId = new MemberDao().findId(conn, memName, phone);
		
		close(conn);
		return memId;
	}
	
}
	

