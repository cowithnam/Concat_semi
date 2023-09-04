package concat.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import concat.board.model.service.BoardService;
import concat.member.model.vo.Member;
import concat.wish.model.vo.Wish;

/**
 * Servlet implementation class DeleteWishList
 */
@WebServlet("/deleteWish")
public class DeleteWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arr = request.getParameterValues("arr");
		int result = 1;
		
		int mNo = 0;
		if(request.getSession().getAttribute("loginMember")!=null) {
			mNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		}
		
		for(int i=0; i<arr.length; i++) {
			Wish w = new Wish();
			w.setBoardNo(Integer.parseInt(arr[i]));
			w.setMemNo(mNo);
			result = result * new BoardService().deleteWish(w);
		}
		
		if(result > 0) {
			response.setContentType("apllication/json; UTF-8");
			new Gson().toJson("result",response.getWriter());
		}else {
			request.setAttribute("errorMsg", "위시리스트 삭제에 실패했습니다.");
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
