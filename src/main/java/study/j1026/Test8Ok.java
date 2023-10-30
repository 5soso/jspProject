package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j1026/Test8Ok")
public class Test8Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //받는 쪽
		response.setContentType("text/html; charset=utf-8");//화면출력
		
		/*
		String name = request.getParameter("name");
		if(name == null) name = "";
		
		String age = request.getParameter("age");
		int age;
		if(age == null || age.equals("")) age=0;
		else age = Integer.parseInt(request.getParameter("age"));
		*/
		
		//삼항연산자 처리해서 한줄로 끝내기
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0:Integer.parseInt(request.getParameter("age"));
		
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		
		//String hobby = request.getParameter("hobby")==null ? "" : request.getParameter("hobby");
		String[] hobbys = request.getParameterValues("hobby");		
		
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		
		//		if(age < 20) {
		//			PrintWriter out = response.getWriter();
		//			out.println("<script>");
		//			out.println("alert('미성년자는 가입하실 수 없습니다.');");
		//			out.println("history.back();");
		//			out.println("</script>");
		//		}
		
		
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			out.println("<script>");
			out.println("alert('입력자료가 잘못되었습니다. 확인후 다시 가입하세요.');");
			out.println("history.back();"); //history.back() : 브라우저 뒤로 가기 
			out.println("</script>");
			//return; //리턴 꼭 써주기!! 
		}
		
		else {
			//여기부터 DB에 저장시키고 있다.		
			System.out.println("이름 : " + name);
			System.out.println("나이 : " + age);
			System.out.println("gender : " + gender);
			String hobby = "";
			for(String h : hobbys) {
				System.out.println("h : " + h);
				hobby += h + "/";
			}
			hobby = hobby.substring(0,hobby.length()-1);
			System.out.println("hobby : " + hobby);
			System.out.println("job : " + job);
			
			// DB 저장완료후 jsp로 이동처리 한다.
			out.println("<script>");
			out.println("alert('회원가입이 성공적으로 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/1026/test8.jsp';"); //servlet은 java이기 때문에 jsp 표현식<%= %> 안 써도 된다.
			out.println("</script>");
		}
	}
}
