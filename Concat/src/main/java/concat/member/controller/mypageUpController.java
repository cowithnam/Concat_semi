package concat.member.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import concat.board.model.vo.Board;
import concat.common.MemberRenamPolicy;
import concat.image.model.vo.Image;
import concat.image.model.vo.Profile;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		request.setCharacterEncoding("UTF-8");
//		
//		
//		String memId = request.getParameter("memId");
//		String memName = request.getParameter("memName");
//		String nickName = request.getParameter("nickName");
//		String email = request.getParameter("email");
//		String phone = request.getParameter("phone");
//		
//		Member m = new Member(memId, memName, nickName, email, phone);
//		
//		Member up = new MemberService().updateMember(m);
//		
//		
//		if(up != null) {
//			request.getSession().setAttribute("loginMember", up);
//			//request.getSession().setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
//			response.sendRedirect(request.getContextPath()+ "/myPage.me");
//			
//			 response.setContentType("text/html; charset=utf-8");
//
//				PrintWriter out = response.getWriter();
//
//				out.println("<script>");
//
//				out.println("alert('성공적으로 회원정보를 수정하였습니다.^_^');");
//
//				//out.println("history.back();");
//
//				out.println("</script>");
//		}else {
//			System.out.println("실패다 이자식아");
//		}
//		

		if (ServletFileUpload.isMultipartContent(request)) {
			// 1-1. 전송용량 제한
			int maxSize = 10 * 1024 * 1024;

			// 1-2. 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles/");

			// 2. 전달된 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MemberRenamPolicy());

			// 3. db에 기록할 값 뽑기
			Member m = new Member();
			m.setMemId(multiRequest.getParameter("memId"));
			m.setMemName(multiRequest.getParameter("memName"));
			m.setNickname(multiRequest.getParameter("nickName"));
			m.setEmail(multiRequest.getParameter("email"));
			m.setPhone(multiRequest.getParameter("phone"));

			// Attachment에 여러번 insert할 데이터 뽑기
			Profile profile = new Profile();

			if (multiRequest.getOriginalFileName("file") != null) {
				// 첨부파일이 존재할 경우
				Profile pro = new Profile();
				pro.setOriginName(multiRequest.getOriginalFileName("file"));
				pro.setUpdateName(multiRequest.getFilesystemName("file"));
				// 이게 오리지널 파일네임일시 원본파일명으로 들어가기에 엑박 // 파일시스템네임이여야 제대로된 사진으로 나옴
				pro.setFilePath("resources/member_upfiles");

			}

			int result = new MemberService().updateMember(m, profile);

			if (result > 0) {
				// 성공 => /jsp/list.th url 재요청
				// response.sendRedirect(request.getContextPath() + "/list.th");
				//int memNo = Integer.parseInt(request.getParameter("memNo"));
				//int img = new MemberService().selectImg(profile);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
