package concat.blacklist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.blacklist.model.service.BlackListService;

/**
 * Servlet implementation class BlackListDeleteController
 */
@WebServlet("/delete.bl")
public class BlackListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListDeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = new BlackListService().deletelist(num);
		
		if(result > 0) { // ����
			request.getSession().setAttribute("alertMsg", "���������� �������� ���� �Ǿ����ϴ�");
			
			response.sendRedirect(request.getContextPath() + "/list.bl?cpage=1");
			
		}else { // ����
			request.setAttribute("errorMsg", "�������� ������ �����߽��ϴ�.");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
