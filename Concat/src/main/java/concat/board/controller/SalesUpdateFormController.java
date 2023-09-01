package concat.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.blacklist.model.service.BlackListService;
import concat.blacklist.model.vo.BlackList;
import concat.board.model.service.BoardService;
import concat.board.model.vo.Board;
import concat.image.model.vo.Image;

/**
 * Servlet implementation class SalesUpdateFormController
 */
@WebServlet("/update.bo")
public class SalesUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bNo = Integer.parseInt(request.getParameter("bNo")); 
		
		BoardService bs = new BoardService();
		
		Board b = bs.selectBoard(bNo);
		Image i = bs.selectImage(bNo);
		
		request.setAttribute("b", b);
		request.setAttribute("i", i);
		
		request.getRequestDispatcher("views/Board/판매게시판수정화면.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
