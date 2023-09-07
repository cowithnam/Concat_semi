package concat.blacklist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import concat.blacklist.model.service.BlackListService;
import concat.blacklist.model.vo.BlackList;
import concat.common.MyFileRenamePolicy;
import concat.image.model.vo.Image;

/**
 * Servlet implementation class BlackListInsertController
 */
@WebServlet("/insert.bl")
public class BlackListInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userNo = multiRequest.getParameter("userNo");
			String title = multiRequest.getParameter("title");
			String blackId = multiRequest.getParameter("blackId");
			String content = multiRequest.getParameter("content");
			
			BlackList bl = new BlackList();
			
			bl.setBlWriter(userNo);
			bl.setBlTitle(title);
			bl.setBlackId(blackId);
			bl.setBlContent(content);
			
			Image image = null;
			
			if(multiRequest.getOriginalFileName("file") != null) {
				image = new Image();
				image.setOriginName(multiRequest.getOriginalFileName("file"));
				image.setUpdateName(multiRequest.getFilesystemName("file"));
				image.setFilePath("resources/board_upfiles");
			}
			
			int result = new BlackListService().insertBlacklist(bl, image);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/list.bl?cpage=1");
				
			}else {
				request.setAttribute("errorMsg", "블랙리스트 작성에 실패했습니다");
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
