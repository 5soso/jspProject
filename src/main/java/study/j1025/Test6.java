package study.j1025;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test6")
public class Test6 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		//response.getWriter().append("Served at:(Test5) ").append(request.getContextPath());
		
		PrintWriter out = response.getWriter();
		out.println("이곳은 servlet에서 보냅니다. <br/>");
		out.println("<h3>Welcome to Servlet!!</h3>");
	}

}