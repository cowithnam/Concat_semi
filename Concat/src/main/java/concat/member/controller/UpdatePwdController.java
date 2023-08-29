package concat.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		Member upPwd = new MemberService().updatePwd(memId, memPwd, updatePwd);
		
		String message = "";
		
		if(upPwd == null) { // 실패
			System.out.println("실패");
			//request.getSession().setAttribute("alertMsg", "비밀번호 변경에 실패");
		}else { // 성공
			request.getSession().setAttribute("loginMember", upPwd);
			//request.getSession().setAttribute("alertMsg", "성공적으로 비밀번호 변경됐습니다.");
			message = "<script>alret('비밀번호가 변경되었습니다. 로그아웃 후 확인해주시길 바랍니다.')</script>";
		}
		response.sendRedirect(request.getContextPath() + "/myPage.me");
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
