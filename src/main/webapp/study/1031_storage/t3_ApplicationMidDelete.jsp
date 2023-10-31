<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationMidDelete.jsp -->
<h2>어플리케이션 아이디 삭제하기</h2>
<%
	application.removeAttribute("aMid");
%>
<hr/>
<script>
	alert("아이디 어플리케이션이 저장되었습니다.");
	location.href = "t3_ApplicationMain.jsp";
</script>