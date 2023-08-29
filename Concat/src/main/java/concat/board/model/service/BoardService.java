package concat.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import concat.board.model.dao.BoardDao;
import concat.board.model.vo.Board;
import concat.brand.model.vo.Brand;
import concat.category.model.vo.Category;
import concat.image.model.vo.Image;

import static concat.common.JDBCTemplate.*;

public class BoardService {
	public ArrayList<Board> selectBoardList(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Category> selectCategory() {
		Connection conn = getConnection();
		
		ArrayList<Category> list = new BoardDao().selectCategory(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Brand> selectBrand() {
		Connection conn = getConnection();
		
		ArrayList<Brand> list = new BoardDao().selectBrand(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Brand> newSelectBrand(int categoryNo){
		Connection conn = getConnection();
		
		ArrayList<Brand> list = new BoardDao().newSelectBrand(categoryNo,conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertBoard(Board b,Image ig) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(b, conn);
		int result2 = new BoardDao().insertImage(ig, conn);
		
		if(result1 > 0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	}

}
