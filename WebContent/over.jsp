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
    <script src="css/map.js"></script>
    <link rel="stylesheet" href="css/over.css">
    <title>EVENT</title>
</head>
<body>
<div class="container">
     <header>
         <h4><%=manager.getPlayerList().get(manager.getTurn()).getName()%>さん　GAMEOVERです</h4>
     </header>
   	<div class="card mb-3" style="max-width: 700px;" >
	  <div class="row no-gutters">
	    <div class="col-md-4">
	    <%
	    	String imagePath = "image/" +  manager.getPlayerList().get(manager.getTurn()).getEnName() + ".jpg";
	        out.print("<img class='card-img' src='");
	        out.print(imagePath);
	        out.print("'>");
	    %>
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h2 class="card-title" style="color:black;">最終結果</h2>
	        <p class="card-text" style="color:black;">
            <table class='table'>
                <tr><th>進捗</th><th><%=manager.getPlayerList().get(manager.getTurn()).getLocation()%>/
                					<%=manager.getSQUARE()-1%></th></tr>
                <tr><td>血中アルコール濃度</td><td><%=manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv()%>％</td></tr>
            </table>
	        </p>
	        <p class="card-text"><small class="text-muted">血中アルコール濃度が限界です。</small></p>
	      </div>
	    </div>
	  </div>
	</div>
	<form action="Sugoroku" method="post" class='row'>
		<button type="submit" name="page" value="backFromOver" class="btn btn-default">トイレにこもる</button>
	</form>
</div>
</body>
