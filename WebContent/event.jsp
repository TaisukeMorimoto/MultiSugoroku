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
    <script src="js/map.js"></script>
    <link rel="stylesheet" href="css/start.css">
    <title>EVENT</title>
</head>
<body>

	<div class="container">
	<header>
       	<div class="row">
       	<div class="col-sm-1"></div>
       	<div class="col-sm-2">
		<%
	    	String imagePath = "image/" +  manager.getPlayerList().get(manager.getTurn()).getDice() + ".png";
	        out.print("<img src='");
	        out.print(imagePath);
	        out.print("'>");
	    %>
		</div>
          <div class="col-sm-9">
			<h2>「<%=manager.getPlayerList().get(manager.getTurn()).getDice()%>がでました。」</h2><br>
			<%
                if(manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares() != 0){
	            	out.print("<br>→");
                	String name = manager.getPlayerList().get(manager.getTurn()).getName();
                	int specialitySquares = manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares();
					int dice = manager.getPlayerList().get(manager.getTurn()).getDice();
					out.print("<a style='color: rgb(157, 125, 150);'>");
                    out.print(name);
                    out.print("</a>の能力により、進むマスが");
                    out.print(specialitySquares);
                    out.print("されます。<br>");

                }
            	out.print(manager.getPlayerList().get(manager.getTurn()).getDice());
            	out.print("マス進みます。");
            %>
              </div>
          </div>
      </header>

            <div class="row">
            <div class="col-sm-1"></div>
        	<div class="col-sm-2">
			<%
		    	String playerImagePath = "image/" +  manager.getPlayerList().get(manager.getTurn()).getEnName() + ".jpg";
		        out.print("<img src='");
		        out.print(playerImagePath);
		        out.print("'style='width:80px; height:80px; object-fit:cover; border-radius:50%;'>");
		    %>
			</div>

                <div class="col-sm-9">
            	<%
            		int location = manager.getPlayerList().get(manager.getTurn()).getLocation();
            		String liquorText = manager.getSugoroku().getLiquorList().get(location).getLiquorText();
            		int liquorAlcLv = manager.getSugoroku().getLiquorList().get(location).getLiquorAlcLv();
            	%>
                <h2>「<%=liquorText%>」</h2><br><section style="font-weight: initial;">血中アルコール濃度が<%=liquorAlcLv%>%加わります。
	            <%
	            if(manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc() != 0){
	            	out.print("<br>→<a style='color: rgb(157, 125, 150);'>");
	            	out.print(manager.getPlayerList().get(manager.getTurn()).getName());
	            	out.print("</a>の能力で血中アルコール濃度を");
	            	int specialityAlc = manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc();
	            	out.print(specialityAlc);
	            	out.print("%変化させます。<br>血中アルコール濃度が");
	            	out.print(liquorAlcLv + specialityAlc);
	            	out.print("%加わります。");
	            }
	            %>
	            </section>
                </div>
            </div>
        <section class="alcohol">
            <section class="information">
                <h4>→飲酒結果</h4>
                <div class="rule">
                    <p>現在の血中アルコール濃度は<%=manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv()%>％になりました。<br>
                    現在地は<%=manager.getPlayerList().get(manager.getTurn()).getLocation()%>です。<br>
                    </p>
                </div>
            </section>
        </section>

		<form action="Sugoroku" method="post">
			<button type="submit" name="page" value="next" class="btn btn-default">進む</button>
		</form>
    </div>
</body>
