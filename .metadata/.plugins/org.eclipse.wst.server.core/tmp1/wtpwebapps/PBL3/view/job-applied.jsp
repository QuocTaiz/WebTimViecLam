<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">

    <title>TheJobs - Hồ sơ đã gửi</title>

    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/view/assets/css/app.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/thejobs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/custom.css" rel="stylesheet">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:100,300,400,500,600,800%7COpen+Sans:300,400,500,600,700,800%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="icon" href="assets/img/favicon.ico">
  </head>

  <body class="nav-on-header smart-nav bg-alt">

    <!-- Navigation bar -->
    <nav class="navbar">
      <div class="container">

        <!-- Logo -->
        <div class="pull-left">
          <a class="navbar-toggle" href="#" data-toggle="offcanvas"><i class="ti-menu"></i></a>

          <div class="logo-wrapper">
            <a class="logo" href="/PBL3"><img src="${pageContext.request.contextPath}/view/assets/img/logo.png" alt="logo"></a>
            <a class="logo-alt" href="/PBL3"><img src="${pageContext.request.contextPath}/view/assets/img/logo-alt.png" alt="logo-alt"></a>
          </div>

        </div>
        <!-- END Logo -->

		<c:choose>
			<c:when test="${role eq 'admin' || role eq 'recruiter' || role eq 'jobseeker'  }">
				<!-- User account SIGNED -->
		        <div class="pull-right">
		          <div class="dropdown user-account">
		            <a class="dropdown-toggle" href="#" data-toggle="dropdown">
		              <img src="${pageContext.request.contextPath}/view/assets/img/logoavata.jpg" alt="avatar">
		            </a>
		        
		            <ul class="dropdown-menu dropdown-menu-right">
		              <li><a href="/PBL3/view/change-pass.jsp">Đổi mật khẩu</a></li>
		              <li><a href="/PBL3/logout">Đăng xuất</a></li>
		            </ul>
		          </div>
		        
		        </div>
       			<!-- END User account -->
			</c:when>
			<c:otherwise>
				<!-- User account NOT SIGNED--> 
		        <div class="pull-right user-login">
		          <a class="btn btn-sm btn-primary" href="/PBL3/view/user-login.jsp">Đăng nhập</a> or  <a href="/PBL3/view/user-register.jsp">&nbsp;Đăng ký</a>
		        </div>
		        <!-- END User account -->
			</c:otherwise>
			
		</c:choose>

        

        

        <!-- Navigation menu -->
        <ul class="nav-menu">
          <li>
            <a href="/PBL3">Trang Chủ</a>
          </li>
            <c:if test="${role eq 'admin'}">
		        <li>
		            <a href="#">Công Việc</a>
		            <ul>
		              <li><a href="/PBL3/acc-manage">Quản lý tài khoản</a></li>
		              <li><a href="/PBL3/job-inspect">Duyệt bài đăng</a></li>
		            </ul>
		        </li>
	        </c:if>
	        <c:if test="${role eq 'recruiter'}">
		        <li>
		            <a href="#">Công Việc</a>
		            <ul>
		              <li><a href="/PBL3/forward-job-add">Đăng bài tuyển dụng</a></li>
		              <li><a href="/PBL3/job-manage">Danh sách bài đăng</a></li>
		            </ul>
		        </li>
	        </c:if>
          	<c:if test="${role eq 'jobseeker'}">
	          	<li>
	              <a href="#" class="active">Hồ sơ</a>
	              <ul>
	              	<li><a href="/PBL3/view/resume-add.jsp">Tạo hồ sơ</a></li>
	              	<li><a href="/PBL3/resume-manage">Quản lý hồ sơ</a></li>
	              	<li><a href="/PBL3/job-applied" class="active">Hồ sơ đã nộp</a></li>
	          	  </ul>
	         	</li>
          	</c:if>
          	<c:if test="${role eq 'recruiter'}">
          		<li>
		            <a href="#">Công ty</a>
		            <ul>
		              <li><a href="/PBL3/view/company-add.jsp">Thêm công ty</a></li>
		              <li><a href="/PBL3/company-manage">Quản lý công ty</a></li>
		            </ul>
	         	</li>
          	</c:if>
          
          
          <li>
            <a href="/PBL3/view/page-faq.jsp">FAQs</a>
          </li>
        </ul>
        <!-- END Navigation menu -->

      </div>
    </nav>
    <!-- END Navigation bar -->


    <!-- Page header -->
    <header class="page-header bg-img size-lg" style="background-image: url(${pageContext.request.contextPath}/view/assets/img/bg-banner2.jpg)">
      <div class="container no-shadow">
        <h1 class="text-center">Bài đăng đã gửi hồ sơ</h1>
        <p class="lead text-center">Đây là danh sách bài tuyển dụng bạn đã gửi hồ sơ.</p>
      </div>
    </header>
    <!-- END Page header -->


    <!-- Main container -->
    <main>
      <section class="no-padding bg-alt">
        <div class="container">
          <div class="row">


			<c:forEach var="i" items="${listJobApplied}">
				<!-- Resume item -->
	            <div class="col-xs-12">
	              <div class="item-block">
	                <header>
	                  <a href="/PBL3/job-detail?id_job=${i.id}"><img class="resume-avatar" src="${pageContext.request.contextPath}/view/assets/img/avatar.jpg" alt=""></a>
	                  <div class="hgroup">
	                    <h4><a href="/PBL3/job-detail?id_job=${i.id}">${i.title}</a></h4>
	                    <h5>${i.name_cpn}</h5>
	                  </div>
	                  <div class="header-meta">
	                    <span class="location">${i.address}</span>
	                  </div>
	                </header>
	
	                <footer>
	                  <p class="status"><strong>Nộp hồ sơ lúc: </strong><fmt:formatDate pattern = "dd-MM-yyyy" value = "${i.apply_time}" /></p>
	
	                  <div class="action-btn">
	                    <a class="btn btn-xs btn-gray" href="/PBL3/resume-detail?id_cv=${i.id_cv}">Xem hồ sơ</a>
	                    <a class="btn btn-xs btn-danger" href="/PBL3/delete-job-apply?id_job_apply=${i.id_job_apply}">Huỷ gửi hồ sơ</a>
	                  </div>
	                </footer>
	              </div>
	            </div>
	            <!-- END Resume item -->
			</c:forEach>
            

          </div>
        </div>
      </section>
      
    </main>
    <!-- END Main container -->

	<div class="container text-center"> 
		<ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">Trước</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li>
		    <li class="page-item"><a class="page-link" href="#">Sau</a></li>
  		</ul>
	</div> 

    <!-- Site footer -->
    <footer class="site-footer">

      <!-- Top section -->
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">Trang web việc làm là một trang web đề cập cụ thể đến việc làm hoặc nghề nghiệp. Nhiều
              trang web việc làm được thiết kế
              để cho phép nhà tuyển dụng đăng các yêu cầu công việc cho một vị trí cần tuyển dụng và thường được gọi là bảng
              việc làm.
              Các trang web việc làm khác cung cấp các đánh giá về nhà tuyển dụng, lời khuyên nghề nghiệp và tìm kiếm việc
              làm, đồng
              thời mô tả các mô tả công việc hoặc nhà tuyển dụng khác nhau. Thông qua một trang web việc làm, một nhân viên
              tiềm năng
              có thể tìm và điền vào đơn xin việc.</p>
          </div>
      
          <div class="col-xs-6 col-md-3">
            <h6>Company</h6>
            <ul class="footer-links">
              <li><a href="page-about.html">Thông tin công ty</a></li>
              <li><a href="page-typography.html">Cách hoạt động của công ty</a></li>
              <li><a href="page-faq.html">Trung tâm trợ giúp</a></li>
              <li><a href="page-typography.html">Bảo mật</a></li>
              <li><a href="page-contact.html">Liên hệ</a></li>
            </ul>
          </div>
      
          <div class="col-xs-6 col-md-3">
            <h6>Trendeing jobs</h6>
            <ul class="footer-links">
              <li><a href="job-list.html">Công nghệ phần mềm</a></li>
              <li><a href="job-list.html">Nhà phát triển website</a></li>
              <li><a href="job-list.html">Lập trình viên</a></li>
              <li><a href="job-list.html">Kĩ sư điều khiển</a></li>
              <li><a href="job-list.html">Tự động hoá</a></li>
            </ul>
          </div>
        </div>
      
        <hr>
      </div>
      <!-- END Top section -->

      <!-- Bottom section -->
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyrights &copy; 2016 All Rights Reserved by <a href="http://themeforest.net/user/shamsoft">ShaMSofT</a>.</p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
              <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
              <li><a class="instagram" href="#"><i class="fa fa-instagram"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- END Bottom section -->

    </footer>
    <!-- END Site footer -->
	

    <!-- Back to top button -->
    <a id="scroll-up" href="#"><i class="ti-angle-up"></i></a>
    <!-- END Back to top button -->

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/view/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>

  </body>
</html>
