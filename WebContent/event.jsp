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
    <link rel="stylesheet" href="css/event.css">
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
			<h3><%=manager.getPlayerList().get(manager.getTurn()).getDice()%>がでました。</h3>
			<h5>
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
				int resDice = manager.getPlayerList().get(manager.getTurn()).getDice() +  manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares();
            	out.print(resDice);
            	out.print("マス進み、飲み物を頼みます。");
            %>
            </h5>
          </div>
          </div>
       	<div class="row">
       	<div class="col-sm-1"></div>
       	<div class="col-sm-11">
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
		        out.print("<img src='");
		        out.print(playerImagePath0);
		        out.print("'style='width:80px; height:80px; object-fit:cover; border-radius:50%;'>");
		    %>
			  </div>
			  <div class="chatting">
			    <div class="says">
			    <%
            		int location0 = manager.getPlayerList().get(manager.getTurn()).getLocation();
            		String liquorText0 = manager.getSugoroku().getLiquorList().get(location0).getLiquorText();
            		String liquorName = manager.getSugoroku().getLiquorList().get(location0).getLiquorName();
            		int liquorAlcLv0 = manager.getSugoroku().getLiquorList().get(location0).getLiquorAlcLv();
            	%>
			      <h4><%=liquorText0 %></h4>
			    </div>
			  </div>
			</div>
			<!--吹き出し終わり-->
		</div>
		</div>
		<div class="row">
       	<div class="col-sm-3"></div>
       	<div class="col-sm-9">
       	<h5>
       		<%=liquorName%>はアルコール度数が<%=liquorAlcLv0%>%です。
			<%
	            if(manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc() != 0){
	            	out.print("<br>→<a style='color: rgb(157, 125, 150);'>");
	            	out.print(manager.getPlayerList().get(manager.getTurn()).getName());
	            	out.print("の能力</a>で血中アルコール濃度を");
	            	int specialityAlc = manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc();
	            	out.print(specialityAlc);
	            	out.print("%変化させます。<br>血中アルコール濃度が");
	            	out.print(liquorAlcLv0 + specialityAlc);
	            	out.print("%加わります。");
	            }else{
	            	out.print("血中アルコール濃度が");
	            	out.print(liquorAlcLv0);
	            	out.print("%加わります。");
	            }

	        %>
	     </h5>
	     </div>
	     </div>

	     <section class="alcohol">
            <section class="information">
                <h4>＜飲酒結果＞</h4>
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
      </header>
</body>
