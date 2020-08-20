<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="manager" scope="session" class="model.SugorokuManager" />
<%@ page import="entity.Liquor" %>

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
    <link rel="stylesheet" href="css/main5.css">
    <title>MAP</title>
</head>
<body>
	<!-- 各変数の取得 -->
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

		/* 現在のプレイヤーの各種情報 */
		/* 画像url */
		String imagePath0 = "image/" + manager.getPlayerList().get(manager.getTurn()).getEnName() + alcStatus0 + ".jpg";
		/* ターン数 */
		int turn = manager.getPlayerList().get(manager.getTurn()).getCount() + 1;
		/* プレイヤー名 */
		String name0 = manager.getPlayerList().get(manager.getTurn()).getName();
		/* 休みかどうか */
       	int nowRest = manager.getPlayerList().get(manager.getTurn()).getNowRest();
		/* 必殺技が使えるかどうか */
       	boolean canUltimate = manager.getPlayerList().get(manager.getTurn()).getCanUltimate();
	%>

    <div class="container">
    	<div class="row">



    		<!-- 操作画面 -->
         	<div class="col-sm-8">

         		<div class="row" style="padding-top:0px; padding-bottom:0px;">
         			<div class="col-sm-1">
					</div>
     		   		<div class="col-sm-3">
		            	<%=turn%><a>ターン目</a>
		            	<br><br>
		            	<h5><%=name0%>さん</h5>
		            </div>
					<div class="col-sm-1">
		            	<img src=<%=imagePath0%> class="now-player-icon" alt="...">
					</div>
					<div class="col-sm-2">
					</div>
					<div class="col-sm-4">
		                <%
		                	/* サイコロをふるボタンの表示 */
			                if(nowRest == 0){
			                    out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>サイコロをふる</button></form>");
			                }else {
			                	out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='dice' class='btn btn-default'>次のプレイヤーへ</button></form>");
			                }
						%>
						<%
							/* 必殺技ボタンの表示 */
			                if((nowRest == 0) && (canUltimate)){
			                    out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-ultimate'>必殺技</button></form>");
			                } else {
			                    out.print("<form action='Sugoroku' method='post'><button type='submit' name='page' value='ultimate' class='btn btn-disabled' disabled='disabled'>必殺技</button></form>");
			                }
		                %>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

         		<!-- マス目表示画面 -->
         		<div class="plot-icon">
	       			<img src=image/map.25.png class="img-squares" alt="...">
	       			<div class="start1"><img src=image/miyashita1.jpg class="img-squares-player"></div>
	       			<div class="start2"><img src=image/katada1.jpg class="img-squares-player"></div>
	       			<div class="start3"><img src=image/suzuki1.jpg class="img-squares-player"></div>
	       			<div class="start4"><img src=image/otake1.jpg class="img-squares-player"></div>

					<!-- 各マスに酒画像を表示 -->
	       			<%
	       				int[] x = {2,3,4,5,5,4,3,2,1,1,2,3,4,5,5,4,3,2,1,1,2,3,4,5,5,5,5};
	       				int[] y = {1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,5,5};
	       				int num = 0;
	       				for (Liquor liquor : manager.getSugoroku().getLiquorList()){
	       					String liquorEnName = liquor.getLiquorEnName();
	       					String liquorPath = "image/" + liquorEnName + ".png";
	       					System.out.println(num);
	       					String liquorClass = "liquor" +  String.valueOf(y[num]) + "-" + String.valueOf(x[num]);
	       					num++;
	       			%>
	       			<div class=<%=liquorClass%>><img src=<%=liquorPath%> class="img-squares-liquor"></div>
	       			<% } %>
	       		</div>
         	</div>


         	<!-- プレイヤー状態表示画面 -->
         	<div class="col-sm-4">
         		 <!-- それぞれのプレイヤーの状態を各変数として取得 -->
		         <%
		   			for (int arrayNumber=0; arrayNumber<manager.getnPlayer(); arrayNumber++){
		   				/* アルコールレベルのジャッジ */
		   				String alcStatus = "";
		   				if (manager.getPlayerList().get(arrayNumber).getBloodAlcLv() < 5) {
		   					alcStatus = "1";
		   				} else if (manager.getPlayerList().get(arrayNumber).getBloodAlcLv() < 10){
		   					alcStatus = "2";
		   				} else if (manager.getPlayerList().get(arrayNumber).getBloodAlcLv() < 15) {
		   					alcStatus = "3";
		   				} else {
		   					alcStatus = "4";
		   				}
			   			String imagePath = "image/" + manager.getPlayerList().get(arrayNumber).getEnName() + alcStatus + ".jpg";
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
				<div class="card mb-4" style="color: black; line-height:1rem">
			      <div class="row no-gutters">
			        <div class="col-sm-3">
			          <img src=<%=imagePath%> class="img-each-player" alt="...">
			        </div>
			        <div class="col-sm-1"></div>
			        <div class="col-sm-8">

			        <div class="p-3">
					  <!-- 1個目のタブ -->
					  <div class="tab-content">
					    <div id=<%=status%> class="tab-pane active">
				            <div class="title"><%=name%></div>
				            <div class="card-body">
				            <div class="card-text">
<%-- 						        現在地：　<%=location%>/<%=manager.getSQUARE()-1%><br>
						        <div class="progress">
  									<div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar"
  									aria-valuenow=<%=locRatio%>
  									aria-valuemin="0" aria-valuemax="1"
  									style="width: <%=locRatio%>%">
  									</div>
								</div> --%>
						        血中アルコール濃度：　<%=bloodAlcLv%>/20 %<br>
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
					    <div id=<%=ultimate%> class="tab-pane">
					    	<div class="card-title"><%=ultimateName%></div>
							<div class="card-text" style="font-weight: initial;"><%=ultimateText%></div>
					    </div>
					    <!-- 3個目のタブ -->
					    <div id=<%=speciality%> class="tab-pane">
					    	<div class="card-title">特性</div>
							<div class="card-text" style="font-weight: initial;"><%=specialityText%></div>
					    </div>
					  </div>
					  <!-- タブのナビゲーション -->
					  <ul class="nav nav-pills justify-content-end" >
					    <li class="nav-item pill-1">
					      <a href=<%=shStatus%> class="nav-link active" data-toggle="tab">ステータス</a>
					    </li>
					    <li class="nav-item pill-2">
					      <a href=<%=shSpeciality%> class="nav-link" data-toggle="tab">特性</a>
					    </li>
					    <li class="nav-item pill-3">
					      <a href=<%=shUltimate%> class="nav-link" data-toggle="tab">必殺技</a>
					    </li>
					  </ul>
					 </div>

			        </div>
			      </div>
			    </div>
	    	<% } %>
         	</div>
         </div>

         <div class="row">
         	<div class="col-sm-10"></div>
         	<div class="col-sm-2">
	    		<form action="Sugoroku" method="post">
					<button type="submit" name="page" value="init" class="btn btn-default">タイトルに戻る</button>
				</form>
			</div>
		</div>

    </div>
</body>
</html>


