<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/ultimate2.css">
    <title>ULTIMATE</title>
</head>
<body>
 <div class="container">
     <header>
     <%
     	String ultimateName = manager.getPlayerList().get(manager.getTurn()).getUltimateName();
     	String ultimateText = manager.getPlayerList().get(manager.getTurn()).getUltimateText();
     	String name = manager.getPlayerList().get(manager.getTurn()).getName();
     	String target1 = manager.getPlayerList().get(manager.getTurn()).getUltimate1Target();
     	String target2 = manager.getPlayerList().get(manager.getTurn()).getUltimate2Target();
		String enName = manager.getPlayerList().get(manager.getTurn()).getEnName();
		String imagePath1 = "image/character/" + enName + "/" + enName + "1.jpg";
     %>
         <h1><%=name%>の必殺技</h1>
     </header>

	<div class="card mb-3" style="max-width: 700px; color:black;">
      <div class="row no-gutters">
        <div class="col-lg-3">
          <img src=<%=imagePath1%> class="img-icon" alt="...">
        </div>
        <div class="col-lg-9">
          <div class="card-body">
            <h4 class="card-title"><%=ultimateName%></h4>
            <p style="font-size:20px; font-weight:initial;"><%=ultimateText%></p>
          </div>
        </div>
      </div>
    </div>
    </div>
<div class="container">
    <form action="Sugoroku" method="post" class="form_group">
     <%
    	System.out.println(target1);
    	System.out.println(target2);
    	if(target1.equals("select") || target2.equals("select")){
    		out.print("<div class='form-group'>");
    		out.print("<label>プレイヤーを選択してください。</label>");
    		out.print("<div class='radio' onclick='playerChoice()'>");
    		for (int i=0; i<manager.getnPlayer(); i++){
    			if(!(manager.getTurn()==i)){
    				out.print("<label><input type='radio' name='select' value='");
    				out.print(i+1);
    				out.print("'>");
    				out.print(manager.getPlayerList().get(i).getName());
    				out.print("</label>");
    			}
    		}
    		out.print("</div></div>");
    	}
    %>


       <button type="submit" name="page" value="ultimateDecision" class="btn btn-default">発動！</button>
       <button type="submit" name="page" value="backFromUltimate" class="btn btn-default">戻る</button>
   </form>
</div>
</body>
</html>