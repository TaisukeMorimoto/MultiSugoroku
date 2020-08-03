<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />

<!DOCUTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewpoint" content="width=device-width">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="js/selectChara.js"></script>
        <link rel="stylesheet" href="css/selectChara2.css">
        <title>キャラクター選択</title>
    </head>
    <body>
        <div class="container">
        <header>
        	<h2>プレイヤー<%=manager.getSelectPlayer()%>は、キャラクターを選択してください</h2>
        </header>
        <hr>
            <form action="Sugoroku" method="post">
            <div class="selection-group">
                <input id="suzuki" type="radio" name="chara" value="suzuki" checked>
                <label for="suzuki">
                    <div class="futatsuna"><span class="skill">必殺技
                    <br>飲んでなくない？wowwow⤴</span>
                        <img src="image/suzuki.jpg">
                        <p>アルハラの鈴木</p>
                    </div>
                </label>

                <input id="katada" type="radio" name="chara" value="katada">
                <label for="katada">
                    <div class="futatsuna"><span class="skill">必殺技<br>えぇ、酔ってないですよ～</span>
                        <img src="image/katada.jpg">
                        <p>千鳥足の堅田</p>
                    </div>
                </label>

                <input id="miyashita" type="radio" name="chara" value="miyashita">
                <label for="miyashita">
                    <div class="futatsuna">
                    	<span class="skill">
                    		必殺技<br>
                    		幹事挨拶『乾杯』<br><br>
                    	</span>
                        <img src="image/miyashita.jpg">
                        <p>幹事の宮下</p>
                    </div>
                </label>

                <input id="kano" type="radio" name="chara" value="kano">
                <label for="kano">
                    <div class="futatsuna"><span class="skill">必殺技<br>今日、この後デートあるんで♡</span>
                        <img src="image/kano.jpg">
                        <p>断り上手の狩野</p>
                    </div>
                </label>

                <input id="otake" type="radio" name="chara" value="otake">
                <label for="otake">
                    <div class="futatsuna"><span class="skill">必殺技<br>さよならは悲しい言葉じゃない</span>
                        <img src="image/otake.jpg">
                        <p>泣き上戸の大竹</p>
                    </div>
                </label>

                <input id="inoue" type="radio" name="chara" value="inoue">
                <label for="inoue">
                    <div class="futatsuna"><span class="skill">必殺技<br>大丈夫ですかー！？！？</span>
                        <img src="image/inoue.jpg">
                        <p>介抱の井上</p>
                    </div>
                </label>

            </div>
            <button type="submit" name="page" value="playDecision" class="btn btn-default">決定</button>
            <button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
            </form>
        </div>
    </body>
</html>