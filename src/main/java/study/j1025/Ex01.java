package study.j1025;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
			
		int sum=0;
		
		for(int i=1; i<=1000; i++) {
			if(i%2==0 || i%5==0)
				sum +=i;
		}
		
		System.out.println("1에서 1000까지 2 또는 5의 배수의 합은? "+sum+"입니다.");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("function hap() {");
		out.println("document.write('결과 : "+ sum +"')");
		out.println("document.write(\"<button onclick='location.reload()'> 다시하기 </button>\")");
//		out.println("alert('결과 : "+sum+"')");
		out.println("}");
	
		out.println("</script>");
		out.println("1025과제 - .java <br/>");
		out.println("1에서 1000까지 2또는 5의 배수의 합은?");
		out.println("<input type='button' value='출력' onclick='hap()' />");
		
	}
}
