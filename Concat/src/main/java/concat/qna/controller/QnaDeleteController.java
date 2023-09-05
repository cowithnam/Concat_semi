package concat.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import concat.notice.model.service.NoticeService;
import concat.notice.model.vo.Notice;
import concat.qna.model.service.QnaService;
import concat.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaDeleteController
 */
@WebServlet("/deleteqna.qa")
public class QnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("num")); 
		
		Qna  q = new Qna();
		
		q.setQnaNo(qnaNo);
		
		int result = new QnaService().deleteqna(q);
		
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 글 삭제가 완료되었습니다!");
			response.sendRedirect(request.getContextPath()+"/list.qa?qpage=1");
			return;
			
		}else {
			request.setAttribute("errorMsg", "글삭제에 실패 했습니다");
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
