package concat.member.controller;

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
		String memPwd = request.getParameter("memPwd");
		String memName = request.getParameter("memName");
		String nickName = request.getParameter("niceName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		Member m = new Member(memId, memPwd, memName, nickName, phone, email);
		
		Member up = MemberService.updateMember(m);
		
		if(up != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", up);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			
			response.sendRedirect(request.getContextPath()+ "/myPage.me");
		}else {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/comon/errorPage.jsp");
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
