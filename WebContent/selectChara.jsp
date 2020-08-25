<%@page import="entity.EachCharacter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />
<jsp:useBean id="allCharacterList" scope="session" class="model.SugorokuManager" />

<!DOCUTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewpoint" content="width=device-width">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="js/selectChara.js"></script>
        <link rel="stylesheet" href="css/selectChara3.css">
        <title>SELECT</title>
    </head>
    <body>

        <div class="container">
		<header>
			<div class="row">
        	<div class="col-sm-7">
	            <!--吹き出しはじまり-->
				<div class="balloon5">
				  <div class="faceicon">
					<img src="image/staff2.png" alt="...">
				  </div>
				  <div class="chatting">
				    <div class="says">
						プレイヤー<%=manager.getSelectPlayer()%>は、キャラクターを選択してください
				    </div>
				  </div>
				</div>
				<!--吹き出し終わり-->
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3">
				<button type="submit" name="page" value="playDecision" class="btn btn-default" form="selectChara">決定</button>
			</div>
			<div class="col-sm-1"></div>
			</div>
		</header>


			<form action="Sugoroku" method="post" id="selectChara">
            <div class="selection-group">

            	<%
            		int nChara = manager.getAllCharacterList().size();
            		for (EachCharacter chara : manager.getAllCharacterList() ){
	            		String name = chara.getName();
	            		String enName = chara.getEnName();
	            		String type = chara.getType();
	            		int specialitySquares = chara.getSpecialitySpuares();
	            		int specialityAlc = chara.getSpecialityAlc();
	            		String sqChar =  "" + specialitySquares;
	            		if (specialitySquares >= 0) {
		            		sqChar = "+" + specialitySquares;
	            		}
	            		String alcChar = "" + specialityAlc;
	            		if (specialityAlc >= 0) {
	            			alcChar = "+" + specialityAlc;
	            		}
	            		String imagePath = "image/character/" + enName + "/" + enName + "1.jpg";
            	%>
                <input id=<%=enName%> type="radio" name="chara" value=<%=enName%> checked>
                <label for=<%=enName%>>
                    <div class="futatsuna"><span class="skill">
                    <%=name%>
                    <p style="font-size:18px; font-weight: initial; text-align: left;">
                    	<br ><%=type%>タイプ<br>
                    	<br>特性<br>マス：　<%=sqChar%>マス<br>アルコール：　<%=alcChar%>%
                    </p></span>
                        <img src=<%=imagePath%>>
                    </div>
                </label>
               	<% } %>

            </div><br><br>
            <button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
            </form>
        </div>
    </body>
</html>