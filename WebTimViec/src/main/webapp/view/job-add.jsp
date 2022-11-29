<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Post a job position or create your online resume by TheJobs!">
    <meta name="keywords" content="">


	<c:choose>
		<c:when test="${job.id != null}">
			<title>TheJobs - Chỉnh sửa bài đăng</title>
		</c:when>
		<c:otherwise>
			<title>TheJobs - Đăng bài tuyển dụng</title>
		</c:otherwise>
	</c:choose>
    

    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/view/assets/css/app.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/vendors/summernote/summernote.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/thejobs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/assets/css/custom.css" rel="stylesheet">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Oswald:100,300,400,500,600,800%7COpen+Sans:300,400,500,600,700,800%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
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
		            <a href="#" class="active">Công Việc</a>
		            <ul>
		              <li><a href="/PBL3/forward-job-add" class="active">Đăng bài tuyển dụng</a></li>
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

    <form action="#" method="post">
    <!-- Page header -->
    <header class="page-header">
      <div class="container page-name">
      	<c:choose>
      		<c:when test="${job.id != null}">
      			<h1 class="text-center">Chỉnh Sửa Bài Tuyển Dụng</h1>
      		</c:when>
      		<c:otherwise>
				<h1 class="text-center">Tạo Bài Đăng Tuyển Dụng</h1>
        		<p class="lead text-center">Tạo một vị trí tuyển dụng mới cho công ty của bạn</p>      		
      		</c:otherwise>
      	</c:choose>
        
      </div>

      <div class="container">
		
        <div class="row">
          <div class="form-group col-xs-12 col-sm-6">
            <input type="text" class="form-control input-lg" name="title" value="${job.title}" placeholder="Tiêu đề công việc, Ví dụ: Front-end developer">
          </div>

          <div class="form-group col-xs-12 col-sm-6">
            <select class="form-control selectpicker" name="nameCpn">
              <option>Chọn một công ty</option>
              <c:forEach var="i" items="${listNameCpn}">
              	<c:choose>
              		<c:when test="${fn:contains(i,job.name_cpn)}">
              			<option selected>${i}</option>
              		</c:when>
              		<c:otherwise>
              			<option>${i}</option>
              		</c:otherwise>
              	</c:choose>
              	
              </c:forEach>
              
              
            </select>
            <a class="help-block" href="/PBL3/view/company-add.jsp">Tạo mới một công ty</a>
          </div>

          <div class="form-group col-xs-12">
            <textarea class="form-control" rows="3" name="sort_desc" placeholder="Giới thiệu về công việc">${job.sort_desc}</textarea>
          </div>

          <div class="form-group col-xs-12 col-sm-6 col-md-4">
            <div class="input-group input-group-sm">
              <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
              <input type="text" class="form-control" name="address" value="${job.address}" placeholder="Địa chỉ">
            </div>
          </div>

          <div class="form-group col-xs-12 col-sm-6 col-md-4">
            <div class="input-group input-group-sm">
              <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
              <select class="form-control selectpicker" required name="job_type">
              
              	<c:choose> <c:when test="${job_job_type == 'Full time'}"><option selected>Full time</option></c:when> <c:otherwise><option>Full time</option></c:otherwise> </c:choose>
              	<c:choose> <c:when test="${job_job_type == 'Part time'}"><option selected>Part time</option></c:when> <c:otherwise><option>Part time</option></c:otherwise> </c:choose>
              	<c:choose> <c:when test="${job_job_type == 'Internship'}"><option selected>Internship</option></c:when> <c:otherwise><option>Internship</option></c:otherwise> </c:choose>
              	<c:choose> <c:when test="${job_job_type == 'Freelance'}"><option selected>Freelance</option></c:when> <c:otherwise><option>Freelance</option></c:otherwise> </c:choose>
              	<c:choose> <c:when test="${job_job_type == 'Remote'}"><option selected>Remote</option></c:when> <c:otherwise><option>Remote</option></c:otherwise> </c:choose>
                
              </select>
            </div>
          </div>

          <div class="form-group col-xs-12 col-sm-6 col-md-4">
            <div class="input-group input-group-sm">
              <span class="input-group-addon"><i class="fa fa-money"></i></span>
              <input type="text" class="form-control" name="job_salary" value="${job.job_salary}" required  placeholder="Lương">
            </div>
          </div>

          <div class="form-group col-xs-12 col-sm-6 col-md-4">
            <div class="input-group input-group-sm">
              <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
              <input type="text" class="form-control" name="job_NoHW" value="${job.job_NoHW}" required placeholder="Thời gian làm việc">
              <span class="input-group-addon">giờ / ngày</span>
            </div>
          </div>

          <div class="form-group col-xs-12 col-sm-6 col-md-4">
            <div class="input-group input-group-sm">
              <span class="input-group-addon"><i class="fa fa-flask"></i></span>
              <input type="text" class="form-control" name="job_exp" value="${job.job_exp}" required placeholder="Kinh nghiệm">
              <span class="input-group-addon">năm</span>
            </div>
          </div>

          <div class="form-group col-xs-12 col-sm-6 col-md-4">
            <div class="input-group input-group-sm">
              <span class="input-group-addon"><i class="fa fa-certificate"></i></span>
              
              <select class="form-control selectpicker" required multiple name="job_degree">
              	<c:forTokens items="Không,Cử Nhân,Tiến sĩ,Kĩ sư" delims="," var="i">
              		<c:choose>
              			<c:when test="${fn:contains(job.job_degree,i)}">
              				<option selected>${i}</option>
              			</c:when>
              			<c:otherwise>
              				<option>${i}</option>
              			</c:otherwise>
              		</c:choose>
              		
              	</c:forTokens>
              	<c:if test="${job == null}"><option selected>Bằng cấp</option></c:if>
              	
                
              </select>
            </div>
          </div>


        </div>
		
      </div>
    </header>
    <!-- END Page header -->


    
        <!-- Submit -->
        <section class="bg-alt">
			<div>
			<c:choose>
				<c:when test="${job.id != null}">
					<p class="text-center"><button class="btn btn-success btn-xl btn-round" type="submit" formaction="/PBL3/job-update?id_job=${job.id}">Cập nhật bài đăng</button></p>
				</c:when>
				<c:otherwise>
					<p class="text-center"><button class="btn btn-success btn-xl btn-round" type="submit" formaction="/PBL3/job-add">Thêm bài đăng</button></p>
				</c:otherwise>
			</c:choose>
            	
			</div>
        </section>
        <!-- END Submit -->

		</form>

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