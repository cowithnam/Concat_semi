package concat.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import concat.board.model.vo.Board;
import concat.brand.model.vo.Brand;
import concat.category.model.vo.Category;
import concat.image.model.vo.Image;
import concat.wish.model.vo.Wish;

import static concat.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop =  new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectBoardList(Connection conn){
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBrand(rset.getString("brand_name"));
				b.setPrice(rset.getInt("price"));
				b.setThumbnail(rset.getString("thumbnail"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Category> selectCategory(Connection conn){
		ArrayList<Category> list = new ArrayList<Category>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("category_no"),
						              rset.getString("category_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Brand> selectBrand(Connection conn){
		ArrayList<Brand> list = new ArrayList<Brand>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrand");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 10);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Brand b = new Brand();
				b.setBrandNo(rset.getInt("brand_no"));
				b.setBrandName(rset.getString("brand_name"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Brand> newSelectBrand(int categoryNo,Connection conn){
		ArrayList<Brand> list = new ArrayList<Brand>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrand");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Brand b = new Brand();
				b.setBrandNo(rset.getInt("brand_no"));
				b.setBrandName(rset.getString("brand_name"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertBoard(Board b, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getMemNo()));
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setInt(3, Integer.parseInt(b.getCategoryNo()));
			pstmt.setInt(4, Integer.parseInt(b.getBrand()));
			pstmt.setInt(5, b.getPrice());
			pstmt.setDate(6, (b.getDueDate()));
			pstmt.setString(7, b.getOpenkakao());
			pstmt.setString(8, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertImage(Image ig, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ig.getOriginName());
			pstmt.setString(2, ig.getUpdateName());
			pstmt.setString(3, ig.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectBoard(int bno,Connection conn) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBrand(rset.getString("brand_name"));
				b.setPrice(Integer.parseInt(rset.getString("price")));
				b.setMemNo(rset.getString("mem_id"));
				b.setNickName(rset.getString("nickname"));
				b.setDueDate(rset.getDate("due_date"));
				b.setBoardContent(rset.getString("board_content"));
				b.setOpenkakao(rset.getString("open_kakao"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	public Image selectImage(int bno,Connection conn) {
		Image img = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image();
				img.setFileNo(rset.getInt("file_no"));
				img.setOriginName(rset.getString("origin_name"));
				img.setUpdateName(rset.getString("update_name"));
				img.setFilePath(rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;
	}
	
	public int increaseCount(int bno,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Wish selectWish(int bno, int mno, Connection conn) {
		Wish wish = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWish");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wish = new Wish();
				wish.setBoardNo(rset.getInt("board_no"));
				wish.setMemNo(rset.getInt("mem_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return wish;
	}
	
	public int deleteWish(Wish w, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, w.getMemNo());
			pstmt.setInt(2, w.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertWish(Wish w, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, w.getMemNo());
			pstmt.setInt(2, w.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Wish> selectWishList(int memNo,Connection conn){
		ArrayList<Wish> list = new ArrayList<Wish>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Wish w = new Wish();
				w.setBoardNo(rset.getInt("board_no"));
				w.setMemNo(rset.getInt("mem_no"));
				
				list.add(w);
			}
			
			for(Wish w:list) {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Board selectWishBoard(int bno,Connection conn) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBrand(rset.getString("brand_name"));
				b.setPrice(rset.getInt("price"));
				b.setThumbnail(rset.getString("thumbnail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
}
