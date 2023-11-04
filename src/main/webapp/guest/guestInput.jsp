<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>guestInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<h2 class="text-center">방 명 록 작 성 하 기</h2>
	<form name="myform" method="post" action="${ctp}/guest/GuestInputOk" class="was-validated">
		<div class="form-group">
  		<label for="name">성명</label>
  		<input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요." required>
  		<div class="valid-feedback">Check</div>
    	<div class="invalid-feedback">필수입력 사항입니다.</div>
    </div>
    <div class="form-group">
  		<label for="email">Email</label>
  		<input type="text" name="email" id="email" class="form-control" placeholder="user1234@green.com">
    </div>
    <div class="form-group">
  		<label for="homePage">homepage</label>
  		<input type="text" name="homePage" id="homePage" class="form-control" placeholder="홈페이지 주소를 입력하세요."/>
  		<br/>
    	<label for="content">방문소감</label>
  		<textarea rows="10" name="content" id="content" class="form-control" required></textarea>
  		<div class="valid-feedback">Check</div>
    	<div class="invalid-feedback">필수입력 사항입니다.</div>
    </div>
    <div class="form-group text-right">
    	<input type="submit" value="등록하기" class="btn btn-success" /> &nbsp;
    	<input type="reset" value="다시입력" class="btn btn-secondary" /> &nbsp;
    	<input type="button" value="돌아가기" onclick="location.href='${ctp}/GuestList';" class="btn btn-info" /> 
    </div>
    <input type="hidden" name="hostIp" value=" <%=request.getRemoteAddr()%>" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>