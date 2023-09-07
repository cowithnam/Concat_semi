package concat.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.board.model.service.BoardService;
import concat.brand.model.vo.Brand;
import concat.category.model.vo.Category;

/**
 * Servlet implementation class NewInsertController
 */
@WebServlet("/insert.bo")
public class NewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Category> categoryList = new BoardService().selectCategory();
		ArrayList<Brand> brandList = new BoardService().selectBrand();
		
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("brandList", brandList);
		
		
		if(!categoryList.isEmpty()) {
			request.getRequestDispatcher("views/board/newInsert.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "상세정보 조회에 실패했습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
