package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j1026/Test9Ok")
public class Test9Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //받는 쪽
		response.setContentType("text/html; charset=utf-8");//화면출력
		
		//Front에서 넘어온 값을 변수에 담아준다.
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0:Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");		
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");		
		
		//기본적으로 다시 체크해야할 것들을 체크해준다. (잘못된 자료는 다시 돌려보낸다. 정상적인 자료는 DB에 저장시켜준다.
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			out.println("<script>");
			out.println("alert('입력자료가 잘못되었습니다. 확인후 다시 가입하세요.');");
			out.println("history.back();"); 
			out.println("</script>"); 
			//return;
		}
		
		else {
			//여기부터 DB에 저장시키고 있다.		
			System.out.println("이름 : " + name);
			System.out.println("나이 : " + age);
			System.out.println("gender : " + gender);
			System.out.println("job : " + job);
			String hobby = "";
			for(String h : hobbys) {
				System.out.println("h : " + h);
				hobby += h + "/";
			}
			hobby = hobby.substring(0,hobby.length()-1);
			System.out.println("hobby : " + hobby);
			
//			// DB 저장완료후 jsp로 이동처리 한다.
//			out.println("<script>");
//			out.println("alert('회원가입이 성공적으로 되었습니다.');");
//			out.println("location.href='"+request.getContextPath()+"/study/1026/test9.jsp';");
//			out.println("</script>");
			
//			response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag=ok"); // Front의 location.href 방식과 같은 방식이다.
			
			//한글인 경우는 인코딩문제로 브라우저에서 에러로 체크된다.
			name = URLEncoder.encode(name, "utf-8"); //브라우저에서 한글 허용 안 함. 그래서 이름을 유니코드형식으로 바꿔줘야한다. 
			response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag="+name); //name 님 회원가입되셨습니다.
			
		}
	}
}
