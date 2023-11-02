<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>ex5_jstlRes.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>개인 회원자료 출력</h2>
  <p>vos : ${vos}</p>
  <hr/>
  <p>성명 : ${vos.name}</p>
  <p>나이 : ${vos.age}</p>
  <p>성별 : ${vos.gender}</p>
  <p>직업 : ${vos.job}</p>
  <p>주소 : ${vos.address}</p>  
  <hr/>
  
  <p><a href="${ctp}/study/1101_JSTL/ex5_jstl.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>