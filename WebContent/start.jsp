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

    <link rel="stylesheet" href="css/start7.css">
    <title>START</title>
</head>
    <div class="container">

    	<header>
            <!--吹き出しはじまり-->
			<div class="balloon5">
			  <div class="faceicon">
				<img src="image/tenin.png" alt="...">
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
           	<div class="selection-group">
			 	<label>何名様でお越しですか？</label><br>
			 	<input id="1" type="radio" name="nPlayer" value="1" class="radio" disabled>
            	<label for="1"><img src="image/numPlayer/player.1p.jpg" class="img1"></label>
            	<input id="2" type="radio" name="nPlayer" value="2" class="radio">
            	<label for="2"><img src="image/numPlayer/player.2p.jpg" class="img1"></label>
            	<input id="3" type="radio" name="nPlayer" value="3" class="radio">
            	<label for="3"><img src="image/numPlayer/player.3p.jpg" class="img1"></label>
            	<input id="4" type="radio" name="nPlayer" value="4" class="radio" checked>
            	<label for="4"><img src="image/numPlayer/player.4p.jpg" class="img1"></label>
            </div>

			 <div class="selection-group">
			 	 <br><label>どちらで飲みますか？</label><br>
			 	<input id="izakaya" type="radio" name="course" value="izakaya" class="radio" checked>
            	<label for="izakaya"><img src="image/course/course.izakaya.png" class="img2"></label>
            	<input id="bar" type="radio" name="course" value="bar" class="radio">
            	<label for="bar"><img src="image/course/course.bar.png" class="img2"></label>
            	<input id="home" type="radio" name="course" value="home" class="radio">
            	<label for="home"><img src="image/course/course.home.png" class="img2"></label>
            </div>


            <section class="information">
            <br>
                ルール説明
                <div class="rule">
                	<br><br>
                	サイコロを振って、出た目の数だけ進むことができるよ！　　
                	<br>
                	<img src="image/character/katada/katada.trans.png" class="img3">
                	<img src="image/dice/1.png" class="img4">
                	<img src="image/dice/2.png" class="img4">
                	<img src="image/dice/6.png" class="img4">
					<br><br>

					進んだ先のマスにはいろいろなアルコール度数のお酒が用意されているよ。<br>手に取ってしまったら飲むしかない！
					<br>
					<img src="image/character/inoue/inoue.trans.png" class="img3">
					<div class="img-text">
					<img  src="image/liquor/beer.png" class="img5">
					<p>+3%</p>
					</div>
					<div class="img-text">
					<img src="image/liquor/wine.png" class="img5">
					<p>+4%</p>
					</div>
					<div class="img-text">
					<img src="image/liquor/tequila.png" class="img5">
					<p>+8%</p>
					</div>
					<a style="font-size: 15px; font-weight:initial;">　←テキーラには気を付けて...</a>
                	<br><br>

                	ソフトドリンクの場合は、酔いを醒ますことができるぞ！
					<br>
					<div class="img-text">
					<img src="image/liquor/cola.png" class="img5">
					<a>-1%</a>
					</div>
					<div class="img-text">
					<img src="image/liquor/ryokucha.png" class="img5">
					<a>-2%</a>
					</div>
					<div class="img-text">
					<img src="image/liquor/water.png" class="img5">
					<a>-1%</a>
					</div>
					<div class="img-text">
					<img src="image/liquor/ukon.png" class="img5">
					<a>-1%</a>
					</div>
                	<br><br>

                	お酒を飲むとだんだん酔っぱらってしまうよ。<br>完全につぶれちゃうとGAME OVER !!
                	<br>
                	<img src="image/character/miyashita/miyashita.trans1.png" class="img5">
                	<img src="image/character/miyashita/miyashita.trans2.png" class="img5">
                	<img src="image/character/miyashita/miyashita.trans3.png" class="img5">
                	<img src="image/character/miyashita/miyashita.trans4.png" class="img5">
                	<a style="font-size: 20px; font-weight:initial;">Game Over →</a>
                	<img src="image/character/miyashita/miyashita.trans5.png" class="img5">
                	<br><br>

					それぞれのキャラクターは<p class="enp">必殺技</p>と<p class="enp">特性</p>を持っているよ。<br>上手に使ってつぶれる前にゴールまで先にたどり着こう！
					<br>
					<img src="image/character/kano/kano.trans.png" class="img3">
					<img src="image/character/suzuki/suzuki.trans.png" class="img3">
					<img src="image/character/otake/otake.trans.png" class="img3">
					<br><br>
				</div>
            </section>
            <section class="information">
            <div class="rule">

					<br>
					一人プレイの場合はエンドレスモードだよ。<br>お酒をひたすら飲みながらどこまで先に進めるかにチャレンジ！
					<br>全国の大酒豪たちとランキング形式で頂点を目指せ！！


					<br><br>
			</div>
            </section>

            <button type="submit" name="page" value="play" class="btn btn-default">PLAY</button>

        </form>
    </div>
</body>
</html>