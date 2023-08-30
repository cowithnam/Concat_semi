package concat.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import concat.common.vo.PageInfo;
import concat.image.model.vo.Image;
import concat.review.model.dao.ReviewDao;
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
	
	
	// 평점 추가
}
