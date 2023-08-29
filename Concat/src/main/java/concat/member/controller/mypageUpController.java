package concat.member.controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class mypageUpController
 */
@WebServlet("/update.me")
public class mypageUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member m = new Member(memId, memName, nickName, email, phone);
		
		Member up = new MemberService().updateMember(m);
		
		String message = "";
		
		if(up != null) {
			request.getSession().setAttribute("loginMember", up);
			//request.getSession().setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			message = "<script>alret('회원정보를 수정하였습니다. 로그아웃후 시도해주시길바랍니다.')</script>";
			
			response.sendRedirect(request.getContextPath()+ "/myPage.me");
		}else {
			System.out.println("실패다 이자식아");
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
