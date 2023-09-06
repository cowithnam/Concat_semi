package concat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.member.model.service.MemberService;

/**
 * Servlet implementation class ExitController
 */
@WebServlet("/exit.me")
public class ExitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExitController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		int result = new MemberService().deleteMember(memPwd ,memId);
		if(result > 0) {
			request.getSession().removeAttribute("loginMember");
			request.getSession().setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			//session.setAttribute("alertMsg", "회원탈퇴 실패");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
