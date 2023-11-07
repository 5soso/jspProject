package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.re")
public class TestReController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TestReInterface command = null; // 1.생성 안 하고 만들기만 함. 2.그상태에서 인터페이스 생성하기. 
		String viewPage = "/WEB-INF/study2/mapping2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/test5")) {
			viewPage += "/test5.jsp";
		}
		else if(com.equals("/test5_2")) {
			viewPage += "/test5_2.jsp";
		}
		else if(com.equals("/test5_3")) {
			viewPage += "/test5_3.jsp";
		}
		else if(com.equals("/test5_4")) {
			command = new Test5_4Command(); //생성하기 위해서 인터페이스 구현객체를 생성하였다. 다음 execute 메소드를 실행한다.
			command.execute(request, response); //넘어온 것을 그대로 구현객체로 던져버림.
			viewPage += "/test5.jsp"; //뷰로 보냄
		}
		else if(com.equals("/test5_5")) {
			command = new Test5_5Command(); 
			command.execute(request, response);
			viewPage += "/test5_5.jsp"; 
		}
		else if(com.equals("/test5_6")) {
			command = new Test5_6Command(); 
			command.execute(request, response);
			//viewPage += "/test5.jsp"; 
			viewPage = "/include/message.jsp"; //메세지(include에 넣어놨음)는 webapp 바로 밑에 있기 때문에 누적하면 안됨.
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
