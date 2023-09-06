package concat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
			// 1-1. ���ۿ뷮 ����
			int maxSize = 10 * 1024 * 1024;

			// 1-2. �����ų ������ �������� ���
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles/");

			// 2. ���޵� ���� ���ε�
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 3. db�� ����� �� �̱�
			Member m = new Member();
			m.setMemId(multiRequest.getParameter("memId"));
			m.setMemName(multiRequest.getParameter("memName"));
			m.setNickname(multiRequest.getParameter("nickName"));
			m.setEmail(multiRequest.getParameter("email"));
			m.setPhone(multiRequest.getParameter("phone"));
			m.setMemNo(Integer.parseInt(multiRequest.getParameter("memNo")));

			// Attachment�� ������ insert�� ������ �̱�
			
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
					System.out.println("���д� ���ڽľ�");
					
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