package concat.blacklist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.blacklist.model.service.BlackListService;
import concat.blacklist.model.vo.BlackList;
import concat.board.model.service.BoardService;
import concat.board.model.vo.Board;
import concat.image.model.vo.Image;

/**
 * Servlet implementation class BlackListUpdateFormController
 */
@WebServlet("/updateform.bl")
public class BlackListUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int blNo = Integer.parseInt(request.getParameter("blno")); 
		
		BlackListService bls = new BlackListService();
		
		BlackList bl = bls.selectBlackList(blNo);
		Image image = bls.selectImage(blNo);
		
		request.setAttribute("bl", bl);
		request.setAttribute("image", image);
		
		request.getRequestDispatcher("views/blacklist/blackListUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
