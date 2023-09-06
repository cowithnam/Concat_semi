package concat.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import concat.board.model.service.BoardService;
import concat.board.model.vo.Board;
import concat.common.MyFileRenamePolicy;
import concat.image.model.vo.Image;

/**
 * Servlet implementation class SalesInsertController
 */
@WebServlet("/salesInsert.bo")
public class SalesInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savPath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
			MultipartRequest mr = new MultipartRequest(request, savPath, maxSize, "UTF-8",new MyFileRenamePolicy());
			
			Board b = new Board();
			b.setBoardTitle(mr.getParameter("title"));
			b.setMemNo(mr.getParameter("memNo"));
			b.setCategoryNo(mr.getParameter("category"));
			b.setBrand(mr.getParameter("brand"));
			b.setPrice(Integer.parseInt(mr.getParameter("price")));
			b.setDueDate(Date.valueOf(mr.getParameter("dueDate")));
			b.setOpenkakao(mr.getParameter("open"));
			b.setBoardContent(mr.getParameter("content"));
			
			Image ig = new Image();
			ig.setOriginName(mr.getOriginalFileName("file"));
			ig.setUpdateName(mr.getFilesystemName("file"));
			ig.setFilePath("resources/board_upfiles");
			
			int result = new BoardService().insertBoard(b,ig);
			
			ArrayList<Board> list = new BoardService().selectBoardList();
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "");
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/board/salesList.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
