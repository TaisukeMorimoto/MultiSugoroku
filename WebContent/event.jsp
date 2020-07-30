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
    <link rel="stylesheet" href="css/main.css">
    <title>EVENT</title>
</head>
<body>
    <header>
	    <img>
	    <div><%=manager.getPlayerList().get(manager.getTurn()).getDice()%>がでました。</div>
    </header>
    <div class="container">
        <section class="square">
            <%
		        String imagePath = "image/" + manager.getPlayerList().get(manager.getTurn()).getEnName() + ".jpg";
		        out.print("<img class='md-icon' src='");
		        out.print(imagePath);
		        System.out.print(imagePath);
		        out.print("'>");
        	%>
            <%
                if(manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares() != 0){
                	String name = manager.getPlayerList().get(manager.getTurn()).getName();
                	int specialitySquares = manager.getPlayerList().get(manager.getTurn()).getSpecialitySpuares();
					int dice = manager.getPlayerList().get(manager.getTurn()).getDice();
                    out.print("<h2>");
                    out.print(name);
                    out.print("の能力により、進むマスが");
                    out.print(specialitySquares);
                    out.print("されます</h2>");
                }else{
                    out.print("<h2>");
                    out.print(manager.getPlayerList().get(manager.getTurn()).getDice());
                    out.print("マス進みます</h2>");
                }
            %>
            <div class="event">
            	<%
            		int location = manager.getPlayerList().get(manager.getTurn()).getLocation();
            		String liquorText = manager.getSugoroku().getLiquorList().get(location).getLiquorText();
            		int liquorAlcLv = manager.getSugoroku().getLiquorList().get(location).getLiquorAlcLv();
            	%>
                <h3><%=liquorText%></h3><br>
                <h2>血中アルコール濃度が<%=liquorAlcLv%>されます</h2>
            </div>
        </section>
        <section class="alcohol">
            <%
            if(manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc() != 0){
            	out.print("<h2>");
            	out.print(manager.getPlayerList().get(manager.getTurn()).getName());
            	out.print("の能力でアルコールの吸収が");
            	int specialityAlc = manager.getPlayerList().get(manager.getTurn()).getSpecialityAlc();
            	out.print(specialityAlc);
            	out.print("されます</h2>");
            }else{
                out.print("<h2></h2>");
            }
            %>
            <div class="bloodAlcLv">
                <h2>現在の血中アルコール濃度は<%=manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv()%>％になりました。</h2>
            </div>
        </section>

		<form action="Sugoroku" method="post">
			<button type="submit" name="page" value="next" class="btn btn-default">進む</button>
		</form>
    </div>
</body>
