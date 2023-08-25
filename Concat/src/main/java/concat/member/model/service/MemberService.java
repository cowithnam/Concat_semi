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
	
}
