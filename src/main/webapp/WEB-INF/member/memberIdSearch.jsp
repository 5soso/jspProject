<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>memberIdSearch.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use strict';
  	
  	function idSearch() {
  		let email = document.getElementById("emailSearch").value;
  		
  		$.ajax({
  			url : "memberIdSearchOk.mem",
  			type : "post",
  			data : {email : email},
  			success : function(res) {
  				//console.log("res : ",res);
	  			let str = "검색 결과 : <font color=blue><b>";
  				if(res!="0") {
	  				let su = parseInt(Math.random()*(3+2+1))+2;
	  				
	  				str += res.substring(0,1);
	  				for(let i=1; i<res.length; i++) {
	  					if(i%su!=0) str += res.substring(i,i+1);
	  					else str += "*";
	  				}
	  				str += "</b></font>";
  				}
  				else str="검색된 이메일 주소가 없습니다.";
	  			demo.innerHTML = str;
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
  	<input type="text" name="emailSearch" id="emailSearch" placeholder="가입시 이메일을 입력하세요." autofocus required class="form-control mb-2" />
  	<input type="button" value="아이디찾기" onclick="idSearch()" class="btn btn-secondary"/>
  </form>
  <hr/><br/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>