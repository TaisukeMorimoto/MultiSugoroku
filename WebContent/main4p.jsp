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
    <script src="main.js"></script>
    <link rel="stylesheet" href="main.css">
    <title>MAP</title>
</head>
<body>
    <div class="container">
        <header>
            <h1><%=manager.playerList[manager.getTurn()].getCount()%>ターン目です</h1><br>
            <h1><%=manager.playerList[manager.getTurn()].getPlayer()%>さんの番です</h1><br>
            <div class="row">
                <div class="col-sm-6">
                    <%
                        if(maneger.playerList[manager.getTurn()].getNowRest == 0){
                            if(manager.playerList[manager.getTurn()].getCanAltimate() == true){
                                <button type="button" onclick="location.href='Sugoroku?page=ultimate'" class="btn btn-default">必殺技</button>
                            }else if(manager.playerList[manager.getTurn()].getCanAltimate() == false){
                                <button type="button" class="btn btn-default" disabled>必殺技</button>
                            }
                        }else{
                            <button type="button" class="btn btn-default" disabled>必殺技</button>
                        }
                </div>
                <div class="col-sm-6">
                    <%
                        if(maneger.playerList[manager.getTurn()].getNowRest == 0){
                            <button type="button" onclick="location.href='Sugoroku?page=dice'" class="btn btn-default">サイコロを振る</button>
                        }else {
                            <button type="button" onclick="location.href='Sugoroku?page=dice'" class="btn btn-default">次のプレイヤーへ</button>
                        }

                </div>
            </div>
        </header>
    </div>
    <div class="container">
        <div class="card-deck">
            <%
                for(int i = 0; i < 4; i++){
                    out.println("<div class='card-mb-4'><div class='card-body'><h2 class='card-title'><%=manager.getPlayerList[" + i + "].getName()%></h2>")

                    if(manager.playerList[i].getAlcohol() < 5){
                        out.println("<img class='card-img' src='<%=manager.getPlayerList[" + i +"].getImagePath[1]>'>");
                    }else if(manager.playerList[i].getAlcohol() >= 5 && manager.playerList[i].getAlcohol() < 10){
                        out.println("<img class='card-img' src='<%=manager.getPlayerList[" + i +"].getImagePath[2]>'>");
                    }else if(manager.playerList[i].getAlcohol() >= 10 && manager.playerList[i].getAlcohol() < 15){
                        out.println("<img class='card-img' src='<%=manager.getPlayerList[" + i +"].getImagePath[3]>'>");
                    }else if(manager.playerList[i].getAlcohol() >= 15 && manager.playerList[i].getAlcohol() < 20){
                        out.println("<img class='card-img' src='<%=manager.getPlayerList[" + i +"].getImagePath[4]>'>");

                    out.println("<div class='card-text'><table class='table'><tr><th>進捗</th><th><%=manager.playerList[" + i + "].getLocation()%>/<%=manager.getSQUARE() - 1%></th></tr><tr><td>血中アルコール濃度</td><td><%=manager.playerList[" + i + "].getAlcohol()%>％</td></tr></table></div></div></div>");
                %>

        </div>
    </div>
    <div class="container">
        <table class="table">
            <tr>
                <%
                    out.println("<tr>");
                    for (int i = 0; i <= manager.getSQUARE() -1; i++) {
                        if (manager.playerList[manager.getTurn() - 1].getLocationArray(i)) {
                            out.println("<td><img src='<%=manager.getPlayerList[" + i +"].getImagePath[1]>'></td>");
                        } else {
                            out.println("<td></td>");
                        }
                    }
                    out.println("</tr>");
                %>
            </tr>
        </table>
    </div>

    <button type="button" class="btn btn-default" onclick="location.href='sugoroku?page=init'">最初から</button>

</body>
</html>