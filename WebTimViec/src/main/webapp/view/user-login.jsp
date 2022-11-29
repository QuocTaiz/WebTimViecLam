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

    <title>TheJobs - Đăng nhập</title>

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
        <h1>Đăng nhập</h1>

        <form action="/PBL3/login" method="post">

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-email"></i></span>
              <input type="text" name="email" class="form-control" placeholder="Email">
            </div>
          </div>
          
          <hr class="hr-xs">

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="ti-unlock"></i></span>
              <input type="password" name="pass" class="form-control" placeholder="Mật khẩu">
            </div>
          </div>
		  <c:if test="${status eq 'wrong' }">
		  	<p class="text-danger">*Email hoặc mật khẩu bị sai! Vui lòng nhập lại!</p>
		  </c:if>
		  <c:if test="${status eq 'blocked' }">
		  	<p class="text-danger">*Tài khoản của bạn đã bị khoá!</p>
		  </c:if>
          <button class="btn btn-primary btn-block" type="submit">Đăng nhập</button>

        </form>
      </div>

      <div class="login-links">
        <p class="text-center">Chưa có tài khoản? <a class="txt-brand" href="user-register.jsp">Đăng ký </a> </p>
      </div>

    </main>


    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/view/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>

  </body>
</html>
