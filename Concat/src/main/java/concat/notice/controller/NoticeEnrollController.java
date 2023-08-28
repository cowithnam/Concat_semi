package concat.notice.controller;

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
import concat.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeEnrollController
 */
@WebServlet("/insert.no")
public class NoticeEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("views/notice/noticeEnrollForm.jsp").forward(request, response);;
		
		request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		HttpSession session = request.getSession();
		int userNo =((Member)session.getAttribute("loginMember")).getMemNo();
		
	
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeWriter(String.valueOf(userNo));
		
		int result = new NoticeService().insertNotice(n);
		
		System.out.println(result);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다!");
			response.sendRedirect(request.getContextPath()+"/listpage.no");
			return;
		}else {
			request.setAttribute("errorMsg", "공지사항 등록에 실패 했습니다" );
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
