<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) session.getAttribute("sMid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>t5_sessionTest.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>서블릿에서 세션값 처리</h2>
  <p><a href="<%=request.getContextPath() %>/j1031/T5_session?mid=admin" class="btn btn-success">세션처리</a></p>
  
  <p> 아이디 : <%=mid %> / ${sMid}<p>
</div>
<p><br/></p>
</body>
</html>