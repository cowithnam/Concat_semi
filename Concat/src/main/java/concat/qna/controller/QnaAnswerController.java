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
		String qnaAnswer = request.getParameter("content");
		String qnaNo = request.getParameter("qnaNo");
		
		System.out.println(qnaNo);
		System.out.println(qnaAnswer);
		
		HttpSession session = request.getSession();
		int userNo =((Member)session.getAttribute("loginMember")).getMemNo();
	
		Qna q = new Qna();
		
		q.setQnaAnswer(qnaAnswer);
		q.setQnaNo(Integer.parseInt(qnaNo));
		
		int result = new QnaService().insertAnswerQna(q);
		System.out.println("마지막"+result);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 QNA답변이 등록되었습니다!");
			response.sendRedirect(request.getContextPath()+"/list.qa?qpage=1");
			return;
		}else {
			request.setAttribute("errorMsg", "QNA답변 등록에 실패 했습니다" );
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
