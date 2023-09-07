package concat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import concat.common.MyFileRenamePolicy;
import concat.image.model.vo.Profile;
import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class MyPageUpdateController
 */
@WebServlet("/update.me")
public class MyPageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			Member m = new Member();
			m.setEmail(multiRequest.getParameter("email"));
			m.setPhone(multiRequest.getParameter("phone"));
			m.setMemNo(Integer.parseInt(multiRequest.getParameter("memNo")));

			
			Profile profile = null;
			if(multiRequest.getOriginalFileName("file") !=null){
				profile = new Profile();
				profile.setOriginName(multiRequest.getOriginalFileName("file"));
				profile.setUpdateName(multiRequest.getFilesystemName("file"));
				profile.setFilePath("resources/member_upfiles");
				profile.setMemNo(m.getMemNo());
			}

				Member up = new MemberService().updateMember(m, profile);
				
				if (up != null) {
					
					request.getSession().setAttribute("loginMember", up);
					response.sendRedirect(request.getContextPath()+"/myPage.me");
					
				} else {
					request.setAttribute("errorMsg", "내정보 수정에 실패했습니다");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
				}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
