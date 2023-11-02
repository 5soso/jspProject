<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- mex_logout.jsp -->
<%
	String mid = (String) session.getAttribute("sMid");
	pageContext.setAttribute("mid", mid);
	
	session.invalidate(); //세션 모두 삭제
%>

<script>
	alert("${mid}님 로그아웃 되셨습니다.");
	
	location.href="mex_login.jsp";
</script>