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
   			String imagePath1 = "image/" + manager.getPlayerList().get(0).getEnName() + ".jpg";
   			String name1 = manager.getPlayerList().get(0).getName();
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath1%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
					<div class="p-3">
					  <!-- 1個目のタブ -->
					  <div class="tab-content">
					    <div id="status" class="tab-pane active">
				          <div class="card-body">
				            <h4 class="card-title"><%=name1%></h4>
				            <div class="card-text">
				            	<table class="table">
						        	<tr>
						        		<th>現在地</th>
						        		<th>血中アルコール濃度</th>
						        	</tr>
						        	<tr>
						        		<td><%=manager.getPlayerList().get(0).getLocation()%>/<%=manager.getSQUARE()-1%></td>
						        		<td><%=manager.getPlayerList().get(0).getBloodAlcLv()%>%</td>
						        	</tr>
						        </table>
				            </div>
				          </div>
					    </div>
					    <!-- 2個目のタブ -->
					    <div id="ultimate" class="tab-pane">
					    	<h4 class="card-title"><br><%=manager.getPlayerList().get(0).getUltimateName()%></h4>
							<div class="card-text"><br><%=manager.getPlayerList().get(0).getUltimateText()%></div>
					    </div>
					  </div>
					  <!-- タブを二個作る -->
					  <ul class="nav nav-tabs">
					    <li class="nav-item">
					      <a href="#status" class="nav-link active" data-toggle="tab">ステータス</a>
					    </li>
					    <li class="nav-item">
					      <a href="#ultimate" class="nav-link" data-toggle="tab">必殺技</a>
					    </li>
					  </ul>
					 </div>
		        </div>
		      </div>
		    </div>
	    </div>
	    <!-- player2 -->
   		<%
   			String imagePath2 = "image/" + manager.getPlayerList().get(1).getEnName() + ".jpg";
   			String name2 = manager.getPlayerList().get(1).getName();
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath2%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
		          <div class="card-body">
		            <h4 class="card-title"><%=name2%></h4>
		            <div class="card-text">
		            	<table class="table">
				        	<tr>
				        		<th>現在地</th>
				        		<th>血中アルコール濃度</th>
				        	</tr>
				        	<tr>
				        		<td><%=manager.getPlayerList().get(1).getLocation()%>/<%=manager.getSQUARE()-1%></td>
				        		<td><%=manager.getPlayerList().get(1).getBloodAlcLv()%>%</td>
				        	</tr>
				        </table>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
	    </div>
	    <!-- player3 -->
   		<%
   			String imagePath3 = "image/" + manager.getPlayerList().get(2).getEnName() + ".jpg";
   			String name3 = manager.getPlayerList().get(2).getName();
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath3%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
		          <div class="card-body">
		            <h4 class="card-title"><%=name3%></h4>
		            <div class="card-text">
		            	<table class="table">
				        	<tr>
				        		<th>現在地</th>
				        		<th>血中アルコール濃度</th>
				        	</tr>
				        	<tr>
				        		<td><%=manager.getPlayerList().get(2).getLocation()%>/<%=manager.getSQUARE()-1%></td>
				        		<td><%=manager.getPlayerList().get(2).getBloodAlcLv()%>%</td>
				        	</tr>
				        </table>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
	    </div>
		<!-- player4 -->
   		<%
   			String imagePath4 = "image/" + manager.getPlayerList().get(3).getEnName() + ".jpg";
   			String name4 = manager.getPlayerList().get(3).getName();
   		%>
	   	<div class="col-sm-6">
			<div class="card mb-3" style="max-width: 500px;">
		      <div class="row no-gutters">
		        <div class="col-sm-3">
		          <img src=<%=imagePath4%> class="img-main" alt="...">
		        </div>
		        <div class="col-sm-1"></div>
		        <div class="col-sm-8">
		          <div class="card-body">
		            <h4 class="card-title"><%=name4%></h4>
		            <div class="card-text">
		            	<table class="table">
				        	<tr>
				        		<th>現在地</th>
				        		<th>血中アルコール濃度</th>
				        	</tr>
				        	<tr>
				        		<td><%=manager.getPlayerList().get(3).getLocation()%>/<%=manager.getSQUARE()-1%></td>
				        		<td><%=manager.getPlayerList().get(3).getBloodAlcLv()%>%</td>
				        	</tr>
				        </table>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
	    </div>
	 </div>
	 </div>

	<div class="container">
        <table class="table">
            <tr>
                <%
                	for (int i=0; i<4; i++){
                        out.print("<tr>");
                        for (int j=0; j<=manager.getSQUARE()-1; j++){
                        	boolean[] locationArray = manager.getPlayerList().get(i).getLocationArray();
                        	if (locationArray[j]){
								String imagePath =  "image/" + manager.getPlayerList().get(i).getEnName() + ".jpg";
                        		out.print("<td><img style='width:40px; height:40px; border-radius: 50%;' src='");
                        		out.print(imagePath);
                        		out.print("'></td>");
                        	} else if (j == manager.getSQUARE()-1){
   								String imagePath =  "image/flag.png";
                           		out.print("<td><img style='width:30px; height:30px;' src='");
                           		out.print(imagePath);
                           		out.print("'></td>");
                        	} else{
								String imagePath =  "image/round.png";
                        		/* out.print("<td><img class='location' src='"); */
                        		out.print("<td></td>");
                        		/* out.print(imagePath); */
                        		/* out.print("'></td>"); */
                        	}
                        }
                	}
                    out.println("</tr>");
                %>
            </tr>
        </table>
    <form action="Sugoroku" method="post">
		<button type="submit" name="page" value="init" class="btn btn-default">最初から</button>
	</form>
	</div>
</body>
</html>