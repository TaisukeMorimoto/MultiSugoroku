<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />
<jsp:useBean id="rankingList" scope="session" class="model.SugorokuManager" />
<%@ page import="entity.Result" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%
	ArrayList<Result> resultList = (ArrayList<Result>) request.getAttribute("resultList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
    <link rel="stylesheet" href="css/ranking.css">
    <title>Ranking</title>
</head>
<body>

    <div class="container">
        <header>
            <h1 style="font-size: 35px;">ランキング</h1><br>
        </header>

        <!-- ランキングテーブル -->
        <table class="table table-dark">
			<tr><th>順位</th><th>スコア</th><th>id</th><th>名前</th><th>選択キャラクター</th><th>日付</th></tr>
		<%
			for (Result res : resultList){
					int rank = res.getRank();
					int id = res.getId();
					String name = res.getName();
					String date = res.getDate();
					int score = res.getScore();
					String select_character =res.getSelect_character();
		%>
		<tr><td><%=rank%></td><td><%=score%></td><td><%=id%></td>
		<td><%=name%></td><td><%=select_character%></td><td><%=date%></td></tr>
		<%} %>
		</table>

    <form action="Sugoroku" method="post">
		<button type="submit" name="page" value="init" class="btn btn-default">タイトルに戻る</button>
	</form>

    </div>


</body>
</html>