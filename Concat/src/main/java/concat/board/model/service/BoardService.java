package concat.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import concat.board.model.dao.BoardDao;
import concat.board.model.vo.Board;
import concat.brand.model.vo.Brand;
import concat.category.model.vo.Category;
import concat.image.model.vo.Image;
import concat.wish.model.vo.Wish;

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
	
	public Board selectBoard(int bno) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(bno, conn);
		
		close(conn);
		
		return b;
	}
	
	public Image selectImage(int bno) {
		Connection conn = getConnection();
		
		Image img = new BoardDao().selectImage(bno, conn);
		
		close(conn);
		
		return img;
	}
	
	public int increaseCount(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(bno,conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Wish selectWish(int bno,int mno) {
		Connection conn = getConnection();
		
		Wish wish = new BoardDao().selectWish(bno ,mno ,conn);
		
		close(conn);
		
		return wish;
	}

}
