<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Kosugi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/start.js"></script>
    <link rel="stylesheet" href="css/start.css">
    <title>START</title>
</head>
<body>
    <div class="container">
        <header>
            <h1>泥酔すごろく</h1>
        </header>
    </div>
    <div class="container">
        <form action="Sugoroku" method="post" class="row">
            <div class="form-group">
                <label>プレイヤー人数を選んでください</label>
                <div class="radio" onclick="playerChoice()">
                    <label id="1_lb">
                        <input type="radio" name="nPlayer" value="1" id="1"> 1人
                    </label>
                    <label id="2_lb">
                        <input type="radio" name="nPlayer" value="2" id="2"> 2人
                    </label>
                    <label id="3_lb">
                        <input type="radio" name="nPlayer" value="3" id="3"> 3人
                    </label>
                    <label id="4_lb">
                        <input type="radio" name="nPlayer" value="4" checked id="4"> 4人
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>コース選択</label>
                <div class="radio" onclick="squareChoice()">
                    <label id="2_ls">
                        <input type="radio" name="square" value="20" checked id="2"> 2時間飲み放題
                    </label>
                    <label id="3_ls">
                        <input type="radio" name="square" value="30" id="3"> 終電コース
                    </label>
                    <label id="4_ls">
                        <input type="radio" name="square" value="40" id="4"> 朝までコース
                </div>
            </div>
            <section class="information">
                <h2>ルール説明</h2>
                <div class="rule">
                    <p>・血中アルコール濃度20％に達する前にゴールしよう<br>
                    ・それぞれのキャラクターは一度だけ必殺技が使えるぞ<br>
                    ・キャラクターの特性を活かして一番最初にゴールしよう！</p>
                </div>
            </section>

            <button type="submit" name="page" value="start" class="btn btn-default">PLAY</button>

        </form>
    </div>
</body>
</html>