package concat.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import concat.member.model.vo.Member;
import concat.qna.model.service.QnaService;
import concat.qna.model.vo.Qna;
import concat.qna.model.vo.QnaReplay;

/**
 * Servlet implementation class QnaAnswerController
 */
@WebServlet("/answer.qa")
public class QnaAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String replyContent = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("qno"));
		
		HttpSession session = request.getSession();
		int userNo =((Member)session.getAttribute("loginMember")).getMemNo();
		
		QnaReplay qr = new QnaReplay();
		qr.setContent(replyContent);
		qr.setRepQno(boardNo);
		qr.setRepWriter(String.valueOf(userNo));
		
		int result = new QnaService().insertReply(qr);
		
		response.getWriter().print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
