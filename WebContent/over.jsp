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
	    <img src="<%=manager.getPlayerList[manager.getTurn()].getImagePath[5]">
	    <h1><%=manager.playerList[manager.getTurn()].getPlayer()&>さん　GAMEOVER　です</h1>
    </header>
    <div class="container">
        <section class="result">
            <h2>最終結果</h2>
            <table class='table'>
                <tr><th>進捗</th><th><%=manager.playerList[manager.getTurn()].getLocation()%>/<%=manager.sugoroku.getSQUARE()</th></tr>
                <tr><td>血中アルコール濃度</td><td><%=manager.playerList[manager.getTurn()].getBloodAlcLv()%>％</td></tr>
            </table>
        </section>

        <button type="button" onclick="location.href='sugoroku?page=back'" class="btn btn-default">次のプレイヤーへ</button>
        <button type="button" onclick="location.href='sugoroku?page=init'" class="btn btn-default">最初から</button>

    </div>
</body>
