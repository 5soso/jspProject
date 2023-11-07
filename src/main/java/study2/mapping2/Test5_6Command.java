package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5_6Command implements TestReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 각종 서비스 처리 작업 수행...
		
		// 작업완료후 메세지 처리... 
		//String msg = "이곳은 서비스 작업완료후 메세지를 담아서 보냅니다.";
		
		request.setAttribute("msg", "이곳은 서비스 작업완료후 메세지를 담아서 보냅니다.");
		request.setAttribute("url", request.getContextPath()+"/mapping2/test5.re"); //컨트롤러로 보냄
		
	}

}
