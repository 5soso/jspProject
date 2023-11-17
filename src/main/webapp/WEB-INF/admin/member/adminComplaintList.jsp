<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>adminComplainList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>신고 게시물 리스트</h2>
  <table class="table table-hover">
  	<tr class="table-dark text text-dark">
  		<th>번호</th>
  		<th>신고게시판</th>
  		<th>게시글 번호</th>
  		<th>신고자 아이디</th>
  		<th>신고 사유</th>
  		<th>신고 날짜</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<tr>
  			<td>${vo.}</td>
  			<td>${vo.}</td>
  			<td>${vo.}</td>
  			<td>${vo.}</td>
  			<td>${vo.}</td>
  			<td>${vo.}</td>
  		</tr>
  	</c:forEach>
  </table>
</div>
<p><br/></p>
</body>
</html>