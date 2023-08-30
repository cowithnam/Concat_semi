package concat.review.model.dao;

import static concat.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import concat.blacklist.model.vo.BlackList;
import concat.common.vo.PageInfo;
import concat.image.model.vo.Image;
import concat.review.model.vo.Review;

public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Review> selectList(Connection conn, PageInfo pi){
		ArrayList<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
									rset.getString("mem_id"),
								    rset.getString("review_title"),
								    rset.getInt("count"),
								    rset.getDate("create_date"),
								    rset.getInt("score"),
								    rset.getString("titleimg")
								    ));
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertReview(Connection conn ,Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(r.getMemNo()));
			pstmt.setString(2, r.getSellId());
			pstmt.setString(3, r.getReviewTitle());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setInt(5, r.getScore());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertImage(Connection conn, Image image) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, image.getOriginName());
			pstmt.setString(2, image.getUpdateName());
			pstmt.setString(3, image.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int increaseCount(Connection conn, int rNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Review selectReview(Connection conn, int rNo){
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getInt("review_no"),
							   rset.getString("mem_id"),
							   rset.getString("review_title"),
							   rset.getString("review_content"),
							   rset.getInt("count"),
							   rset.getDate("create_date"),
							   rset.getInt("score"),
							   rset.getString("img_path1"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public Image selectImage(Connection conn, int rNo) {
		Image image = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				image = new Image();
				image.setFileNo(rset.getInt("file_no"));
				image.setOriginName(rset.getString("origin_name"));
				image.setUpdateName(rset.getString("update_name"));
				image.setFilePath(rset.getString("titleimg"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return image;
	}
	
}
