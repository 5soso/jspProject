<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function pageSizeCheck() {
    	let pageSize = $("#pageSize").val();
    	location.href = "boardList.bo?pageSize="+pageSize;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <table class="table table-borderless m-0 p-0">
    <tr>
  		<td colspan="2"><h2 class="text-center">게 시 판 리 스 트</h2></td>
    </tr>
    <tr>
      <td><c:if test="${sLevel != 1}"><a href="boardInput.bo" class="btn btn-success btn-sm">글쓰기</a></c:if></td>
      <td class="text-right">
        <select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
          <option>3</option>
          <option>5</option>
          <option>10</option>
          <option>15</option>
          <option>20</option>
        </select> 건
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>글번호</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>글쓴날짜</th>
      <th>조회수</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${vo.idx}</td>
        <td class="text-left">${vo.title}</td>
        <td>${vo.nickName}</td>
        <td>${fn:substring(vo.wDate,0,16)}</td>
        <td>${vo.readNum}</td>
      </tr>
      <tr><td colspan="5" class="m-0 p-0"></td></tr>
    </c:forEach>
  </table>
</div>
<!-- 페이징 처리 -->
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>