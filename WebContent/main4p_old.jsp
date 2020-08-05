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
    <link rel="stylesheet" href="css/main2.css">
    <title>MAP</title>
</head>
<body>
    <div class="container">
        <header>
        	<div class="row">
        	<div class="col-sm-6">
            	<h3>　　<%=manager.getPlayerList().get(manager.getTurn()).getCount() + 1%><a>ターン目</a></h3><br>
            	<h3>　　<%=manager.getPlayerList().get(manager.getTurn()).getName()%>さん<a>の番です</a></h3><br>
			</div>
				<div class="col-sm-1"></div>
                <div class="col-sm-4">
                    <%
                        if(manager.getPlayerList().get(manager.getTurn()).getNowRest() == 0){
                            if(manager.getPlayerList().get(manager.getTurn()).getCanUltimate()== true){
                                out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-default'>必殺技</button></form>");
                            }else if(manager.getPlayerList().get(manager.getTurn()).getCanUltimate() == false){
                            	out.print("<form action='Sugoroku' method='post'><div class='disable'><button type='submit' name='page' value='ultimate' class='btn btn-default' disabled>必殺技</button></form>");                          }
                        }else{
                        	out.print("<form action='Sugoroku' method='post' class='row'><button type='submit' name='page' value='ultimate' class='btn btn-default' disabled>必殺技</button></form>");
                        }
                    %>
                    <%
                        if(manager.getPlayerList().get(manager.getTurn()).getNowRest() == 0){
                            out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>サイコロをふる</button></form>");
                        }else {
                        	out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>次のプレイヤーへ</button></form></div>");
                        }
					%>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </header>

	<div class="card mb-3" style="max-width: 500px;">
      <div class="row no-gutters">
        <div class="col-lg-6">
          <img src="images/notepc-wp.jpeg" class="card-img" alt="...">
        </div>
        <div class="col-lg-6">
          <div class="card-body">
            <h4 class="card-title">ライトコース</h4>
            <p class="card-text">ホームページ・ブログ開設など基礎を身に付けたい方向けコースです。</p>
          </div>
        </div>
      </div>
    </div>


        <div class="card-deck">
            <%
                for(int i = 0; i < 4; i++){
                    out.print("<div class='card-mb-4' style='width: 14rem;'><div class='card-body'><h4 class='card-title'>");
                    out.print(manager.getPlayerList().get(i).getName());
                    out.print("</h4>");

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

        <table class="table">
            <tr>
                <%
                	for (int i=0; i<4; i++){
                        out.print("<tr>");
                        for (int j=0; j<=manager.getSQUARE()-1; j++){
                        	boolean[] locationArray = manager.getPlayerList().get(i).getLocationArray();
                        	if (locationArray[j]){
								String imagePath =  "image/" + manager.getPlayerList().get(i).getEnName() + ".jpg";
                        		out.print("<td><img style='width:40px; height:40px;' src='");
                        		out.print(imagePath);
                        		out.print("'></td>");
                        	} else if (j == manager.getSQUARE()-1){
   								String imagePath =  "image/flag.png";
                           		out.print("<td><img style='width:30px; height:30px;' src='");
                           		out.print(imagePath);
                           		out.print("'></td>");
                        	} else{
								String imagePath =  "image/round.png";
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