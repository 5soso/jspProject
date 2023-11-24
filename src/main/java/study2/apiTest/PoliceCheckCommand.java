package study2.apiTest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PoliceCheckCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = request.getParameter("year")==null ? 0 : Integer.parseInt(request.getParameter("year"));
		String police = request.getParameter("police")==null ? "" : request.getParameter("police");
		ApiDAO dao = new ApiDAO();
		
		ArrayList<CrimeVO> vos = dao.getPoliceCheck(police);
		
		CrimeVO analyzeVo = dao.getAnalyzePolice(police);
		//System.out.println("analyzeVo : " + analyzeVo);
		
		request.setAttribute("vos", vos);
		request.setAttribute("analyzeVo", analyzeVo);
		request.setAttribute("police", police);
		request.setAttribute("year", year);
	}

}
