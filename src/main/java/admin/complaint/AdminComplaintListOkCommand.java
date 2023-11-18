package admin.complaint;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class AdminComplaintListOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		AdminDAO dao = new AdminDAO();
		
		int res = dao.getBoardComplaintDelete(idx); //관리자 화면 게시글신고삭제..
		
		//실제 게시글 삭제 res2 해서... 실제 게시글 삭제하기 (% %) 이거로 
		
		if(res != 0) {
			request.setAttribute("msg", "선택한 게시글이 비공개처리 되었습니다.");
			request.setAttribute("url", "adminListComplaintList.ad");
		}
		else {
			request.setAttribute("msg", "비공개처리 실패 .");
			request.setAttribute("url", "adminListComplaintList.ad");
		}
	}
}
