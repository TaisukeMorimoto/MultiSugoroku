<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sugorokubean" scope="session" class="practice.SugorokuBean" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"><title>すごろく</title>
</head>
<body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<!-- header -->
  <header>
  	<h1 class="headline">
      <a>泥酔すごろく</a>
    </h1>
  </header><br><br>

  <div class="container">

<div class="card-deck" style="width:30rem text-align: center">
  <div class="card text-white bg-dark mb-3" style="width: 8rem;">
  <div class="card-body">
    <h4 class="card-title">操作</h4><br>
    <p class="card-text" style="text-align: left">すごろくを振ってゴールまで辿り着こう！<br>飲み過ぎには気をつけて...</p><br><br>
    <a href="Sugoroku?page=event" class="btn btn-primary btn-lg">サイコロをふる</a><br><br>
    <a href="Sugoroku?page=init" class="btn btn-primary btn-sm">最初から</a>
  </div>
  </div>

   <div class="card text-white bg-dark mb-3" style="width: 8rem;">
   <div class="card-body">
   <h5 class="card-title">ステータス</h5>
	<br><br>
	<div class="card-text text-white">

	<table class="table" style="color: white">
	  <tr><th>進捗</th><th><%=sugorokubean.getLocation() %>/<%=sugorokubean.getSQUARE()-1 %></th></tr>
  	  <tr><td>回数</td><td><%=sugorokubean.getCount()%></td></tr>
  	  <tr><td>血中アルコール濃度</td><td><%=sugorokubean.getBloodAlcLv()%></td></tr>

	</table>
	</div>
	</div>
	</div>

   	<div class="card border-primary mb-3" style="max-width: 14rem;">
   	<div class="card-body text-primary">
   	<h5 class="card-title">今の状態</h5>
 	<%
 		if (sugorokubean.getBloodAlcLv() < 5){
 			out.println("<img class='card-img-top' src='images/0-5.jpg' alt='元気' width='40%' height='40%'>");
 			out.println("<div class='card-body'><p class='card-text'>いっぱい飲むぞ〜</p></div>");
 		} else if ((sugorokubean.getBloodAlcLv() >= 5) && (sugorokubean.getBloodAlcLv() < 10)) {
 			out.println("<img class='card-img-top' src='images/5-10.png' alt='やや酔っ払い' width='40%' height='40%'>");
 			out.println("<div class='card-body'><p class='card-text'>楽しいなあ</p></div>");
 		} else if ((sugorokubean.getBloodAlcLv() >= 10) && (sugorokubean.getBloodAlcLv() < 15)) {
 			out.println("<img class='card-img-top' src='images/10-15.jpg' alt='酔っ払い' width='40%' height='40%'>");
 			out.println("<div class='card-body'><p class='card-text'>ちょっとやばいかも…</p></div>");
 		} else if ((sugorokubean.getBloodAlcLv() >= 15) && (sugorokubean.getBloodAlcLv() < 20)) {
 			out.println("<img class='card-img-top' src='images/15-20.jpg' alt='やばい酔っ払い' width='40%' height='40%'>");
 			out.println("<div class='card-body'><p class='card-text'>吐く... マジ吐く...</p></div>");
 		}
 	%>
   	</div>
 	</div>
</div>

<div class="box">
  <img class="box_imageLeft"  src='images/startflag3.png' alt='start' width='100px' height='100px'>
  <img class="box_imageRight" src='images/goalflag4.jpg' alt='goal' width='130px' height='130px'>
</div><br><br>

<table class="table" style="text-align: center">
	<tbody>
		<tr>
			<%
			out.println("<tr>");
				for (int i = 0; i <= sugorokubean.getSQUARE() -1; i++) {
					if (sugorokubean.getBuf(i)) {
						out.println("<td><img src='images/beer3.png' alt='goal' width='80px' height='70px'></td>");
					} else {
						out.println("<td></td>");
					}
				}
			out.println("</tr>");
			%>
		</tr>
	</tbody>
</table>



</div>

</body>

<footer>
 	  <div class="footer">made by T.morimoto, S.doumoto and R.miyashita</div>
</footer>
</html>