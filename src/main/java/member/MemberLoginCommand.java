package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		//String idSave = request.getParameter("idSave")==null ? "off" : "on";
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 확인하세요.");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 확인하세요.");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		//로그인 성공시 처리할 내용들....(1.세션저장, 2.쿠키저장, 3.방문횟수(총방문횟수, 오늘방문횟수), 4.포인트저장...
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid); 
		session.setAttribute("sNickName", vo.getNickName()); 
		session.setAttribute("sLevel", vo.getLevel()); 
		session.setAttribute("strLevel", strLevel); 
		
		
		
		// 빠진 부분 처리하기
		
		
		
		
		//처리완료후 메세지 출력후 회원 메인창으로 전송한다.
		request.setAttribute("msg", mid+"님 로그인 되었습니다");
		request.setAttribute("url", "memberMain.mem");
	}
}
