package concat.blacklist.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import concat.blacklist.model.dao.BlackListDao;
import concat.blacklist.model.vo.BlackList;
import concat.common.vo.PageInfo;
import concat.image.model.vo.Image;

import static concat.common.JDBCTemplate.*;

public class BlackListService {
	
	public ArrayList<BlackList> selectBlacklistList(){
		Connection conn = getConnection();
		ArrayList<BlackList> list = new BlackListDao().selectBlacklistList(conn);
		
		close(conn);
		return list;
	}
	
	public int increaseCount(int blNo) {
		Connection conn = getConnection();
		int result = new BlackListDao().increaseCount(conn, blNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public BlackList selectBlackList(int blNo) {
		Connection conn = getConnection();
		BlackList b = new BlackListDao().selectBlackList(conn, blNo);
		
		close(conn);
		return b;
	}
	
	public int insertBlacklist(BlackList bl, Image image) {
		Connection conn = getConnection();
		
		int result1 = new BlackListDao().insertBlacklist(conn, bl);
		int result2 = 1;
		
		if(image != null) {
			result2 = new BlackListDao().insertImage(conn, image);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2; 
	}
	
	public Image selectImage(int blNo) {
		Connection conn = getConnection();
		Image image = new BlackListDao().selectImage(conn, blNo);
		
		close(conn);
		return image;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new BlackListDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<BlackList> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<BlackList> list = new BlackListDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public int deletelist(int num) {
		Connection conn = getConnection();
		int result = new BlackListDao().deletelist(conn, num);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateBoard(BlackList bl, Image i) {
		Connection conn = getConnection();
		
		int result1 = new BlackListDao().updateBlacklist(conn, bl);
		int result2 = 1;
		
		if(i != null) { 
			Image img = new BlackListDao().selectImage(conn, bl.getBlNo());
			
			if(img != null) {
				result2 = new BlackListDao().updateImage(conn, i);
			}else { 
				result2 = new BlackListDao().insertNewImage(conn, i);
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
	
	public ArrayList<BlackList> searchList(String key){
		Connection conn = getConnection();
		ArrayList<BlackList> list = new BlackListDao().searchList(conn, key);
		close(conn);
		return list;
	}
}
