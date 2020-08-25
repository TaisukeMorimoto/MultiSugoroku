<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="js/main.js"></script>
    <link rel="stylesheet" href="css/main1p.css">
    <title>MAP</title>
</head>
<body>
    <div class="container">
        <header>
        	<div class="row">
		   		<%
	   				/* アルコールレベルのジャッジ */
	   				String alcStatus0 = "";
	   				if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 5) {
	   					alcStatus0 = "1";
	   				} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 10){
	   					alcStatus0 = "2";
	   				} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 15) {
	   					alcStatus0 = "3";
	   				} else {
	   					alcStatus0 = "4";
	   				}

	   				String enName = manager.getPlayerList().get(manager.getTurn()).getEnName();
	   				String imagePath0 = "image/character/" + enName + "/" + enName + alcStatus0 + ".jpg";
		   			int turn = manager.getPlayerList().get(manager.getTurn()).getCount() + 1;
					String name0 = manager.getPlayerList().get(manager.getTurn()).getName();
		   		%>
        	<div class="col-sm-6">
            	<h3>　　<%=turn%><a>ターン目</a></h3>
			</div>

                <div class="col-sm-4">
                    <%
                    	int nowRest = manager.getPlayerList().get(manager.getTurn()).getNowRest();
                    	boolean canUltimate = manager.getPlayerList().get(manager.getTurn()).getCanUltimate();
                    %>
                    <%
                        if(nowRest == 0){
                            out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>サイコロをふる</button></form>");
                        }else {
                        	out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>次のプレイヤーへ</button></form></div>");
                        }
					%>
		        	<div class="col-sm-1"></div>
                </div>
            </div>
        </header>
    </div>




	<div class="container">
   		<!-- player -->
   		<%
   			for (int arrayNumber=0; arrayNumber<manager.getnPlayer(); arrayNumber++){
   				/* アルコールレベルのジャッジ */
   				String alcStatus = "";
   				if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 5) {
   					alcStatus = "1";
   				} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 10){
   					alcStatus = "2";
   				} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() < 15) {
   					alcStatus = "3";
   				} else {
   					alcStatus = "4";
   				}
   				String enName1 = manager.getPlayerList().get(manager.getTurn()).getEnName();
   				String imagePath = "image/character/" + enName1 + "/" + enName1 + alcStatus + ".jpg";
	   			String name = manager.getPlayerList().get(arrayNumber).getName();
	   			String ultimateName = manager.getPlayerList().get(arrayNumber).getUltimateName();
	   			String ultimateText = manager.getPlayerList().get(arrayNumber).getUltimateText();
	   			String specialityText = manager.getPlayerList().get(arrayNumber).getSpecialityText();
	   			int location = manager.getPlayerList().get(arrayNumber).getLocation();
	   			int bloodAlcLv = manager.getPlayerList().get(arrayNumber).getBloodAlcLv();
	   			float alcRatio = bloodAlcLv*100/manager.getLimitAlcLv();
	   			float locRatio = location*100/(manager.getSQUARE()-1);
	   			String speciality = "speciality" + (arrayNumber+1);
	   			String ultimate = "ultimate" + (arrayNumber+1);
	   			String status = "status" + (arrayNumber+1);
	   			String shSpeciality = "#speciality" + (arrayNumber+1);
	   			String shUltimate = "#ultimate" + (arrayNumber+1);
	   			String shStatus = "#status" + (arrayNumber+1);
   		%>
   		<div class="card mb-3" style="max-width: 1000px; background-color: rgb(22, 44, 65)">
	      <div class="row no-gutters" style="color: white;">
	        <div class="col-sm-3">
	          <img src=<%=imagePath%> class="img-main" style="width:250px; height:250px;" alt="...">
	        </div>
	        <div class="col-sm-1"></div>
	        <div class="col-sm-8">
				<div class="p-3">
				  <!-- 1個目のタブ -->
				  <div class="tab-content">
				    <div id=<%=status%> class="tab-pane active">
			          <div class="card-body">
			            <h2 class="card-title"><%=name%></h2>
			            <div class="card-text">
					        現在地：　<%=location%><br>
					        <br>血中アルコール濃度：　<%=bloodAlcLv%>%<br>
					        <div class="progress">
 									<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar"
 									aria-valuenow=<%=alcRatio%>
 									aria-valuemin="0" aria-valuemax="1"
 									style="width: <%=alcRatio%>%">
 									</div>
							</div>
			            </div>
			          </div>
				    </div>
				    <!-- 2個目のタブ -->
				    <div id=<%=speciality%> class="tab-pane">
				    	<h2 class="card-title">特性</h2>
						<div class="card-text" style="font-weight: initial;"><%=specialityText%></div>
				    </div>
				  </div><br>
				  <!-- タブのナビゲーション -->
				  <ul class="nav nav-pills justify-content-end" >
				    <li class="nav-item pill-1">
				      <a href=<%=shStatus%> class="nav-link active" data-toggle="tab">ステータス</a>
				    </li>
				    <li class="nav-item pill-2">
				      <a href=<%=shSpeciality%> class="nav-link" data-toggle="tab">特性</a>
				    </li>
				  </ul>
				 </div>
	        </div>
	      </div>
	    <% } %>
	 </div><br><br>
	 </div>


	<div class="container">
	<div class="row">
		<div class="col-sm-9">

		</div>
		<div class="col-sm-3">
			<form action="Sugoroku" method="post">
				<button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
			</form>
		</div>
	</div>
	</div>

</body>
</html>