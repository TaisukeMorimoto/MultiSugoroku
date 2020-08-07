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
    <link rel="stylesheet" href="css/main.css">
    <title>MAP</title>
</head>
<body>
    <div class="container">
        <header>
        	<div class="row">
        	<div class="col-sm-1">
		   		<%
		   			String imagePath0 = "image/" + manager.getPlayerList().get(manager.getTurn()).getEnName() + ".jpg";
		   			int turn = manager.getPlayerList().get(manager.getTurn()).getCount() + 1;
					String name0 = manager.getPlayerList().get(manager.getTurn()).getName();
		   		%>
		   		<img src=<%=imagePath0%> class="img-icon" alt="...">
        	</div>
        	<div class="col-sm-6">
            	<h3>　　<%=turn%><a>ターン目</a></h3>
            	<h3>　　<%=name0%>さん<a>の番です</a></h3>
			</div>

                <div class="col-sm-4">
                    <%
                    	int nowRest = manager.getPlayerList().get(manager.getTurn()).getNowRest();
                    	boolean canUltimate = manager.getPlayerList().get(manager.getTurn()).getCanUltimate();
                    %>
					<%
                        if((nowRest == 0) && (canUltimate)){
                            out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-default'>必殺技</button></form>");
                        } else {
                            out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-default' disabled>必殺技</button></form>");
                        }
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
   	<div class="row" style="color: black">
   		<!-- player1 -->
   		<%
			int arrayNumber = 0;
   			String imagePath = "image/" + manager.getPlayerList().get(arrayNumber).getEnName() + ".jpg";
   			String name = manager.getPlayerList().get(arrayNumber).getName();
   			String ultimateName = manager.getPlayerList().get(arrayNumber).getUltimateName();
   			String ultimateText = manager.getPlayerList().get(arrayNumber).getUltimateText();
   			String specialityText = manager.getPlayerList().get(arrayNumber).getSpecialityText();
   			int location = manager.getPlayerList().get(arrayNumber).getLocation();
   			int bloodAlcLv = manager.getPlayerList().get(arrayNumber).getBloodAlcLv();
   			float alcRatio = bloodAlcLv*100/manager.getLimitAlcLv();
   			float locRatio = location*100/(manager.getSQUARE()-1);
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
					<div class="p-3">
					  <!-- 1個目のタブ -->
					  <div class="tab-content">
					    <div id="status1" class="tab-pane active">
				          <div class="card-body">
				            <h4 class="card-title"><%=name%></h4>
				            <div class="card-text">
						        現在地：　<%=location%>/<%=manager.getSQUARE()-1%><br>
						        <div class="progress">
  									<div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar"
  									aria-valuenow=<%=locRatio%>
  									aria-valuemin="0" aria-valuemax="1"
  									style="width: <%=locRatio%>%">
  									</div>
								</div>
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
					    <div id="ultimate1" class="tab-pane">
					    	<h4 class="card-title"><br><%=ultimateName%></h4>
							<div class="card-text"><%=ultimateText%></div><br><br>
					    </div>
					    <!-- 3個目のタブ -->
					    <div id="speciality1" class="tab-pane">
					    	<h4 class="card-title"><br>特性</h4>
							<div class="card-text"><%=specialityText%><br><br><br></div>
					    </div>
					  </div>
					  <!-- タブのナビゲーション -->
					  <ul class="nav nav-pills justify-content-end" >
					    <li class="nav-item pill-1"">
					      <a href="#status1" class="nav-link active" data-toggle="tab">ステータス</a>
					    </li>
					    <li class="nav-item pill-2">
					      <a href="#speciality1" class="nav-link" data-toggle="tab">特性</a>
					    </li>
					    <li class="nav-item pill-3">
					      <a href="#ultimate1" class="nav-link" data-toggle="tab">必殺技</a>
					    </li>
					  </ul>
					 </div>
		        </div>
		      </div>
		    </div>
	    </div>
   		<!-- player2 -->
   		<%
			arrayNumber = 1;
   			imagePath = "image/" + manager.getPlayerList().get(arrayNumber).getEnName() + ".jpg";
   			name = manager.getPlayerList().get(arrayNumber).getName();
   			ultimateName = manager.getPlayerList().get(arrayNumber).getUltimateName();
   			ultimateText = manager.getPlayerList().get(arrayNumber).getUltimateText();
   			specialityText = manager.getPlayerList().get(arrayNumber).getSpecialityText();
   			location = manager.getPlayerList().get(arrayNumber).getLocation();
   			bloodAlcLv = manager.getPlayerList().get(arrayNumber).getBloodAlcLv();
   			alcRatio = bloodAlcLv*100/manager.getLimitAlcLv();
   			locRatio = location*100/(manager.getSQUARE()-1);
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
					<div class="p-3">
					  <!-- 1個目のタブ -->
					  <div class="tab-content">
					    <div id="status2" class="tab-pane active">
				          <div class="card-body">
				            <h4 class="card-title"><%=name%></h4>
				            <div class="card-text">
						        現在地：　<%=location%>/<%=manager.getSQUARE()-1%><br>
						        <div class="progress">
  									<div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar"
  									aria-valuenow=<%=locRatio%>
  									aria-valuemin="0" aria-valuemax="1"
  									style="width: <%=locRatio%>%">
  									</div>
								</div>
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
					    <div id="ultimate2" class="tab-pane">
					    	<h4 class="card-title"><br><%=ultimateName%></h4>
							<div class="card-text"><%=ultimateText%></div><br><br>
					    </div>
					    <!-- 3個目のタブ -->
					    <div id="speciality2" class="tab-pane">
					    	<h4 class="card-title"><br>特性</h4>
							<div class="card-text"><%=specialityText%><br><br><br></div>
					    </div>
					  </div>
					  <!-- タブのナビゲーション -->
					  <ul class="nav nav-pills justify-content-end" >
					    <li class="nav-item pill-1"">
					      <a href="#status2" class="nav-link active" data-toggle="tab">ステータス</a>
					    </li>
					    <li class="nav-item pill-2">
					      <a href="#speciality2" class="nav-link" data-toggle="tab">特性</a>
					    </li>
					    <li class="nav-item pill-3">
					      <a href="#ultimate2" class="nav-link" data-toggle="tab">必殺技</a>
					    </li>
					  </ul>
					 </div>
		        </div>
		      </div>
		    </div>
	    </div>
   		<!-- player3 -->
   		<%
			arrayNumber = 2;
   			imagePath = "image/" + manager.getPlayerList().get(arrayNumber).getEnName() + ".jpg";
   			name = manager.getPlayerList().get(arrayNumber).getName();
   			ultimateName = manager.getPlayerList().get(arrayNumber).getUltimateName();
   			ultimateText = manager.getPlayerList().get(arrayNumber).getUltimateText();
   			specialityText = manager.getPlayerList().get(arrayNumber).getSpecialityText();
   			location = manager.getPlayerList().get(arrayNumber).getLocation();
   			bloodAlcLv = manager.getPlayerList().get(arrayNumber).getBloodAlcLv();
   			alcRatio = bloodAlcLv*100/manager.getLimitAlcLv();
   			locRatio = location*100/(manager.getSQUARE()-1);
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
					<div class="p-3">
					  <!-- 1個目のタブ -->
					  <div class="tab-content">
					    <div id="status3" class="tab-pane active">
				          <div class="card-body">
				            <h4 class="card-title"><%=name%></h4>
				            <div class="card-text">
						        現在地：　<%=location%>/<%=manager.getSQUARE()-1%><br>
						        <div class="progress">
  									<div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar"
  									aria-valuenow=<%=locRatio%>
  									aria-valuemin="0" aria-valuemax="1"
  									style="width: <%=locRatio%>%">
  									</div>
								</div>
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
					    <div id="ultimate3" class="tab-pane">
					    	<h4 class="card-title"><br><%=ultimateName%></h4>
							<div class="card-text"><%=ultimateText%></div><br><br>
					    </div>
					    <!-- 3個目のタブ -->
					    <div id="speciality3" class="tab-pane">
					    	<h4 class="card-title"><br>特性</h4>
							<div class="card-text"><%=specialityText%><br><br><br></div>
					    </div>
					  </div>
					  <!-- タブのナビゲーション -->
					  <ul class="nav nav-pills justify-content-end" >
					    <li class="nav-item pill-1"">
					      <a href="#status3" class="nav-link active" data-toggle="tab">ステータス</a>
					    </li>
					    <li class="nav-item pill-2">
					      <a href="#speciality3" class="nav-link" data-toggle="tab">特性</a>
					    </li>
					    <li class="nav-item pill-3">
					      <a href="#ultimate3" class="nav-link" data-toggle="tab">必殺技</a>
					    </li>
					  </ul>
					 </div>
		        </div>
		      </div>
		    </div>
	    </div>

	 </div>
	 </div>
	<div class="container">
    <form action="Sugoroku" method="post">
		<button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
	</form>
	</div>
</body>
</html>