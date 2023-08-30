package concat.blacklist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.blacklist.model.service.BlackListService;
import concat.blacklist.model.vo.BlackList;
import concat.image.model.vo.Image;

/**
 * Servlet implementation class BlackListDetailController
 */
@WebServlet("/DetailView.bl")
public class BlackListDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int blNo = Integer.parseInt(request.getParameter("num")); 
		
		int result = new BlackListService().increaseCount(blNo);
		
		if(result > 0) {
			BlackList b = new BlackListService().selectBlackList(blNo);
			Image image = new BlackListService().selectImage(blNo);
			
			request.setAttribute("image", image);
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/blacklist/blackListDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("alertMsg", "상세페이지 조회에 실패했습니다.");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
