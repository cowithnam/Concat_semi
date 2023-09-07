package concat.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.board.model.service.BoardService;
import concat.board.model.vo.Board;
import concat.image.model.vo.Image;
import concat.member.model.vo.Member;
import concat.wish.model.vo.Wish;

/**
 * Servlet implementation class SalesDetailForm
 */
@WebServlet("/detail.bo")
public class SalesDetailForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesDetailForm() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int mno = 0;
		if(request.getSession().getAttribute("loginMember") != null) {
			mno = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		}
		
		int result = new BoardService().increaseCount(bno);
		
		if(result >0) {
			Board b = new BoardService().selectBoard(bno);
			Image img = new BoardService().selectImage(bno);
			Wish wish = new BoardService().selectWish(bno,mno);
			
			request.setAttribute("b", b);
			request.setAttribute("img", img);
			request.setAttribute("wish", wish);
			request.getRequestDispatcher("views/board/salesDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "상세정보 조회에 실패했습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
