
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

    <title>TheJobs</title>

    <!-- Styles -->
    
    <link href="${pageContext.request.contextPath}/view/assets/css/app.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/view/assets/css/thejobs.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/view/assets/css/custom.css" rel="stylesheet" type="text/css">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Oswald:100,300,400,500,600,800%7COpen+Sans:300,400,500,600,700,800%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="icon" href="${pageContext.request.contextPath}/view/assets/img/favicon.ico">
  </head>

  <body class="nav-on-header smart-nav">

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
	              <a href="#">Hồ sơ</a>
	              <ul>
	              	<li><a href="/PBL3/view/resume-add.jsp">Tạo hồ sơ</a></li>
	              	<li><a href="/PBL3/resume-manage">Quản lý hồ sơ</a></li>
	              	<li><a href="/PBL3/job-applied">Hồ sơ đã nộp</a></li>
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


    <!-- Site header -->
    <header class="site-header size-lg text-center" style="background-image: url(${pageContext.request.contextPath}/view/assets/img/thaoluan.jpg)">
      <div class="container">
        <div class="col-xs-12">
          <br><br>
          <h2>Mọi công việc bạn yêu thích đều ở đây!</h2>
          <h5 class="font-alt">Tìm kiếm nhanh chóng</h5>
          <br><br><br>
          <form class="header-job-search" action="/PBL3/job-list" method="post">
            <div class="input-keyword">
              <input type="text" class="form-control" name="txtSearch" placeholder="Tìm kiếm việc làm">
            </div>

            <div class="input-location">
              <input type="text" class="form-control" name="txtAddress" placeholder="Địa chỉ">
            </div>
				
				<input type="hidden" name="cbbJobCate" value="Tất cả">
				
            <div class="btn-search">
              <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
          </form>
        </div>

      </div>
    </header>
    <!-- END Site header -->


    <!-- Main container -->
    <main>



      <!-- Recent jobs -->
      <section>
        <div class="container">
          <header class="section-header">
            <span>Latest</span>
            <h2>Recent jobs</h2>
          </header>

          <div class="row item-blocks-connected">
          
			<c:forEach var="i" items="${listJobLatest}">
				<!-- Job item -->
	            <div class="col-xs-12">
	              <a class="item-block" href="/PBL3/job-detail?id_job=${i.id}">
	                <header>
	                  <img src="${pageContext.request.contextPath}/view/assets/img/logo-defaul.png" alt="">
	                  <div class="hgroup">
	                    <h4>${i.title}</h4>
	                    <h5>${i.name_cpn}</h5>
	                  </div>
	                  <div class="header-meta">
	                    <span class="location">${i.address}</span>
	                    <span class="label label-success">${i.job_type}</span>
	                  </div>
	                </header>
	              </a>
	            </div>
	            <!-- END Job item -->
			</c:forEach>
            
          </div>

          <br><br>
          <p class="text-center"><a class="btn btn-info" href="/PBL3/job-list">Hiển thị tất cả bài đăng</a></p>
        </div>
      </section>
      <!-- END Recent jobs -->
      </main>
    <!-- Site footer -->
    <footer class="site-footer">

      <!-- Top section -->
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">Đây là một website tìm kiêm việc làm được tạo ra nhằm giúp nhứng nhà tuyển dụng
              dễ dàng tìm kiếm nhân sự phù hợp với công việc của công ty. Đồng thời tạo ra nhiều cơ hội lựa chọn, tìm kiếm việc làm phù hợp 
            với trình độ và mong muốn của người tìm việc. Giúp tiết kiệm thời gian, công sức, tiền bạc của nhà tuyển dụng và người tìm việc trong quá trình tuyển dụng.</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Company</h6>
            <ul class="footer-links">
              <li><a href="page-about.html">Về trang web</a></li>
              <li><a href="page-typography.html">Cách thức hoạt động</a></li>
              <li><a href="page-faq.html">Trung tâm hổ trợ</a></li>
              <li><a href="page-typography.html">Bảo mật</a></li>
              <li><a href="page-contact.html">Liên hệ</a></li>
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Trendeing jobs</h6>
            <ul class="footer-links">
              <li><a href="job-list.html">Công nghệ phần mềm</a></li>
              <li><a href="job-list.html">Nhà phát triển website</a></li>
              <li><a href="job-list.html">Marketting</a></li>
              <li><a href="job-list.html">Kỹ sư điều khiển</a></li>
              <li><a href="job-list.html">Tự động hóa</a></li>
            </ul>
          </div>
        </div>

        <hr>
      </div>
      <!-- END Top section -->

      <!-- Bottom section -->
      <div class="container">
        <div class="row">


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
