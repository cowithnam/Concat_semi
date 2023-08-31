package concat.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import concat.member.model.service.MemberService;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class AjaxIdController
 */
@WebServlet("/ajaxid.me")
public class AjaxIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memName = request.getParameter("memName");
		String phone = request.getParameter("phone");
		
		
		
		Member m = new Member();
		m.setMemName(memName);
		m.setPhone(phone);
		

		String id = new MemberService().findId(m); 
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(id, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
