package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		dao.setDeleteOk(mid);
		
		session.invalidate();
		
		request.setAttribute("msg", mid+"님 탈퇴되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/login.lo");
	}
}
