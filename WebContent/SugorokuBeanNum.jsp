<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="sugorokubean" scope="application"
	class="practice.SugorokuBean" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<title>すごろく</title>
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>

	<!-- header -->
	<header>
		<h1 class="headline">
			<a>泥酔すごろく</a>
		</h1>
	</header>
	<br>
	<br>

	<div class="container">

		<div class="card text-white bg-dark mb-3"
			style="width: 70rem; margin: 0 auto;">
			<div class="row no-gutters">
				<div class="col-md-4 my-auto">
					<img class="card-img" src="images/drinkatonce.png">
				</div>
				<div class="col-md-8">
					<br>
					<div class="card-body">
						<h3 class="card-title"><%=sugorokubean.rollDice()%>がでました。
						</h3>
						<br> <br>
						<div class="card-text">
							<p style="font-size: 30px;">
								「<%=sugorokubean.getDrinkText()%>」<br>
								<%=sugorokubean.getAlcoholLvText()%></p>
							<br> 現在の血中アルコール濃度は<%=sugorokubean.alcIntake()%>です。<br>
							<br> <br>
						</div>
						<div class="mxauto">
							<%
								if (sugorokubean.getLocation() == sugorokubean.getSQUARE() - 1) {
								out.println("<a href='Sugoroku?number=3' class='btn btn-primary btn-lg'>進む</a><br>");
							} else if (sugorokubean.getBloodAlcLv() >= 20) {
								out.println("<a href='Sugoroku?number=5' class='btn btn-primary btn-lg'>進む</a><br>");
							} else {
								out.println("<a href='Sugoroku?number=1' class='btn btn-primary btn-lg'>進む</a><br>");
							}
							%>
						</div>
						<br> <br> <br>
					</div>
				</div>
			</div>
		</div>

	</div>

	<%
		session.setAttribute("sugorokubean", sugorokubean);
	%>
</body>
</html>
