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
import concat.member.model.vo.Member;
import concat.wish.model.vo.Wish;

/**
 * Servlet implementation class WishList
 */
@WebServlet("/wishList.bo")
public class WishList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = 0;
		if(request.getSession().getAttribute("loginMember") != null) {
			memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		}
		
		ArrayList<Board> list = new ArrayList<Board>();
		ArrayList<Wish> wList = new BoardService().selectWishList(memNo);
		for(Wish w : wList) {
			Board b = new BoardService().selectWishBoard(w.getBoardNo());
			
			list.add(b);
		}
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/board/wishList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
