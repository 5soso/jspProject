package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberPwdSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getPwdSearch(mid, email);
		//System.out.println("vo : " + vo);
		
		if(vo.getPwd() != null) {
			//임시 비밀번호 만들기 (8자리)
			String str = "임시 비밀번호를 입력하세요 : <font color=blue><b>";
			UUID uid = UUID.randomUUID();
			String imsiPwd = uid.toString().substring(0,8);
			str += imsiPwd+"</b></font>";
			
			//임시비밀번호를 암호화해서 DB에 저장하기
			SecurityUtil security = new SecurityUtil();
			imsiPwd = security.encryptSHA256(imsiPwd);
			dao.setMemberPwdUpdate(imsiPwd,mid);
			
			// 사용자한테 임시비밀번호 발송
			response.getWriter().write(str);
		}
		else {
			response.getWriter().write("검색한 자료가 없습니다.");
		}
		
	}

}
