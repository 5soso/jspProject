<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationDelete.jsp -->
<jsp:include page="/include/bs4.jsp" />
<h2>전체 어플리케이션 변수명 확인하기</h2>
<div class="container">
<%
	Enumeration names =  application.getAttributeNames();
	
	while(names.hasMoreElements()) {
		String name = (String) names.nextElement();
		out.println("어플리케이션명 : " + name + "<br/>");
		
	}
%>
<hr/>
<p>
	<a href="t3_ApplicationMain.jsp" class="btn btn-info">돌아가기</a>
</p>
</div>