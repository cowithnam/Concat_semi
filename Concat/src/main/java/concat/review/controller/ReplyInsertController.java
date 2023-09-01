package concat.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.member.model.vo.Member;
import concat.review.model.service.ReviewService;
import concat.review.model.vo.Reply;

/**
 * Servlet implementation class ReplyInsertController
 */
@WebServlet("/replyInsert.re")
public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("content");
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setRefBoardNo(rNo);
		r.setReplyWriter(String.valueOf(memNo));
		
		int result = new ReviewService().insertReply(r);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
