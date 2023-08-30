package concat.blacklist.model.dao;

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

import static concat.common.JDBCTemplate.*;

public class BlackListDao {

	private Properties prop = new Properties();
	
	public BlackListDao() {
		try {
			prop.loadFromXML(new FileInputStream(BlackListDao.class.getResource("/db/sql/blacklist-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BlackList> selectBlacklistList(Connection conn){
		ArrayList<BlackList> list = new ArrayList<BlackList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlacklistList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BlackList(rset.getInt("bl_no"),
									   rset.getString("bl_title"),
									   rset.getString("bl_content"),
									   rset.getString("mem_id"),
									   rset.getString("black_id"),
									   rset.getInt("count"),
									   rset.getDate("bl_date")
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
	
	public int increaseCount(Connection conn, int blNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, blNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public BlackList selectBlackList(Connection conn, int blNo) {
		BlackList b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, blNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new BlackList(rset.getInt("bl_no"),
								  rset.getString("bl_title"),
								  rset.getString("bl_content"),
								  rset.getString("mem_id"),
								  rset.getString("black_id"),
								  rset.getInt("count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	public int insertBlacklist(Connection conn, BlackList bl) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBlacklist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bl.getBlTitle());
			pstmt.setString(2, bl.getBlContent());
			pstmt.setInt(3, Integer.parseInt(bl.getBlWriter()));
			pstmt.setString(4, bl.getBlackId());
			
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
	
	public Image selectImage(Connection conn, int blNo) {
		Image image = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectImage");
			
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, blNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				image = new Image();
				image.setFileNo(rset.getInt("file_no"));
				image.setOriginName(rset.getString("origin_name"));
				image.setUpdateName(rset.getString("update_name"));
				image.setFilePath(rset.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return image;
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
	
	public ArrayList<BlackList> selectList(Connection conn, PageInfo pi) {
		ArrayList<BlackList> list = new ArrayList<BlackList>();
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
				list.add(new BlackList(rset.getInt("bl_no"),
									   rset.getString("bl_title"),
									   rset.getString("mem_id"),
									   rset.getInt("count"),
									   rset.getDate("bl_date")
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
	
	public int deletelist(Connection conn, int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletelist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			System.out.println(num);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
