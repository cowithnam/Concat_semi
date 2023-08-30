package concat.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import static concat.common.JDBCTemplate.*;

import concat.common.vo.PageInfo;
import concat.notice.model.dao.NoticeDao;
import concat.notice.model.vo.Notice;

public class NoticeService {
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
	}
	
	public ArrayList<Notice> selectNotice(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNotice(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn,noticeNo);
	
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
	}
	
	public Notice selectNoticeDetail(int noticeNo) {
		Connection conn = getConnection();
		Notice n  = new NoticeDao().selectNoticeDetail(conn,noticeNo);
	
		close(conn);
		return n;
	}
	
	public Notice selectedNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n  = new NoticeDao().selectedNotice(conn,noticeNo);
		
		close(conn);
		return n;
		
	}
	public int updateNotice(Notice n ) {
		Connection conn = getConnection();
		int result  = new NoticeDao().updateNotice(conn,n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	public int deleteNotice(Notice n) {
		Connection conn= getConnection();
		int result  = new NoticeDao().deleteNotice(conn,n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		return result;
	}
	public int noticeCount() {
		Connection conn = getConnection();
		int noticeCount = new NoticeDao().noticeCount(conn);
		
		
		close(conn);
		return noticeCount;
	}
	public ArrayList<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn , pi);
		
		close(conn);
		return list;
	}

}
