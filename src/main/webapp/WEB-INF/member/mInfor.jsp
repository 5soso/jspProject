<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>mInfor.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>${vo.nickName} 회원님 상세 정보 보기</h2>
  <table class="tabel">
	  <tr><td>회원 아이디 : ${vo.mid}</td></tr>
	  <tr><td>회원 닉네임 : ${vo.nickName}</td></tr>
	  <tr><td>회원 이름 : ${vo.name}</td></tr>
	  <tr><td>회원 성별 : ${vo.gender}</td></tr>
	  <tr><td>회원 생년월일 : ${vo.birthday}</td></tr>
	  <tr><td>회원 전화번호 : ${vo.tel}</td></tr>
	  <tr><td>회원 주소 : ${vo.address}</td></tr>
	  <tr><td>회원 이메일 : ${vo.email}</td></tr>
	  <tr><td>회원 홈페이지 : ${vo.homePage}</td></tr>
	  <tr><td>회원 직업 : ${vo.job}</td></tr>
	  <tr><td>회원 취미 : ${vo.hobby}</td></tr>
	  <tr><td>회원 사진 : <img src="${ctp}/images/member/${vo.photo}" width="150px" /></td></tr>
	  <tr><td>회원 자기소개 : ${vo.content}</td></tr>
	  <tr><td>회원 정보공개 여부 : ${vo.userInfor}</td></tr>
	  <tr><td>회원 탈퇴신청 여부 : ${vo.userDel}</td></tr>
	  <tr><td>회원 포인트 : ${vo.point}</td></tr>
	  <tr><td>회원 레벨 : ${vo.level}</td></tr>
	  <tr><td>회원 총방문횟수 : ${vo.visitCnt}</td></tr>
	  <tr><td>회원 최초가입일 : ${vo.startDate}</td></tr>
	  <tr><td>회원 마지막 접속일 : ${vo.lastDate}</td></tr>
	  <tr><td>회원 오늘방문횟수 : ${vo.todayCnt}</td></tr>
  </table>
  <div><a href="javascript:history.back();" class="btn btn-warning">돌아가기</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>