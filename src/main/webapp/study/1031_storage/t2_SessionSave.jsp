<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionSave.jsp -->
<%
	request.setCharacterEncoding("utf-8");

	// 세션 값 저장하기... session.setAttribute("세션변수", 값)
	String mid = request.getParameter("mid")==null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName")==null ? "손님" : request.getParameter("nickName");
	String name = request.getParameter("name")==null ? "방문자" : request.getParameter("name");
	
	System.out.println("mid : "+ mid);
	System.out.println("nickName : "+ nickName);
	System.out.println("name : "+ name);
	
	session.setAttribute("sMid", mid); //이렇게 쓰지 마셈. 앞에 변수명에 s(세션)붙이기.. 우리끼리의 약속
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sName", name);
%>
<script>
	alert("세션이 저장되었습니다.");
	location.href = "t2_SessionMain.jsp";
</script>