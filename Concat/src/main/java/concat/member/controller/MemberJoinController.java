package concat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class MemberJoinController
 */
@WebServlet("/memberjoin.me")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memName = request.getParameter("memName");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		//int totalScore = Integer.parseInt(request.getParameter("totalScore"));
		
		Member loginMember = new Member(memId, memPwd, memName, nickName, email, phone);
		
		
		int result = new MemberService().insertMember(loginMember);
		
		
		if(result > 0) { // 성공
			request.getSession().setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다."); 
			response.sendRedirect(request.getContextPath());
		}else { // 실패
			System.out.println("실패");
			//request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			//RequestDispatcher view = request.getRequestDispatcher("views/comon/errorPage.jsp");
			//view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
