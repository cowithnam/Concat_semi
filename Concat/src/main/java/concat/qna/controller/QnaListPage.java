package concat.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import concat.member.model.vo.Member;
import concat.notice.model.service.NoticeService;

import concat.qna.model.service.QnaService;
import concat.qna.model.vo.Qna;
import concat.qna.model.vo.QnaInfo;

/**
 * Servlet implementation class QnaListPage
 */
@WebServlet("/list.qa")
public class QnaListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListPage() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaCount;    
		int currentPage; 
		int pageLimit;  
		int boardLimit; 
	
		int maxPage;  
		int startPage;
		int endPage; 
		
		qnaCount = new QnaService().qnaCount();
		
		
		currentPage = Integer.parseInt(request.getParameter("qpage")); 
	
		pageLimit = 10;
		
		
		boardLimit = 10;
       
		maxPage = (int)Math.ceil((double)qnaCount / boardLimit);
		
		
		startPage = (currentPage -1) / pageLimit * pageLimit +1;
		
		
		endPage = startPage + pageLimit -1; 
		

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		QnaInfo qi = new QnaInfo(qnaCount, currentPage , pageLimit , boardLimit , maxPage , startPage, endPage);
		
		
		ArrayList<Qna> list = new QnaService().selectList(qi);
		
		request.setAttribute("qi", qi);
		request.setAttribute("list",list);
		;
		
		request.getRequestDispatcher("views/qna/qnaListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
