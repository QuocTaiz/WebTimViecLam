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

    <title>TheJobs - Đăng ký</title>

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
        <h1>Đăng ký</h1>

        <form action="">

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-email"></i></span>
              <input type="text" class="form-control" name="email" placeholder="Email">
            </div>
          </div>
          
          <hr class="hr-xs">

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-unlock"></i></span>
              <input type="password" id="pass" class="form-control" name="pass" placeholder="Mật khẩu" onkeyup="check()">
            </div>
          </div>
          
          <hr class="hr-xs">

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-unlock"></i></span>
              <input type="password" id="cf-pass" class="form-control" name="cf-pass" placeholder="Nhập lại mật khẩu" onkeyup="check()">
            </div>
          </div>
          <p class="text-center" id="message"></p>
          <c:choose>
          	<c:when test="${status == 'fail' }">
          		<p class="text-danger">*Email đã tồn tại!</p>
          	</c:when>
          	<c:when test="${status == 'success' }">
          		<p class="text-success">Tạo tài khoản thành công!</p>
          	</c:when>
          </c:choose>

          <button class="btn btn-primary btn-block" type="submit" formaction="/PBL3/register-rct">Đăng ký với Nhà tuyển dụng</button>
          <button class="btn btn-primary btn-block" type="submit" formaction="/PBL3/register-js">Đăng ký với Người tìm việc</button>

          

        </form>
      </div>

      <div class="login-links">
        <p class="text-center">Đã có tài khoản? <a class="txt-brand" href="user-login.jsp">Đăng nhập</a></p>
      </div>

    </main>


    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/view/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>
    <script type="text/javascript">
	    var check = function() {
	    	  if (document.getElementById('pass').value !=
	    	   	 document.getElementById('cf-pass').value) {
	    	     document.getElementById('message').style.color = 'red';
	    	     document.getElementById('message').innerHTML = '*Mật khẩu không trùng khớp';
	    	  } else {
	    		  document.getElementById('message').innerHTML = '';
	    	  }
	    }
    </script>

  </body>
</html>
