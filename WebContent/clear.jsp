<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sugorokubean" scope="session" class="practice.SugorokuBean" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>すごろく</title>
</head>
<body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<!-- header -->
  <header>
  	<h1 class="headline">
      <a>泥酔すごろく</a>
    </h1>
  </header><br><br>

<div class="container">


  <div class="card text-white bg-dark mb-3" style="width: 70rem; margin: 0 auto;"><br>
   <div class="card-body text-center">
   <h2 class="card-title"><%=sugorokubean.getCount()%>回目でゴール！</h2><br><br>
   <div class="card-text"><p style="font-sice:30px">
   	飲み会から生き残った。この経験があれば、もうどんな飲み会も怖くない。<br>
 	血中アルコール濃度は<%=sugorokubean.getBloodAlcLv()%>でした。
   <br><br></p></div>
   <a><img src="images/gameclear.png" alt="gameclear"  width='30%' height='30%'></a>
   </div>
   <div class="mxauto text-center">
   <a href='Sugoroku?page=init' class='btn btn-primary'>スタートに戻る</a><br><br><br>
   </div>
 </div>

</div>
</body>
</html>
