<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">

    <title>TheJobs - Thay đổi mật khẩu</title>

    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/view/assets/css/app.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/thejobs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/custom.css" rel="stylesheet">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Oswald:100,300,400,500,600,800%7COpen+Sans:300,400,500,600,700,800%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="icon" href="${pageContext.request.contextPath}/view/assets/img/favicon.ico">
  </head>

  <body class="login-page">


    <main>

      <div class="login-block">
        <img src="${pageContext.request.contextPath}/view/assets/img/logo.png" alt="">
        <h1>THAY ĐỔI MẬT KHẨU</h1>

        <form action="/PBL3/change-pass" method="post">
        
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-unlock"></i></span>
              <input type="password" name="pass_old" class="form-control" placeholder="Mật khẩu cũ">
            </div>
          </div>
        
          <hr class="hr-xs">
        
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-unlock"></i></span>
              <input type="password" id="pass-new" name="pass_new" class="form-control" placeholder="Mật khẩu mới" onkeyup="check()">
            </div>
          </div>
        
          <hr class="hr-xs">
        
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-unlock"></i></span>
              <input type="password" id="confirm-pass-new" name="comfirm-pass-new" class="form-control" placeholder="Nhập lại mật khẩu mới" onkeyup="check()">
            </div>  
            <p class="text-center" id="message"></p>
          </div>
        
          <button class="btn btn-primary btn-block" type="submit">Thay đổi</button>
          <br>
          
          	<c:choose>
          		<c:when test="${color_msg eq 'red' }">
          			<p class="text-danger">${msg}</p>
          		</c:when>
          		
          		<c:when test="${color_msg eq 'green' }">
          			<p class="text-success">${msg}</p>
          		</c:when>
          		
          	</c:choose>
          
          	
          
        </form>
        
      </div>

      <div class="login-links">
        <p class="text-center"><a href="/PBL3">Trở về trang chủ</a></p>
      </div>

    </main>


    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/view/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>
    <script type="text/javascript">
	    var check = function() {
	    	  if (document.getElementById('pass-new').value !=
	    	   	 document.getElementById('confirm-pass-new').value) {
	    	     document.getElementById('message').style.color = 'red';
	    	     document.getElementById('message').innerHTML = '*Mật khẩu không trùng khớp';
	    	  } else {
	    		  document.getElementById('message').innerHTML = '';
	    	  }
	    }
    </script>
    
  </body>
</html>
