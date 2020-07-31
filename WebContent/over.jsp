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
    <script src="css/map.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <title>EVENT</title>
</head>
<body>
    <header>
    	<%
	        String imagePath = "image/" + manager.getPlayerList().get(manager.getTurn()).getEnName() + ".jpg";
	        out.print("<img style='width:30% height:30%' src='");
	        out.print(imagePath);
	        out.print("'>");
        %>
	    <h1><%=manager.getPlayerList().get(manager.getTurn()).getName()%>さん　GAMEOVER　です</h1>
    </header>
    <div class="container">
        <section class="result">
            <h2>最終結果</h2>
            <table class='table'>
                <tr><th>進捗</th><th><%=manager.getPlayerList().get(manager.getTurn()).getLocation()%>/
                					<%=manager.getSQUARE()%></th></tr>
                <tr><td>血中アルコール濃度</td><td><%=manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv()%>％</td></tr>
            </table>
        </section>

		<form action="Sugoroku" method="post">
			<button type="submit" name="page" value="back" class="btn btn-default">次のプレイヤーへ</button>
		</form>
    </div>
</body>
