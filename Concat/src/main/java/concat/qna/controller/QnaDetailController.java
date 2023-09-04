package concat.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.notice.model.service.NoticeService;
import concat.notice.model.vo.Notice;
import concat.qna.model.service.QnaService;
import concat.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaDetailController
 */
@WebServlet("/detail.qa")
public class QnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int QnaNo = Integer.parseInt(request.getParameter("num"));
		
		
		int result = new QnaService().increaseCount(QnaNo);
			
		if(result > 0){
			Qna q  = new QnaService().selectQnaDetail(QnaNo);
			request.setAttribute("q", q);
			request.getRequestDispatcher("views/qna/qnaDetailView.jsp").forward(request, response);
			
		}else {
			
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
