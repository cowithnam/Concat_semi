package concat.qna.model.dao;



import static concat.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;



import concat.notice.model.vo.Notice;
import concat.qna.model.vo.Qna;
import concat.qna.model.vo.QnaInfo;
import concat.qna.model.vo.QnaReplay;

public class QnaDao {
	private Properties prop = new Properties();
	
	public QnaDao() {
		try {
			prop.loadFromXML(new FileInputStream(QnaDao.class.getResource("/db/sql/qna-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertQna(Connection conn , Qna q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQna");

		try {
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setString(3, q.getQnaWriter());
			pstmt.setString(4, q.getQnaWriterNick());
			
			
			
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	public int insertReply(Connection conn , QnaReplay qr) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, qr.getContent());
			pstmt.setInt(2, qr.getRepQno());
			pstmt.setInt(3, Integer.parseInt(qr.getRepWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}return result;
		
	}
	
	public ArrayList<QnaReplay> selectReplyList(Connection conn, int qnaNo){
		ArrayList<QnaReplay> list = new ArrayList<QnaReplay>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new QnaReplay(rset.getInt("reply_no"),
									rset.getString("reply_content")
									,rset.getString("nickname")
									,rset.getString("create_date")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
	}
	
	public int qnaCount(Connection conn) {
		int qnaCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qnaCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				qnaCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return qnaCount;
	}
	
	public ArrayList<Qna> selectList(Connection conn , QnaInfo qi){
		ArrayList<Qna> list =  new ArrayList<Qna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("qnaselectList");
		
		int startRow = (qi.getCurrentPage() - 1)* qi.getBoardLimit() +1;
		
		int endRow= startRow + qi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			
			pstmt.setInt(2 , endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("qna_no"),
						rset.getString("qna_title"),
						rset.getDate("create_date"),
						rset.getString("qna_writer_nick")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
			
		}return list;
		
		
	} 
	
	public int increaseCount(Connection conn, int Qnano) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Qnano);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}

	public Qna selectQnaDetail(Connection conn, int QnaNo) {
		Qna q = new Qna();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaDetail");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, QnaNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				q = new Qna(rset.getInt("qna_no"), rset.getString("qna_title"),
						rset.getString("qna_content"), rset.getString("qna_writer"), rset.getString("qna_writer_nick"),
						rset.getDate("create_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	
	public Qna selectedQna(Connection conn , int qnaNo) {
		
		Qna q = new Qna();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectedQna");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				q = new Qna(rset.getInt("qna_no"), rset.getString("qna_title"),
						rset.getString("qna_content"), rset.getString("qna_writer"), rset.getString("qna_writer_nick"),
						rset.getDate("create_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	
	public int updateQna(Connection conn , Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateQna");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, q.getQnaNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int deleteqna(Connection conn, Qna q){
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteqna");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, q.getQnaNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
}
