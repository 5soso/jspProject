<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name = "viewport" content ="width=device-width, initial-scale=1">
  <title>test1</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<p><br/></p>
<div class="container">

  <%!
  	public int chai(int su1,int su2) {
  		if(su1 < su2) return su2;
  		else return su1;
		}
  %>
  <h3>10과 20중 큰 수는?</h3>
  <%
  	int res = chai(10,20);
  	out.println("res : " + res);
  %>
  <p>
  	결과 : <%= res %>
  </p>
</div>
<p><br/></p>
</body>
</html>