package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage = "/WEB-INF/board";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.getRequestDispatcher("/").forward(request, response);
		}
		else if(com.equals("/boardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "/boardList.jsp";
		}
		else if(com.equals("/boardInput")) {
			viewPage += "/boardInput.jsp";
		}
		else if(com.equals("/boardInputOk")) {
			command = new BoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
