package concat.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import concat.common.MyFileRenamePolicy;
import concat.image.model.vo.Image;
import concat.review.model.service.ReviewService;
import concat.review.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

int maxSize = 10*1024*1024;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String memNo = multiRequest.getParameter("memNo"); 
		String cellId = multiRequest.getParameter("cellId");
		int score = Integer.parseInt(multiRequest.getParameter("score"));
		String title = multiRequest.getParameter("title");
		String content = multiRequest.getParameter("content");
		
		Review r = new Review();
		r.setMemNo(memNo);
		r.setSellId(cellId);
		r.setScore(score);
		r.setReviewTitle(title);
		r.setReviewContent(content);
		
		Image image = null;
		
		if(multiRequest.getOriginalFileName("file") != null) {
			image = new Image();
			image.setOriginName(multiRequest.getOriginalFileName("file"));
			image.setUpdateName(multiRequest.getFilesystemName("file"));
			image.setFilePath("resources/board_upfiles");
		}
		
		
		
		int result = new ReviewService().insertReview(r, image);
				
		int result1 = new ReviewService().updateScore(r);
		if(result > 0 && result1 > 0) {
			
			response.sendRedirect(request.getContextPath() + "/list.re?cpage=1");
			
		}else {
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
