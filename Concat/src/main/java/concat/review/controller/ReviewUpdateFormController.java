package concat.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.image.model.vo.Image;
import concat.review.model.service.ReviewService;
import concat.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateFormController
 */
@WebServlet("/updateForm.re")
public class ReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo")); 
		
		ReviewService rs = new ReviewService();
		
		Review r = rs.selectReview(rNo);
		Image image = rs.selectImage(rNo);
		
		request.setAttribute("r", r);
		request.setAttribute("image", image);
		
		request.getRequestDispatcher("views/review/reviewUpdateForm.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
