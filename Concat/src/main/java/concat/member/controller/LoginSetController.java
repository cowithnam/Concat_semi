package concat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
			
			
			if(loginMember == null) {
				//request.getSession().setAttribute("alertMsg", "없는 아이디입니다.");
				//response.sendRedirect(request.getContextPath() + "/login.me");
				 response.setContentType("text/html; charset=utf-8");

					PrintWriter out = response.getWriter();

					out.println("<script>");

					out.println("alert('아이디 또는 비밀번호를 잘못 입력했습니다.\r\n"
							+ "입력하신 내용을 다시 확인해주세요.');");

					out.println("history.back();");

					out.println("</script>");
				
			}else {
				request.getSession().setAttribute("loginMember", loginMember);
				
				response.setContentType("text/html; charset=utf-8");

				PrintWriter out = response.getWriter();

				out.println("<script>");

				out.println("alert('로그인이 완료되었습니다.^_^');");
				
				response.sendRedirect(request.getContextPath());

				out.println("</script>");
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
