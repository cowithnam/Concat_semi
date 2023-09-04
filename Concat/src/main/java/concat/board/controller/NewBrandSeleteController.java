package concat.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;

import concat.board.model.service.BoardService;
import concat.brand.model.vo.Brand;

/**
 * Servlet implementation class NewBrandSeleteController
 */
@WebServlet("/newSelect.bo")
public class NewBrandSeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBrandSeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		
		ArrayList<Brand> newBrand = new BoardService().newSelectBrand(categoryNo);
		
		JSONArray jArr = new JSONArray();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(newBrand, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
