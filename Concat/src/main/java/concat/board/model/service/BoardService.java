package concat.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import concat.board.model.dao.BoardDao;
import concat.board.model.vo.Board;
import static concat.common.JDBCTemplate.*;

public class BoardService {
	public ArrayList<Board> selectBoardList(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn);
		
		close(conn);
		
		return list;
	}

}
