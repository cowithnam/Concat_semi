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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
	
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeWriter(String.valueOf(userNo));
		
		int result = new NoticeService().insertNotice(n);
		
	
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "���������� ���������� ��ϵǾ����ϴ�!");
			response.sendRedirect(request.getContextPath()+"/listpage.no?cpage=1");
			return;
		}else {
			request.setAttribute("errorMsg", "�������� ��Ͽ� ���� �߽��ϴ�" );
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
