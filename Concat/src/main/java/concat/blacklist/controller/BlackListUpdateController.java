package concat.blacklist.controller;

import java.io.IOException;
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
 * Servlet implementation class BlackListUpdateController
 */
@WebServlet("/update.bl")
public class BlackListUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListUpdateController() {
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
			
			int blNo = Integer.parseInt(multiRequest.getParameter("blNo"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String blackId = multiRequest.getParameter("blackId");
			
			BlackList bl = new BlackList();
			
			bl.setBlNo(blNo);
			bl.setBlTitle(title);
			bl.setBlackId(blackId);
			bl.setBlContent(content);
			
			Image image = null;
			
			if(multiRequest.getOriginalFileName("file") != null) {
				image = new Image();
				image.setOriginName(multiRequest.getOriginalFileName("file"));
				image.setUpdateName(multiRequest.getFilesystemName("file"));
				image.setFilePath("resources/board_upfiles");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					image.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo"))); 
				}else {
					image.setBoardNo(blNo);
				}
			}
			
			int result = new BlackListService().updateBoard(bl, image);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/DetailView.bl?num="+blNo);
			}else {
				
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
