package concat.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.board.model.service.BoardService;
import concat.board.model.vo.Board;
import concat.image.model.vo.Image;

/**
 * Servlet implementation class SalesUpdate
 */
@WebServlet("/salesUpdate.bo")
public class SalesUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesUpdate() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		
		Board b = new  Board();
		b.setBoardNo(bno);
		b.setPrice(price);
		b.setBoardContent(content);
		
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+bno);
		}else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
