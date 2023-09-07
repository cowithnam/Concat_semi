package concat.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import concat.notice.model.service.NoticeService;
import concat.notice.model.vo.Notice;
import concat.notice.model.vo.PageInfo;

/**
 * Servlet implementation class NoticeListpage
 */
@WebServlet("/listpage.no")
public class NoticeListpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeCount;    
		int currentPage; 
		int pageLimit;  
		int boardLimit; 
		
	
		int maxPage;  
		int startPage;
		int endPage; 
		
		 
		
		
		
		noticeCount = new NoticeService().noticeCount();
		
		
		currentPage = Integer.parseInt(request.getParameter("cpage")); 
		
	
		pageLimit = 10;
		
		
		boardLimit = 10;
		
		
		
       
		maxPage = (int)Math.ceil((double)noticeCount / boardLimit);
		
		
		startPage = (currentPage -1) / pageLimit * pageLimit +1;
		
		
		endPage = startPage + pageLimit -1; 
		

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		
		
		PageInfo  pi = new PageInfo(noticeCount, currentPage , pageLimit , boardLimit , maxPage , startPage, endPage);
		
		
		ArrayList<Notice> list = new NoticeService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("views/notice/noticeListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
