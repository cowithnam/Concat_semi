package concat.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static concat.common.JDBCTemplate.*;

import concat.notice.model.dao.NoticeDao;
import concat.qna.model.dao.QnaDao;
import concat.qna.model.vo.Qna;
import concat.qna.model.vo.QnaInfo;

public class QnaService {
	public int insertQna(Qna q) {
		Connection conn = getConnection();

		int result = new QnaDao().insertQna(conn, q);

		System.out.println(result);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
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
	public int answerQna(Qna q) {
		Connection conn = getConnection();

		int result = new QnaDao().answerQna(conn, q);

		System.out.println(result);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
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
}
