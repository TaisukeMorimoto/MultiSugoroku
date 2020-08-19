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
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/start.js"></script>

    <link rel="stylesheet" href="css/start.css">
    <title>START</title>
</head>
    <div class="container">

    	<header>
            <!--吹き出しはじまり-->
			<div class="balloon5">
			  <div class="faceicon">
				<img src="image/staff2.png" alt="...">
			  </div>
			  <div class="chatting">
			    <div class="says">

			    	<!-- アニメーションが表示されるid -->
					<div id="title"></div>

					<!-- 改行をする場合はstyleを追加します -->
					<div id="typed" style="white-space:pre"></div>

					いらっしゃいませ
			    </div>
			  </div>
			</div>
			<!--吹き出し終わり-->
		</header>

        <form action="Sugoroku" method="post" class="row">
            <div class="form-group">
                <label>何名様でお越しですか？</label>
                <div class="radio" onclick="playerChoice()">
                    <label id="1_lb">
                        <input type="radio" name="nPlayer" value="1" id="1"> 1名様
                    </label>
                    <label id="2_lb">
                        <input type="radio" name="nPlayer" value="2" id="2"> 2名様
                    </label>
                    <label id="3_lb">
                        <input type="radio" name="nPlayer" value="3" id="3"> 3名様
                    </label>
                    <label id="4_lb">
                        <input type="radio" name="nPlayer" value="4" checked id="4"> 4名様
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>コース選択</label>
                <div class="radio" onclick="squareChoice()">
                    <label id="2_ls">
                        <input type="radio" name="course" value="2hours" checked id="2"> 2時間飲み放題
                    </label>
                    <label id="3_ls">
                        <input type="radio" name="course" value="long" id="3"> 終電コース
                    </label>
                    <label id="4_ls">
                        <input type="radio" name="course" value="allday" id="4"> 朝までコース
                </div>
            </div>
            <section class="information">
                <h2>ルール説明</h2>
                <div class="rule">
                    <p>・血中アルコール濃度が20％に達する前にゴールしよう<br>
                    ・それぞれのキャラクターは必殺技と特性を持っているぞ<br>
                    ・キャラクターの特徴を活かして一番最初にゴールしよう！<br>
                    </p>
                </div>
                <p style="font-size:15px; font-weight: initial;">
                	※1名様の場合は必殺技は使えず、お酒を飲みながらどこまで先にすすめるかをランキング形式で競っていただきます。
                </p>
            </section>

            <button type="submit" name="page" value="play" class="btn btn-default">PLAY</button>

        </form>
    </div>
</body>
</html>