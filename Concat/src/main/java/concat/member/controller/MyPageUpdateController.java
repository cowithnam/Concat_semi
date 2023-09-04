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
			// 1-1. 전송용량 제한
			int maxSize = 10 * 1024 * 1024;

			// 1-2. 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles/");

			// 2. 전달된 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 3. db에 기록할 값 뽑기
			Member m = new Member();
			m.setMemId(multiRequest.getParameter("memId"));
			m.setMemName(multiRequest.getParameter("memName"));
			m.setNickname(multiRequest.getParameter("nickName"));
			m.setEmail(multiRequest.getParameter("email"));
			m.setPhone(multiRequest.getParameter("phone"));

			// Attachment에 여러번 insert할 데이터 뽑기

			int result = 0;

			if (result > 0) {
			                       
				response.setContentType("text/html; charset=utf-8");

				PrintWriter out = response.getWriter();

				out.println("<script>");

				out.println("alert('성공적으로 회원정보를 수정하였습니다.^_^');");

				out.println("history.back();");

				out.println("</script>");
				
			} else {
				System.out.println("실패다 이자식아");

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
