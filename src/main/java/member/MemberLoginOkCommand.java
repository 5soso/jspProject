package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		System.out.println("mid : " + mid);
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(!vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		// 로그인 성공시 처리할 내용들.....(1.세션저장, 2.쿠키저장, 3.방문횟수(총방문횟수,오늘방문횟수), 4.포인트저장....
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		
		// 오늘 방문 횟수, 총 보유 포인트 처리...
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		//System.out.println("strToday : " + strToday);
			
		if(strToday.equals(vo.getLastDate().substring(0,10))) {
			//오늘 다시 방문한 경우
			vo.setTodayCnt(vo.getTodayCnt()+1);
			if(vo.getTodayCnt() <= 5) {
				vo.setPoint(vo.getPoint()+10);
			}
		}
		else {
			//오늘 처음 방문한 경우면
			vo.setTodayCnt(1);
			vo.setPoint(vo.getPoint()+10);
		}
		
		// 총 방문 횟수 처리..
		vo.setVisitCnt(vo.getVisitCnt()+1);
		
		// DB작업(변경된 내용들을 DB에 저장(갱신))
		dao.setLoginUpdate(vo);
		
		//System.out.println("vo.getVisitCnt : " + vo.getVisitCnt());
		//System.out.println("vo.getTodayCnt : " + vo.getTodayCnt());
		
		// 쿠키 저장
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		
		// 세션 저장
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);
		session.setAttribute("sVisitCnt", vo.getVisitCnt());
		session.setAttribute("sTodayCnt", vo.getTodayCnt());
		session.setAttribute("sPoint", vo.getPoint());
		
		// 처리 완료후 메세지 출력후 회원 메인창으로 전송한다.
		request.setAttribute("msg", mid+"님 로그인 되었습니다.");
		request.setAttribute("url", "memberMain.mem");
	}

}
