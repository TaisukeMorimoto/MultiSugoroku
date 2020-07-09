<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sugorokubean" scope="application" class="practice.SugorokuBean" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<title>すごろく</title>
</head>
<body>
 <div class="container">
 	<br>
 	<div class="large-message"><%=sugorokubean.rollDice() %>がでました。
 	</div>
 	<br>
 	<br>
 	<div class="button">
 	<%
 		if (sugorokubean.getLocation() == sugorokubean.getSQUARE() - 1){
 			out.println("<a href='Sugoroku?number=3'>進む</a><br>");
 		} else {
 			out.println("<a href='Sugoroku?number=1'>進む</a><br>");
 		}
 	%>
 	</div>
 </div>
 <% session.setAttribute("sugorokubean", sugorokubean); %>
</body>
</html>
