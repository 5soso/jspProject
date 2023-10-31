<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>ex_member2</title>
  
<!-- 쿠키 저장하기 --> 
<% 
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	if((!mid.equals("admin") && pwd.equals("1234")) && !(mid.equals("atom") && pwd.equals("1234"))) {
		//로그인 정보 틀렸을 때
		out.println("<script>");
		out.println("alert('회원 정보를 확인하세요');");
		out.println("location.href='ex_login.jsp';");
		out.println("</script>");
		return;
	}

	//정상적으로 로그인이 되었을 때
	Cookie cookieMid = new Cookie("cMid", mid);
	
	//String midCheck = request.getParameter("midCheck")==null ? "" : request.getParameter("midCheck");
	String midCheck = request.getParameter("midCheck")==null ? "off" : "on";
	//System.out.println("m : " + midCheck);
	if(midCheck.equals("on")){
			cookieMid.setMaxAge(60*60*24*7);
	}
	else {
			cookieMid.setMaxAge(0);
	}
	response.addCookie(cookieMid);
	
	//아이디를 session에 저장한다.
	session.setAttribute("sMid", mid);

%>
  <script>
  	'use strict';
  	
  	function logout(){
  		let ans=confirm("로그아웃 하시겠습니까?"); 

  		if(ans) {
  			location.href="${pageContext.request.contextPath}/study/1031_storage/ex_logout.jsp";
  		}
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>저장된 쿠키 출력</h2>
  <p>${sMid}님 로그인중입니다.</p>
<% 
	Cookie[] cookies = request.getCookies();

	out.println("저장된 쿠키는?<br/>");
	for(int i=0; i<cookies.length; i++){
		out.println("쿠키명 : " + cookies[i].getName() + " , ");
		out.println("쿠키값 : " + cookies[i].getValue() + " , ");
		out.println("만료시간 : " + cookies[i].getMaxAge() + "<br/>");
	}
%>
  <p>
  	<a href="javascript:logout()" class="btn btn-success">로그아웃</a>
  </p>
</div>
<p><br/></p>
</body>
</html>