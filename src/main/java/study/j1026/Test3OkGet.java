package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test3OkGet")
public class Test3OkGet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); //응답처리에서도 한글 처리 해야한다. - servlet에서 응답
		//response.setCharacterEncoding("text/html; charset=utf-8"); //jsp에서 현재 자신의 위치에서 주는 명령어
		
		String name = request.getParameter("name");
		int age =  Integer.parseInt(request.getParameter("age"));
		String flag = request.getParameter("flag");
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("flag : " + flag);
		
		PrintWriter out = response.getWriter();
		
		out.println("<p>성명 : "+name+"</p>");
		out.println("<p>나이 : "+age+"</p>");
		out.println("<p>flag : "+flag+"</p>");
		//out.println("<p><a href='/javaProject/study/1026/test3.jsp'>돌아가기</a></p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/1026/test3.jsp'>돌아가기</a></p>");
		//out.println("<p><a href='"+request.getContextPath()+"/Test2'>돌아가기</a></p>"); //자기자신 폴더의 Test2번 찾아가라
	}

}
