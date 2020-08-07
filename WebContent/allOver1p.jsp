<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
    <link rel="stylesheet" href="css/allover1p.css">
    <title>AllOver</title>
</head>
<body>
    <div class="container">
        <header>
            <h1 style="font-size: 35px;">　　今回の成績</h1><br>
        </header>
    </div>

	<div class="container">
   		<!-- player -->
   		<%
   			for (int arrayNumber=0; arrayNumber<manager.getnPlayer(); arrayNumber++){
	   			String imagePath = "image/" + manager.getPlayerList().get(arrayNumber).getEnName() + ".jpg";
	   			String name = manager.getPlayerList().get(arrayNumber).getName();
	   			String ultimateName = manager.getPlayerList().get(arrayNumber).getUltimateName();
	   			String ultimateText = manager.getPlayerList().get(arrayNumber).getUltimateText();
	   			String specialityText = manager.getPlayerList().get(arrayNumber).getSpecialityText();
	   			int location = manager.getPlayerList().get(arrayNumber).getLocation();
	   			int bloodAlcLv = manager.getPlayerList().get(arrayNumber).getBloodAlcLv();
	   			float alcRatio = bloodAlcLv*100/manager.getLimitAlcLv();
	   			float locRatio = location*100/(manager.getSQUARE()-1);
	   			String speciality = "speciality" + (arrayNumber+1);
	   			String ultimate = "ultimate" + (arrayNumber+1);
	   			String status = "status" + (arrayNumber+1);
	   			String shSpeciality = "#speciality" + (arrayNumber+1);
	   			String shUltimate = "#ultimate" + (arrayNumber+1);
	   			String shStatus = "#status" + (arrayNumber+1);
	   			int count = manager.getPlayerList().get(manager.getTurn()).getCount();
   		%>
	      <div class="row no-gutters" style="color: white;">
	        <div class="col-sm-3">
	          <img src=<%=imagePath%> class="img-main" style="width:250px; height:250px;" alt="...">
	        </div>
	        <div class="col-sm-3"></div>
	        <div class="col-sm-6" style="font-size:25px;"><br>
				最終到達マス：　<%=location%><br><br>
				飲んだ酒の数：　<%=count%><br>
				____________________________________<br><br>
				合計得点：　<%=location*100 + count*50%>　point
	        </div>
	      </div>
	    <% } %>
	 </div><br><br>

	 <div class="container">
    <form action="Sugoroku" method="post">
		<button type="submit" name="page" value="init" class="btn btn-default">ランキングに登録</button>
		<button type="submit" name="page" value="init" class="btn btn-default">登録せずに終わる</button>
	</form>
	</div>
</body>
</html>