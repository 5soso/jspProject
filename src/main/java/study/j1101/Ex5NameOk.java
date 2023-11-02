package study.j1101;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspApplicationContext;
import javax.tools.DocumentationTool.Location;

@SuppressWarnings("serial")
@WebServlet("/j1101/Ex5NameOk")
public class Ex5NameOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		ArrayList<Jstl4VO> vos = new ArrayList<>();
		
		Jstl4VO vo = new Jstl4VO();
		
		vo = new Jstl4VO();
		vo.setName("홍길동");
		vo.setAge(25);
		vo.setGender("남자");
		vo.setJob("학생");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("김말숙");
		vo.setAge(22);
		vo.setGender("여자");
		vo.setJob("회사원");
		vo.setAddress("청주");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("이기자");
		vo.setAge(35);
		vo.setGender("남자");
		vo.setJob("공무원");
		vo.setAddress("제주도");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("오하늘");
		vo.setAge(19);
		vo.setGender("여자");
		vo.setJob("학생");
		vo.setAddress("청주");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("고인돌");
		vo.setAge(55);
		vo.setGender("남자");
		vo.setJob("자영업");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("고은별");
		vo.setAge(29);
		vo.setGender("여자");
		vo.setJob("연예인");
		vo.setAddress("부산");
		vos.add(vo);
		
		//검색한 이름과 vo에 담긴 이름이 같다면 출력하기.. 근데 vos에 담아야 하나??
		if(name.equals(vo.getName())) {
	
			request.setAttribute("vos", vos);
		
			String viewPage = "/study/1101_JSTL/ex5_jstlRes.jsp";
		
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		else {
			//jsp 메인 화면에서 alert로 검색과 일치하는 회원의 자료가 없습니다 띄우기..
		}
		
	}

}
