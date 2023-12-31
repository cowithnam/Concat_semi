package concat.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.board.model.service.BoardService;
import concat.board.model.vo.Board;

/**
 * Servlet implementation class SalesList
 */
@WebServlet("/shop.do")
public class SalesList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryNo = 0;
		categoryNo = Integer.parseInt(request.getParameter("cNo"));
		
		ArrayList<Board> list = new ArrayList<Board>();
		if(categoryNo == 0) {
			list = new BoardService().selectBoardList();
		}else {
			list = new BoardService().selectFromCategory(categoryNo);
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/salesList.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
