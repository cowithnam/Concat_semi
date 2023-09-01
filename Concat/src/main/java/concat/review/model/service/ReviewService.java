package concat.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import concat.common.vo.PageInfo;
import concat.image.model.vo.Image;
import concat.review.model.dao.ReviewDao;
import concat.review.model.vo.Reply;
import concat.review.model.vo.Review;

import static concat.common.JDBCTemplate.*;

public class ReviewService {

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Review> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public int insertReview(Review r, Image image){
		Connection conn = getConnection();
		int result1 = new ReviewDao().insertReview(conn, r);
		int result2 = 1;
		
		if(image != null) {
			result2 = new ReviewDao().insertImage(conn, image);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2; 
	}
	
	public int increaseCount(int rNo) {
		Connection conn = getConnection();
		int result = new ReviewDao().increaseCount(conn, rNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Review selectReview(int rNo){
		Connection conn = getConnection();
		Review r = new ReviewDao().selectReview(conn, rNo);
		close(conn);
		return r;
	}
	
	public Image selectImage(int rNo) {
		Connection conn = getConnection();
		Image image = new ReviewDao().selectImage(conn, rNo);
		close(conn);
		return image;
	}
	
	public int deletelist(int rNo) {
		Connection conn = getConnection();
		int result = new ReviewDao().deletelist(conn, rNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateReview(Review r, Image i) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().updateReview(conn, r);
		int result2 = 1;
		
		if(i != null) {
			
			if(i.getFileNo() != 0) { 
				result2 = new ReviewDao().updateImage(conn, i);
			}else { 
				result2 = new ReviewDao().insertNewImage(conn, i);
			}
		} 
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;  
	}
	
	// ÆòÁ¡ ++
	public int updateScore(Review r) {
		Connection conn = getConnection();
		int result = new ReviewDao().updateScore(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Review> countList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().countList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Review> scoreList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().scoreList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Reply> selectReplyList(int rNo){
		Connection conn = getConnection();
		ArrayList<Reply> list = new ReviewDao().selectReplyList(conn, rNo);
		close(conn);
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = new ReviewDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
