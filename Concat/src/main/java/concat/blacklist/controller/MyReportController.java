package concat.blacklist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.blacklist.model.service.BlackListService;
import concat.blacklist.model.vo.BlackList;
import concat.member.model.vo.Member;

/**
 * Servlet implementation class MyReportController
 */
@WebServlet("/myReport.bl")
public class MyReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReportController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = 0;
		if(request.getSession().getAttribute("loginMember") != null) {
			memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		}
		
		ArrayList<BlackList> list = new BlackListService().selectMyReport(memNo);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/blacklist/MyReport.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
