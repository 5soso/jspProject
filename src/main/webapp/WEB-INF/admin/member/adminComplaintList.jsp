<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>adminComplainList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use strict';
  	
  	// 게시글 비공개처리하기
		function complaintDelCheck(idx) {
			let ans = confirm("선택한 게시글을 비공개처리 하시겠습니까?");
			if(!ans) {
				location.reload();
				return false;
			}
			else location.href = "adminComplaintListOk.ad?idx="+idx;
		}  
  </script>
	<style>
		th{
			text-align: center;
		}
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 style="text-align: center">신고 게시물 리스트</h2>
  <hr/>
  <table class="table table-hover mt-2">
  	<tr class="table-dark text text-dark">
  		<th>번호</th>
  		<th>신고게시판</th>
  		<th>게시글 번호</th>
  		<th>신고자 아이디</th>
  		<th>신고사유</th>
  		<th>신고날짜</th>
  		<th></th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<tr style="text-align:center;">
  			<td>${vo.idx}</td>
  			<td>${vo.part}</td>
  			<td>${vo.partIdx}</td>
  			<td>${vo.cpMid}</td>
  			<td>${vo.cpContent}</td>
  			<td>${fn:substring(vo.cpDate, 0, 16)}</td>
  			<td><input type="button" name="complaintDelCheck" id="complaintDelCheck" value="비공개처리" onclick="complaintDelCheck(${vo.idx})" class="btn btn-sm btn-danger" /></td>
  		</tr>
  		<tr><td colspan="7" class="m-0 p-0"></td></tr>
  	</c:forEach>
  </table>
</div>

<!-- 블록페이지 시작(1블록의 크기를 3개(3Page)로 한다. 한페이지 기본은 5개 -->
<br/>
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="adminMemberList.ad?level=${level}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="adminMemberList.ad?level=${level}&pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="adminMemberList.ad?level=${level}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="adminMemberList.ad?level=${level}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
  	</c:forEach>
  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="adminMemberList.ad?level=${level}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="adminMemberList.ad?level=${level}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->
<p><br/></p>
</body>
</html>