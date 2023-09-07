package concat.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import concat.qna.model.service.QnaService;
import concat.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateController
 */
@WebServlet("/update.qa")
public class QnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int qnaNo = Integer.parseInt(request.getParameter("num")); 
		String qnaTitle = request.getParameter("title");
		String qnaContent = request.getParameter("content");
		
		Qna q = new Qna();
		
		q.setQnaNo(qnaNo);
		q.setQnaTitle(qnaTitle);
		q.setQnaContent(qnaContent);
		
		int result =  new QnaService().updateQna(q);
		
		if(result >0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","성공적으로 문의사항이 수정 되었습니다");
			response.sendRedirect(request.getContextPath() + "/detail.qa?num="+q.getQnaNo());
			
		}else {
			request.setAttribute("errorMsg", "문의사항 수정에 실패 했습니다");
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
