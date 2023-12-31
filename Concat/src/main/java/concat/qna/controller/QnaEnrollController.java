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
import concat.notice.model.service.NoticeService;
import concat.qna.model.service.QnaService;
import concat.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaEnrollController
 */
@WebServlet("/enroll.qa")
public class QnaEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaEnrollController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String qnaTitle = request.getParameter("title");
		String qnaContent = request.getParameter("content");
		String nickname = request.getParameter("nickname");
		
		
		HttpSession session = request.getSession();
		int userNo =((Member)session.getAttribute("loginMember")).getMemNo();
		
		Qna q = new Qna();
		q.setQnaTitle(qnaTitle);
		q.setQnaContent(qnaContent);
		q.setQnaWriter(String.valueOf(userNo));
		q.setQnaWriterNick(nickname);
		
		
		int result = new QnaService().insertQna(q);
		
	
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 문의글이 등록되었습니다!");
			response.sendRedirect(request.getContextPath()+"/list.qa?qpage=1");
			return;
		}else {
			request.setAttribute("errorMsg", "문의글 등록에 실패 했습니다" );
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
