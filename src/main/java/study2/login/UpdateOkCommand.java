package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");

		LoginDAO dao = new LoginDAO();
		
		//비밀번호 체크
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		if(vo.getMid()== null) {
			request.setAttribute("msg", "비밀번호 오류~~ 비밀번호를 확인하세요.");
			request.setAttribute("url", request.getContextPath()+"/update.lo");
		}
		else {
			vo = new LoginVO();
			vo.setMid(mid);
			vo.setName(name);
			
			dao.setUpdateOk(vo);
			
			HttpSession session = request.getSession();
			session.setAttribute("sName", name);
			
			request.setAttribute("msg", "수정 완료");
			request.setAttribute("url", request.getContextPath()+"/memberMain.lo");
			
		}
		
		
	}

}
