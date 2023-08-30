package concat.qna.model.service;

import java.sql.Connection;

import static concat.common.JDBCTemplate.*;

import concat.qna.model.dao.QnaDao;
import concat.qna.model.vo.Qna;

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

}
