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
    <link rel="stylesheet" href="css/event4.css">
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
				int dice = manager.getPlayerList().get(manager.getTurn()).getDice();
				int resDice = manager.getPlayerList().get(manager.getTurn()).getDice() +  manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares();
		    %>
		    <img src=<%=imagePath %> style="width:120px; height:120px;">
		</div>
          <div class="col-sm-9">
			<h4><%=dice%>がでました。
			<%
                if(manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares() != 0){
                	String name = manager.getPlayerList().get(manager.getTurn()).getName();
                	int specialitySquares = manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares();
             %>
             	<br>
             	<a style="color: #4bced3;"><%=name%></a>の能力により、<a style="color: #4bced3; font-size:40px;"><%=resDice%>マス</a>進みます。<br>
               <% } else { %>
				<%=resDice%>マス進みます。
				<% } %>
				</h4>
          </div>
          </div>
       	<div class="row">
       	<div class="col-sm-1"></div>
       	<div class="col-sm-7">
          <!--吹き出しはじまり-->
			<div class="balloon5">
			  <div class="faceicon">
			<%
				/* アルコールレベルのジャッジ */
				String alcStatus = "";
				if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 5) {
					alcStatus = "1";
				} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 10){
					alcStatus = "2";
				} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 15) {
					alcStatus = "3";
				} else {
					alcStatus = "4";
				}

		    	String playerImagePath0 = "image/" +  manager.getPlayerList().get(manager.getTurn()).getEnName() + alcStatus + ".jpg";
		    %>
		    <img src=<%=playerImagePath0%> style="style=width:80px; height:80px; object-fit:cover; border-radius:50%;">

			  </div>
			  <div class="chatting">
			    <div class="says">
			    <%
            		int location0 = manager.getPlayerList().get(manager.getTurn()).getLocation();
            		String liquorText0 = manager.getSugoroku().getLiquorList().get(location0).getLiquorText();
            		String liquorName = manager.getSugoroku().getLiquorList().get(location0).getLiquorName();
            		String liquorEnName = manager.getSugoroku().getLiquorList().get(location0).getLiquorEnName();
            		String liquorPath = "image/" + liquorEnName + ".png";
            		int liquorAlcLv0 = manager.getSugoroku().getLiquorList().get(location0).getLiquorAlcLv();
            		String liquorAlcLv0Char = "";
            		if (liquorAlcLv0 > 0){
	            		liquorAlcLv0Char = "+" + liquorAlcLv0;
            		} else {
            			liquorAlcLv0Char = "" + liquorAlcLv0;
            		}


            	%>
			      <h4><%=liquorText0 %></h4>
			    </div>
			  </div>
			</div>
			<!--吹き出し終わり-->
			</div>
			<div class="col-sm-4">
				<div class="img">
					<img src=<%=liquorPath%>>
					<p><%=liquorAlcLv0Char%>%</p>
				</div>
			</div>
		</div>
		<div class="row">
       	<div class="col-sm-3"></div>
       	<div class="col-sm-9">
       	<h4>
			<%
                if(manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc() != 0){
                	String name = manager.getPlayerList().get(manager.getTurn()).getName();
                	int specialityAlc = manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc();
            		String specialityAlcChar = "";
            		if (specialityAlc > 0){
            			specialityAlcChar = "+" + specialityAlc;
            		} else {
            			specialityAlcChar = "" + specialityAlc;
            		}
             %>
             	<br>
             	<a style="color: #4bced3;"><%=name %></a>の能力により、<br>血中アルコール濃度に
             	<a style="color: #4bced3; font-size:40px;"><%=liquorAlcLv0 + specialityAlc%>%</a>加わります。<br>
               <% } else {
            	   int specialityAlc = manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc();
            	%>
				血中アルコール濃度に<%=liquorAlcLv0 + specialityAlc%>%加わります。
				<% } %>
		</h4>
	     </div>
	     </div>

		<form action="Sugoroku" method="post">
			<button type="submit" name="page" value="next" class="btn btn-default">進む</button>
		</form>
      </header>
</body>
