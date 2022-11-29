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

    <title>TheJobs - Danh sách nộp hồ sơ</title>

    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/view/assets/css/app.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/thejobs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/custom.css" rel="stylesheet">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:100,300,400,500,600,800%7COpen+Sans:300,400,500,600,700,800%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="icon" href="${pageContext.request.contextPath}/view/assets/img/favicon.ico">
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


    <!-- Page header -->
    <header class="page-header bg-img size-lg" style="background-image: url(${pageContext.request.contextPath}/view/assets/img/xemmaytinh.jpg)">
      <div class="container page-name">
        <h1 class="text-center">Ứng cử viên</h1>
        <p class="lead text-center">Xem danh sách ứng cử viên đã nộp hồ sơ vào bài tuyển dụng</p>
      </div>

      <div class="container">
        <h5>Ứng viên cho</h5>
        <a class="item-block item-block-flat" href="/PBL3/job-detail?id_job=${job.id}">
          <header>
            <img src="${pageContext.request.contextPath}/view/assets/img/logo-default.png" alt="">
            <div class="hgroup">
              <h4>${job.title}</h4>
              <h5>${job.name_cpn}</h5>
            </div>
            <div class="header-meta">
              <span class="location">${job.address}</span>
              <span class="label label-success">${job.job_type}</span>
            </div>
          </header>
        </a>

        <hr>

        <h5>Tìm kiếm</h5>
        <form action="/PBL3/search-job-apply?id_job=${job.id}" method="post">

          <div class="row">
            <div class="form-group col-xs-12 col-sm-4">
              <input type="text" class="form-control" placeholder="Từ khóa" name="txtSearch">
            </div>

            <div class="form-group col-xs-12 col-sm-4">
              <select class="form-control selectpicker" multiple name="cbbDegree">
                <option selected>Tất cả bằng cấp</option>
                <option>Cử nhân</option>
                <option>Kỹ sư</option>
                <option>Tiến sĩ</option>
              </select>
            </div>

            <div class="form-group col-xs-12 col-sm-4">
              <select class="form-control selectpicker" name="cbbSort">
                <option selected>Mới nhất</option>
                <option>Cũ nhất</option>
                <option>Tên (A -> Z)</option>
                <option>Tên (Z -> A)</option>
              </select>
            </div>

          </div>

          <div class="button-group">
            <div class="action-buttons">
              <button class="btn btn-primary" type="submit">Lọc</button>
            </div>
          </div>

        </form>
      </div>
    </header>
    <!-- END Page header -->


    <!-- Main container -->
    <main>
      <section class="no-padding-top bg-alt">
        <div class="container">
          <div class="row">

			<c:forEach var="i" items="${listJobApply}">
				<!-- Resume item -->
	            <div class="col-xs-12">
	              <div class="item-block">
	                <header>
	                  <a href="/PBL3/resume-detail?id_cv=${i.id}"><img class="resume-avatar" src="${pageContext.request.contextPath}/view/assets/img/logo-default.png" alt=""></a>
	                  <div class="hgroup">
	                    <h4>
	                      <a href="/PBL3/resume-detail?id_cv=${i.id}">${i.name}</a>
	                      
	                    </h4>
	                    <h5>${i.title}</h5>
	                  </div>
	                  <div class="header-meta">
	                    <span class="location">${i.address}</span>
	                    <i class="fa-flask fa"></i>
	                    <span>${i.exp}</span><br>
	                    <i class="fa fa-certificate"></i>
	                    <span>${i.degree}</span>
	                  </div>
	                </header>
	
	                <footer>
	                  <div class="status"><strong>Nộp hồ sơ lúc:</strong> <time><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${i.apply_time}" /></time></div>
	
	                  <div class="action-btn">
	                    <a class="btn btn-xs btn-gray" data-toggle="modal" data-target="#modal-contact" href="#">Liên hệ</a>
	                    <a class="btn btn-xs btn-danger" href="#">Xóa</a>
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
              <li><a href="page-faq.html">Trung tâm hỗ trợ</a></li>
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


    <!-- Contact modal -->
    <div class="modal fade" id="modal-contact" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
            <h5 class="modal-title" id="myModalLabel">Gửi tin nhắn</h5>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="subject" class="control-label">Chủ đề</label>
                <input type="text" class="form-control" id="subject">
              </div>
              <div class="form-group">
                <label for="message-text" class="control-label">Tin nhắn</label>
                <textarea class="form-control" id="message-text"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-gray" data-dismiss="modal">Đóng</button>
            <button type="button" class="btn btn-primary">Gửi</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/view/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>

  </body>
</html>
