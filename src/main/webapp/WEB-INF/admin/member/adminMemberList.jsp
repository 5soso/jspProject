<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>adminMemberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use strict';
  	
  	function levelChange(e) {
  		let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
  		if(!ans) {
  			location.reload();
  			return false;
  		}
  		
  		let items = e.value.split("/");
  		let query = {
  				level : items[0],
  				idx : items[1]
  		}
  		
  		$.ajax({
  			url : "adminMemberLevelChange.ad",
  			type : "post",
  			data : query,
  			success : function(res){
  				if(res != "0") {
  					alert("등급 수정 완료!");
  					location.reload();
  				}
  				else alert("등급 수정 실패~");
  			},
  			error : function(){
  				alert("전송오류!");
  			}
  		});
  	}
  	
  	function levelItemCheck() {
  		let levelItem = document.getElementById("levelItem").value;
  		alert("levelItem : "+levelItem);
  		location.href="adminMemberListCheck.ad?level="+levelItem;
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>전체 회원 리스트</h2>
  <table class="table">
  	<tr>
			<td>
				<div>등급별검색
					<select name="levelItem" id="levelItem" onchange="levelItemCheck()">
						<option value="">전체회원</option>
						<option value="0">관리자</option>
						<option value="1">준회원</option>
						<option value="2">정회원</option>
						<option value="3">우수회원</option>
					</select>
				</div>
			</td>  	
  	</tr>
  </table>
  <table class="table table-hover">
  	<tr class="table-dark text-dark">
  		<th>번호</th>
  		<th>아이디</th>
  		<th>닉네임</th>
  		<th>이름</th>
  		<th>공개여부</th>
  		<th>오늘방문횟수</th>
  		<th>탈퇴신청</th>
  		<th>레벨</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<tr>
  			<td>${vo.idx}</td>
  			<td>${vo.mid}</td>
  			<td>${vo.nickName}</td>
  			<td>${vo.name}</td>
  			<td>${vo.userInfor}</td>
  			<td>${vo.todayCnt}</td>
  			<td>${vo.userDel}</td>
  			<td>
  				<form name="levelForm">
  					<select name="level" onchange="levelChange(this)">
  						<option value="0/${vo.idx}" ${vo.level==0 ? 'selected' : ""} >관리자</option>
  						<option value="1/${vo.idx}" ${vo.level==1 ? 'selected' : ""}>준회원</option>
  						<option value="2/${vo.idx}" ${vo.level==2 ? 'selected' : ""}>정회원</option>
  						<option value="3/${vo.idx}" ${vo.level==3 ? 'selected' : ""}>우수회원</option>
  					</select>
  				</form>
  			</td>
  		</tr>
  	</c:forEach>
  	<tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
  <br/>
  <!-- 페이징처리 프레임 독립적이라 신경슬필요없음-->
</div>
<p><br/></p>
</body>
</html>