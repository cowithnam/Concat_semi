package concat.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class LoginSetController
 */
@WebServlet("/loginset.me")
public class LoginSetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String memId = request.getParameter("memId");
			String memPwd = request.getParameter("memPwd");
		
			Member loginMember = new MemberService().loginMember(memId, memPwd);
			
			String message = "";
			
			if(loginMember == null) {
				//request.getSession().setAttribute("alertMsg", "없는 아이디입니다.");
				message = "<script>alret('없는 아이디입니다.회원가입이나 로그인을 다시해주세요.')</script>";
				response.sendRedirect(request.getContextPath() + "/login.me");
			}else {
				request.getSession().setAttribute("loginMember", loginMember);
				response.sendRedirect(request.getContextPath());
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
