<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>memberPwdSearch.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  'use strict';
	
	function pwdSearch() {
		let mid = document.getElementById("midSearch").value;
		let email = document.getElementById("emailSearch").value;
		
		let query = {
			mid : mid,
			email : email
		}
		
		$.ajax({
			url : "memberPwdSearchOk.mem",
			type : "post",
			data : query,
			success : function(res) {
				demo.innerHTML = res;
			},
			error : function(){
				alert("전송 실패");
			}
		});
	}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform">
  	<input type="text" name="midSearch" id="midSearch" placeholder="가입시 아이디를 입력하세요." autofocus required class="form-control mb-2" />
  	<input type="text" name="emailSearch" id="emailSearch" placeholder="가입시 이메일을 입력하세요." required class="form-control mb-2" />
  	<input type="button" value="비밀번호찾기" onclick="pwdSearch()" class="btn btn-secondary"/>
  </form>
  <hr/><br/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>