package admin.complaint;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ComplaintInputCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int partIdx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String cpMid = request.getParameter("cpMid")==null ? "" : request.getParameter("cpMid");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		
		// 신고사유 기타
		String complaintText = request.getParameter("complaintText")==null ? "" : request.getParameter("complaintText");
		
		// 신고사유 콤보박스
		String[] complaints = request.getParameterValues("complaint");
		String complaint = "";
		if(complaints != null) {
			for(String c : complaints) {
				complaint += c + "/";
			}
		}
		//System.out.println("complaint : " + complaint);
		
		// 신고사유 기타에 값이 있을 때 처리
		if(!complaintText.equals("")) {
			complaint += complaintText + "/";
		}
		complaint = complaint.substring(0,complaint.lastIndexOf("/"));
		
		AdminDAO dao = new AdminDAO();
		
		ComplaintVO vo = new ComplaintVO();
		
		vo.setPart(part); 					//신고항목 : 게시판(board)
		vo.setPartIdx(partIdx); 		//신고 게시글 고유번호
		vo.setCpMid(cpMid); 				// 신고자 아이디
		vo.setCpContent(complaint); // 신고 사유
		
		int res = dao.setBoardComplaint(vo);
		
		if(res != 0) {
			request.setAttribute("msg", "신고 등록되었습니다.");
			request.setAttribute("url", "boardContent.bo?idx="+partIdx);
		}
	}

	
}
