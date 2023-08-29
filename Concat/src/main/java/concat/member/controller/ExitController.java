package concat.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		int result = new MemberService().deleteMember(memPwd ,memId);
		String message = "";
		if(result > 0) {
			request.getSession().removeAttribute("loginMember");
			//session.setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
			message = "<script>alret('성공적으로 회원탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.')</script>";
			
			response.sendRedirect(request.getContextPath());
		}else {
			System.out.println("실패");
			//session.setAttribute("alertMsg", "회원탈퇴 실패");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
