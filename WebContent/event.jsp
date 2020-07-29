<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sugorokubean" scope="application" class="practice.SugorokuBean" />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="map.js"></script>
    <link rel="stylesheet" href="event.css">
    <title>EVENT</title>
</head>
<body>
    <header>
	    <img>
	    <div><%=manager.playerList[manager.getTurn()].getDice()&>がでました。</div>
    </header>
    <div class="container">
        <section class="square">
            <%
                if(<%=manager.playerList[manager.getTurn()].getSpecialitySquares()%> != 0){
                    <h2><%=manager.playerList[manager.getTurn()].getPlayer()%>の能力で進むマスが<%=manager.playerList[manager.getTurn()].getSpecialitySquares()%>されます</h2>
                }else{
                    <h2><%=manager.playerList[manager.getTurn()].getDice()&>マス進みます</h2>
                }
            %>
            <div class="event">
                <h3><%=manager.sugoroku.liquorList[manager.playerList[manager.getTurn()].getLocation()].getLiquorText()%></h3><br>
                <h2>血中アルコール濃度が<%=manager.sugoroku.liquorList[manager.playerList[manager.getTurn()].getLocation()].getLiquorAlcLv()%>されます</h2>
            </div>
        </section>
        <section class="alcohol">
            <%
            if(<%=manager.playerList[manager.getTurn()].getSpecialityAlc()%> != 0){
                <h2><%=manager.playerList[manager.getTurn()].getPlayer()%>の能力でアルコールの吸収が<%=manager.playerList[manager.getTurn()].getSpecialityAlc()%>されます</h2>
            }else{
                <h2></h2>
            }
            %>
            <div class="bloodAlcLv">
                <h2>現在の血中アルコール濃度は<%=manager.playerList[manager.getTurn()].getBloodAlcLv()%>％になりました。</h2>
            </div>
        </section>

        <button type="button" onclick="location.href='Sugoroku?page=next'" class="btn btn-default">進む</button>
        <button type="button" onclick="location.href='sugoroku?page=init'"  class="btn btn-default">最初から</button>

    </div>
</body>
