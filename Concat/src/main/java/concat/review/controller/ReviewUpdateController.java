package concat.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import concat.common.MyFileRenamePolicy;
import concat.image.model.vo.Image;
import concat.review.model.service.ReviewService;
import concat.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/update.re")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int rNo = Integer.parseInt(multiRequest.getParameter("rNo"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String cellId = multiRequest.getParameter("cellId");
			int score = Integer.parseInt(multiRequest.getParameter("score"));
			
			Review r = new Review();
			
			r.setReviewNo(rNo);
			r.setReviewTitle(title);
			r.setReviewContent(content);
			r.setSellId(cellId);
			r.setScore(score);
			
			Image image = null;
			
			if(multiRequest.getOriginalFileName("file") != null) {
				image = new Image();
				image.setOriginName(multiRequest.getOriginalFileName("file"));
				image.setUpdateName(multiRequest.getFilesystemName("file"));
				image.setFilePath("resources/board_upfiles");
				image.setBoardNo(rNo);
				
				if(multiRequest.getParameter("originFileNo") != null) {
					image.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo"))); 
				}else {
					image.setBoardNo(rNo);
				}
			}
			
			int result = new ReviewService().updateReview(r, image);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/listDetail.re?num="+rNo);
				
			}else {
				request.setAttribute("errorMsg", "리뷰 수정에 실패했습니다");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
