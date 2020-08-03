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
    <link rel="stylesheet" href="css/main.css">
    <title>CLEAR</title>
</head>
<body>
    <div class="container">
        <header>
        	<div class="row">
        	<div class="col-sm-6">
            	<h1 style="font-size: 35px;">　　<%=manager.getPlayerList().get(manager.getTurn()).getName()%>さんの勝利！!</h1><br>
			</div>
				<div class="col-sm-1"></div>
                <div class="col-sm-4">
					<form action="Sugoroku" method="post">
						<button type="submit" name="page" value="init" class="btn btn-default">もう一度あそぶ</button>
					</form>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </header>
    </div>
<div class="container">
        <div class="card-deck">

            <%
                for(int i = 0; i < 4; i++){
                    out.print("<div class='card-mb-4' style='width: 16rem;'><div class='card-body'><h2 class='card-title'>");
                    out.print(manager.getPlayerList().get(i).getName());
                    out.print("</h2>");

                    if(manager.getPlayerList().get(i).getBloodAlcLv() < 5){
                    	String imagePath = "image/" + manager.getPlayerList().get(i).getEnName() + ".jpg";
                        out.print("<img class='card-img' src='");
                        out.print(imagePath);
                        out.print("'>");
                    }else if(manager.getPlayerList().get(i).getBloodAlcLv() >= 5 && manager.getPlayerList().get(i).getBloodAlcLv() < 10){
                    	String imagePath = "image/" +  manager.getPlayerList().get(i).getEnName() + ".jpg";
                        out.print("<img class='card-img' src='");
                        out.print(imagePath);
                        out.print("'>");
                    }else if(manager.getPlayerList().get(i).getBloodAlcLv() >= 10 && manager.getPlayerList().get(i).getBloodAlcLv() < 15){
                    	String imagePath = "image/" +  manager.getPlayerList().get(i).getEnName() + ".jpg";
                        out.print("<img class='card-img' src='");
                        out.print(imagePath);
                        out.print("'>");
                    }else if(manager.getPlayerList().get(i).getBloodAlcLv() >= 15 && manager.getPlayerList().get(i).getBloodAlcLv() < 20){
                    	String imagePath = "image/" +  manager.getPlayerList().get(i).getEnName() + ".jpg";
                        out.print("<img class='card-img' src='");
                        out.print(imagePath);
                        out.print("'>");
                    }

                    out.print("<div class='card-text'><table class='table'><tr><th>現在地</th><th>");
                    out.print(manager.getPlayerList().get(i).getLocation());
                    out.print("/");
                    int square = manager.getSQUARE() - 1;
                    out.print(square);
                    out.print("</th></tr><tr><td>血中アルコール濃度</td><td>");
                    out.print(manager.getPlayerList().get(i).getBloodAlcLv());
                    out.print("％</td></tr></table></div></div></div>");
                }
            %>
        </div>
</div>
<div class="container">
    <form action="Sugoroku" method="post">
		<button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
	</form>
</div>
</body>
</html>