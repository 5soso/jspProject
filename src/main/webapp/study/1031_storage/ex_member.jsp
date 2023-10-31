<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ex_member.jsp --> 
 <jsp:include page="/include/bs4.jsp" />
 <div class="container"> 
	<h2>회원 쿠키(아이디) 저장</h2>
	<hr/>
	
	<!-- 
	1. 로그인창에 입력된 아이디와 비밀번호를 읽어야 한다. EL표기법을 사용하고 싶음. 
	EL은 dispatcher전송방식일 때 사용가능하다. /  저장소에 변수를 담아서 가져오면 EL표기법을 사용하여 읽을 수 있다.
	2. 체크박스에 체크가 되면 아이디 쿠키를 저장한다. / 체크하지 않으면 쿠키 값을 지운다?...
	3. 아이디 쿠키 변수를 화면으로 다시 보낸다. 
	-->
 <%
/*  	if( 체크박스가 체크 되었다면 ) {
 		String mid= request.getParameter("mid");
 		Cookie cookieMid = new Cookie("cMid", mid);
 		
 		response.addCooke(cookieMid);
 	}
 */
 
 
 
 
 
 %>
  
  <form name="myform" method="post" action="ex_login.jsp" >
  	<input type="button" value="로그아웃" class="btn btn-info"/> 
  </form>
 </div> 
<p><br/></p>