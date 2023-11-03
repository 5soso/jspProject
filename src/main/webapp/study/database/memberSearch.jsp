<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/include/memberCheck.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberSearch.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    if(${empty vo.mid}) {
    	alert("검색된 아이디가 없습니다.");
    	location.href = "${ctp}/study/database/memberMain.jsp";
    }
  </script>
  <style>
    th {
      background-color: #eee;
      text-align: center;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2>개별 회원 조회</h2>
  <table class="table table-bordered">
    <tr>
      <th>아이디</th>
      <td>${vo.mid}</td>
    </tr>
    <tr>
      <c:if test="${sMid == 'admin' || sMid == vo.mid}">
      	<th>비밀번호</th>
      	<td>${vo.pwd}</td>
      </c:if>
    </tr>
    <tr>
      <th>성명</th>
      <td>${vo.name}</td>
    </tr>
  	<c:if test="${sMid == 'admin' || sMid == vo.mid}">
    	<tr>
      	<th>포인트</th>
  			<td>${vo.point}</td>
   	 </tr>
    	<tr>
      	<th>최종방문일</th>
      	<td>${vo.lastDate}</td>
    	</tr>
    	<tr>
      	<th>방문횟수</th>
      	<td>${vo.todayCount}</td>
    	</tr>
    </c:if>
    <tr>
      <td colspan="2">
        <input type="button" value="돌아가기" onclick="location.href='${ctp}/study/database/memberMain.jsp';" class="btn btn-success" />
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>