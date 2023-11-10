package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<String> vos = dao.getMemberIdSearch(email);
		
		String str = "";
		for(String m : vos) {
			str += m + "/";
		}
		if(vos.size() != 0) {
			str = str.substring(0, str.lastIndexOf("/"));
			response.getWriter().write(str);
		}
		else {
			response.getWriter().write("0");
		}
		
	}

}
