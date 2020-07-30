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
    <title>MAP</title>
</head>
<body>
    <div class="container">
        <header>
            <h1><%=manager.getPlayerList().get(manager.getTurn()).getCount() + 1%>ターン目です</h1><br>
            <h1><%=manager.getPlayerList().get(manager.getTurn()).getName()%>さんの番です</h1><br>
<div class="row">
				<div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <%
                        if(manager.getPlayerList().get(manager.getTurn()).getNowRest() == 0){
                            if(manager.getPlayerList().get(manager.getTurn()).getCanUltimate()== true){
                                out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-default'>必殺技</button></form>");
                            }else if(manager.getPlayerList().get(manager.getTurn()).getCanUltimate() == false){
                            	out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-default' disabled>必殺技</button></form>");                          }
                        }else{
                        	out.print("<form action='Sugoroku' method='post' class='row'><button type='submit' name='page' value='ultimate' class='btn btn-default' disabled>必殺技</button></form>");
                        }
                    %>
                </div>
                <div class="col-sm-3">
                    <%
                        if(manager.getPlayerList().get(manager.getTurn()).getNowRest() == 0){
                            out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>サイコロをふる</button></form>");
                        }else {
                        	out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>次のプレイヤーへ</button></form>");
                        }
					%>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </header>
    </div>
<div class="container">
        <div class="card-deck">
            <%
                for(int i = 0; i < 4; i++){
                    out.print("<div class='card-mb-4'><div class='card-body'><h2 class='card-title'>");
                    out.print(manager.getPlayerList().get(i).getName());
                    out.println("</h2>");

                    if(manager.getPlayerList().get(i).getBloodAlcLv() < 5){
                    	String imagePath = "image/" + manager.getPlayerList().get(i).getEnName() + ".jpg";
                        out.print("<img class='card-img' src='");
                        out.print(imagePath);
                        System.out.print(imagePath);
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

                    out.print("<div class='card-text'><table class='table'><tr><th>進捗</th><th>");
                    out.print(manager.getPlayerList().get(i).getLocation());
                    out.println("/");
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
        <table class="table">
            <tr>
                <%
                	for (int i=0; i<4; i++){
                        out.print("<tr>");
                        for (int j=0; j<=manager.getSQUARE()-1; j++){
                        	boolean[] locationArray = manager.getPlayerList().get(i).getLocationArray();
                        	if (locationArray[j]){
								String imagePath =  "image/" + manager.getPlayerList().get(i).getEnName() + ".jpg";
                        		out.print("<td><img class='sm-icon' src='");
                        		out.print(imagePath);
                        		out.print("'></td>");
                        	} else {
								String imagePath =  "image/location.png";
                        		out.print("<td><img class='location' src='");
                        		out.print(imagePath);
                        		out.print("'></td>");
                        	}
                        }
                	}
                    out.println("</tr>");
                %>
            </tr>
        </table>
    <form action="Sugoroku" method="post">
		<button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
	</form>
</div>
</body>
</html>