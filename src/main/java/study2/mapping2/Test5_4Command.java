package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5_4Command implements TestReInterface {

	@Override
	//직렬화 하기 위해서 response request 매개변수로 담음. 나를 불렀던 곳으로 떠넘겨야함(throws). 앞으로 command객체는 이런 작업을 할 수 있기 때문에, 인터페이스로 정의된 execute 메소드를 사용한다.
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		String op = request.getParameter("op")==null ? "+" : request.getParameter("op");
		
		int res = 0;
		
		if(op.equals("+")) res = su1 + su2;
		else if(op.equals("-")) res = su1 - su2;
		else if(op.equals("*")) res = su1 * su2;
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		request.setAttribute("op", op);
		request.setAttribute("res", res);
	}
}
