package concat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import concat.image.model.vo.Profile;
import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class MypageEnrollController
 */
@WebServlet("/myPage.me")
public class MypageEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("loginMember") == null) { 
			// session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			//response.sendRedirect(request.getContextPath());
			
			 response.setContentType("text/html; charset=utf-8");

				PrintWriter out = response.getWriter();

				out.println("<script>");

				out.println("alert('로그인 후 이용가능한 서비스입니다. ㅠ_ㅠ');");

				out.println("history.back();");

				out.println("</script>");
		}else { 
			Profile pro = new MemberService().selectProfile(((Member)session.getAttribute("loginMember")).getMemNo());
			
			request.setAttribute("pro", pro);
			RequestDispatcher view = request.getRequestDispatcher("views/member/mypage.jsp");
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
