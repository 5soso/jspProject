<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>test7_ex.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script>
  	'use strict';
  	
  	let print;
  	
  	function selectCheck(value) {
  		
  		let selectImg = document.getElementById("selectImg");
  		let dogImg = document.getElementById("dogImg");
  		  		
  		let index = selectImg.selectedIndex;
  		print = selectImg.options[index].value; 		
  		dogImg.innerHTML = print;
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>콤보상자에서 그림파일을 선택하면 선택된 그림을 화면에 출력시켜주시오.</h2>
  <form name="myfrom">
  	<label for="selectImg">강아지를 고르세요.</label>
  	<select name="selectImg" id="selectImg" onchange="selectCheck(this.value)">
  		<option value="">선택</option>
  		<option value="/images/1.jpg">만세하는 강아지</option> 
  		<option value="/images/2.jpg">웃고있는 강아지</option>
  		<option value="/images/3.jpg">산책하는 강아지</option>
  		<option value="/images/4.jpg">목욕하는 강아지</option>
  		<option value="/images/5.jpg">누워있는 강아지</option>
  		
  	</select><br/><br/>
  </form>
  <hr/>
  <div>
  	<img src=<%="request.getContext()"+"print" %>  id="dogImg"/>
  </div>  
</div>
<p><br/></p>
</body>
</html>