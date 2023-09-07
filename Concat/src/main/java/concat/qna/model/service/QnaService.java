package concat.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;




import static concat.common.JDBCTemplate.*;

import concat.notice.model.dao.NoticeDao;
import concat.qna.model.dao.QnaDao;
import concat.qna.model.vo.Qna;
import concat.qna.model.vo.QnaInfo;
import concat.qna.model.vo.QnaReplay;

public class QnaService {
	public int insertQna(Qna q) {
		Connection conn = getConnection();

		int result = new QnaDao().insertQna(conn, q);

		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int insertReply(QnaReplay qr) {
		Connection conn = getConnection();

		int result = new QnaDao().insertReply(conn, qr);

		
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<QnaReplay> selectReplyList(int qnaNo){
		Connection conn = getConnection();
		ArrayList<QnaReplay> list = new QnaDao().selectReplyList(conn,qnaNo); 
		
		close(conn);
		return list;
	}
	
	public int qnaCount () {
		Connection conn = getConnection();
		int qnaCount = new QnaDao().qnaCount(conn);
		
		
		close(conn);
		return qnaCount;
	}
	
	public ArrayList<Qna> selectList(QnaInfo qi){
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().selectList(conn , qi);
		
		close(conn);
		return list;
	}

	public int increaseCount (int QnaNo) {
		Connection conn = getConnection();
		int result = new QnaDao().increaseCount(conn,QnaNo);
	
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
	}
	
	public Qna selectQnaDetail(int QnaNo) {
		Connection conn = getConnection();
		Qna q  = new QnaDao().selectQnaDetail(conn,QnaNo);
		
		close(conn);
		return q;
	}
	public Qna selectedQna(int qnaNo) {
		Connection conn = getConnection();
		Qna q  = new QnaDao().selectedQna(conn,qnaNo);
		
		close(conn);
		return q;
	}
	
	public int updateQna(Qna q) {
		Connection conn = getConnection();
		int result  = new QnaDao().updateQna(conn,q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public int deleteqna(Qna q) {
		Connection conn= getConnection();
		int result  = new QnaDao().deleteqna(conn,q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		return result;
	}
	
	public ArrayList<Qna> selectMyList(int memNo){
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDao().selectMyList(memNo,conn);
		
		close(conn);
		
		return list;
	}
}
