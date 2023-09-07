package concat.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import concat.image.model.vo.Image;
import concat.review.model.service.ReviewService;
import concat.review.model.vo.Review;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/listDetail.re")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("num")); 
		
		int result = new ReviewService().increaseCount(rNo);
		
		if(result > 0) {
			Review r = new ReviewService().selectReview(rNo);
			Image image = new ReviewService().selectImage(rNo);

			request.setAttribute("image", image);
			request.setAttribute("r", r);
			request.getRequestDispatcher("views/review/reviewDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "리뷰 조회에 실패했습니다");
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
