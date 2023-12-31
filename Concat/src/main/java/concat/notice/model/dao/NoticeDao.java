package concat.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;




import static concat.common.JDBCTemplate.*;
import concat.notice.model.vo.Notice;
import concat.notice.model.vo.PageInfo;

public class NoticeDao {
	private Properties prop = new Properties();

	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int insertNotice(Connection conn, Notice n) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeWriter());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public ArrayList<Notice> selectNotice(Connection conn) {

		ArrayList<Notice> list = new ArrayList<Notice>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectNotice");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"), 
						rset.getString("notice_title"),
						rset.getDate("create_date"), 
						rset.getInt("count")));
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public int increaseCount(Connection conn, int noticeNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}

	public Notice selectNoticeDetail(Connection conn, int noticeNo) {

		Notice n = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeDetail");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, noticeNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				n = new Notice(rset.getInt("notice_no"), rset.getString("notice_title"),
						rset.getString("notice_content"), rset.getString("notice_writer"), rset.getInt("count"),
						rset.getDate("create_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return n;

	}

	public Notice selectedNotice(Connection conn, int noticeNo) {

		Notice n = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeDetail");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				n = new Notice(rset.getInt("notice_no"), rset.getString("notice_title"),
						rset.getString("notice_content"), rset.getString("notice_writer"), rset.getInt("count"),
						rset.getDate("create_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return n;

	}

	public int updateNotice(Connection conn, Notice n) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateNotice");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection conn, Notice n) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, n.getNoticeNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int noticeCount(Connection conn) {
		int noticeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				noticeCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return noticeCount;
		
		
	}
	
	public ArrayList<Notice> selectList(Connection conn , PageInfo pi){
		ArrayList<Notice> list =  new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() +1;
		
		int endRow= startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			
			pstmt.setInt(2 , endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
						rset.getString("notice_title"),
						rset.getDate("create_date"),
						rset.getInt("count")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
			
		}return list;
		
		
		
		
		
	}
}
