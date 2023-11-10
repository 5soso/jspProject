package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdminMemberListCheckCommand implements AdminMemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null ? 0 : Integer.parseInt(request.getParameter("level"));
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> vos = dao.getAdminMemberLevelSearch(level);
		System.out.println("vos"+vos);
		request.setAttribute("vos", vos);
	}

}
