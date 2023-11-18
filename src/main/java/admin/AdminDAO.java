package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.complaint.ComplaintVO;
import common.GetConn;

public class AdminDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ComplaintVO vo = null;
	
	
	// pstmt 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	// rs 객체 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

	// 게시글신고 처리
	public int setBoardComplaint(ComplaintVO vo) {
		int res = 0;
		try {
			sql = "insert into complaint values (default,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getCpMid());
			pstmt.setString(4, vo.getCpContent());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} pstmtClose();
		return res;
	}

	// 게시글신고 출력
	public ArrayList<ComplaintVO> getBoardComplaintList() {
		ArrayList<ComplaintVO> vos = new ArrayList<>();
		try {
			sql = "select * from complaint order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ComplaintVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setCpMid(rs.getString("cpMid"));
				vo.setCpContent(rs.getString("cpContent"));
				vo.setCpDate(rs.getString("cpDate"));
				
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 게시글 신고 비공개처리(비공개로 하고싶은데 일단 삭제하기)
	public int getBoardComplaintDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from complaint where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} pstmtClose();
		return res;
	}
}
