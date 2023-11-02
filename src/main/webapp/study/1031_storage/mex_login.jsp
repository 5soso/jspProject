<%@page import="java.net.CookieStore"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("cMid")) {
			//System.out.println("gap : " + cookies[i].getValue());
			pageContext.setAttribute("mid", cookies[i].getValue());
			break;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>mex_login.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	span {
  		color: red;
  	}
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>로그인(cookie)</h2>
  <hr/>
  <form name="myform" method="post" action="mex_member.jsp" >
  <div style="text-align: right;">* 필수입력</div>
  	<div> 
  		<label for="mid">아이디 <span>*</span></label>
  		<input type="text" name="mid" id="mid" value="${mid}" class="form-control mb-2" autofocus required />
  		<input type="checkBox" name="midCheck" id="midCheck" checked class="mb-4" /> 아이디 저장하기
  	</div>
  	<div>
  		<label for="mid">비밀번호 <span>*</span></label>
  		<input type="password" name="pwd" id="pwd" value="1234" class="form-control mb-4" required />
  	</div>
  	<!-- <div>
  		<label for="nickName">닉네임 <span>*</span></label>
  		<input type="text" name="nickName" id="nickName" value="홍장군" class="form-control mb-2" required />
  	</div> -->
  	<div class="text-center">
  		<input type="submit" value="로그인" class="btn btn-info" />
  		<input type="reset" value="다시입력" class="btn btn-secondary" />
  	</div>
  </form>
</div>
<p><br/></p>
</body>
</html>