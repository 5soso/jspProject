<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>ex1.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
	function hap(sum) {
		alert(sum);
	}
</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<div>1025과제-jsp</div>
	<hr/>
	<h3>1000보다 작은 자연수 중에서 2또는 5의 배수 모두 더하기</h3>
	<% 
		int sum=0;
	
		for(int i=1; i<=1000; i++) {
			if(i%2 == 0 || i%5 == 0)
				sum += i;
		}
		
		out.println("1에서 1000까지 2또는 5의 배수의 합은? "+sum+"입니다.");
	%>
	<hr/>
	
	<div>1에서 1000까지 2또는 5의 배수의 합은? <%= sum %></div>
	<p>
		<input type="button" value="출력" onclick="hap(<%= sum %>)" class="form control btn btn-info" />
	</p>
	<hr/>
</div>
<p><br/></p>
</body>
</html>