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
	<c:choose>	
		<c:when test="${CV.id != null}">
			<title>TheJobs - Cập nhật hồ sơ</title>
		</c:when>
		<c:otherwise>
			<title>TheJobs - Thêm hồ sơ</title>
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
	              	<li><a href="/PBL3/view/resume-add.jsp" class="active">Tạo hồ sơ</a></li>
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

    <form action="" method="post">

      <!-- Page header -->
      <header class="page-header">
        <div class="container page-name">
          <c:choose>
          	<c:when test="${CV.id != null}">
          		<h1 class="text-center">Cập nhật hồ sơ của bạn</h1>
          	</c:when>
          	<c:otherwise>
          		<h1 class="text-center">Thêm hồ sơ của bạn</h1>
          		<p class="lead text-center">Tạo hồ sơ của bạn và đưa nó lên mạng.</p>
          	</c:otherwise>
          </c:choose>
          
        </div>

        <div class="container">

          <div class="row">
            <div class="col-xs-12 col-sm-4">
              <div class="form-group">
                <input type="file" class="dropify" >
                <span class="help-block">Vui lòng chọn ảnh hồ sơ 4: 6.</span>
              </div>
            </div>


            <div class="col-xs-12 col-sm-8">
            
            
              <div class="form-group">
                <input type="text" class="form-control input-lg" name="name" value="${CV.name}" required placeholder="Tên">
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" name="title" value="${CV.title}" required placeholder="Dòng tiêu đề (ví dụ: nhà phát triển Front-end)">
              </div>

              <div class="form-group">
                <textarea class="form-control" rows="3" name="sort-desc" placeholder="Mô tả ngắn gọn về bạn">${CV.sort_desc}</textarea>
              </div>

              <hr class="hr-lg">

              <h6>Thông tin cơ bản</h6>
              <div class="row">

                <div class="form-group col-xs-12 col-sm-6">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                    <input type="text" class="form-control" name="address" value="${CV.address}" required placeholder="Khu vực, ví dụ. Liên Chiểu, Đà Nẵng">
                  </div>
                </div>

                <div class="form-group col-xs-12 col-sm-6">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa fa-birthday-cake"></i></span>
                    <input type="text" class="form-control" name="old" value="${CV.old}" required placeholder="Tuổi">
                    <span class="input-group-addon">Tuổi</span>
                  </div>
                </div>

                <div class="form-group col-xs-12 col-sm-6">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                    <input type="text" class="form-control" name="phone" value="${CV.phone}" required placeholder="Số điện thoại">
                  </div>
                </div>

                <div class="form-group col-xs-12 col-sm-6">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                    <input type="text" class="form-control" name="email" value="${CV.email}" required placeholder="Địa chỉ Email">
                  </div>
                </div>
                
                <div class="form-group col-xs-12 col-sm-6">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa-flask fa"></i></span>
                    <input type="text" class="form-control" name="exp" value="${CV.exp}" required placeholder="Kinh nghiệm">
                  </div>
                </div>
                
                <div class="form-group col-xs-12 col-sm-6">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="fa fa-certificate"></i></span>
                    <input type="text" class="form-control" name="degree" value="${CV.degree}" required placeholder="Bằng cấp">
                  </div>
                </div>

              </div>

              <hr class="hr-lg">
			
            </div>
          </div>

          <!-- <div class="button-group">
            <div class="action-buttons">

              <div class="upload-button">
                <button class="btn btn-block btn-gray">Chọn tệp hồ sơ</button>
                <input type="file">
              </div>

              <div class="upload-button">
                <button class="btn btn-block btn-primary">Chọn ảnh bìa</button>
                <input id="cover_img_file" type="file">
              </div>

            </div>
          </div> -->
        </div>
      </header>
      <!-- END Page header -->


      <!-- Main container -->
      <main>


      
        <!-- Submit -->
        <section class=" bg-img" >
          <div>
          	<c:choose>
          		<c:when test="${CV.id != null}">
          			<p class="text-center"><button class="btn btn-success btn-xl btn-round" type="submit" formaction="/PBL3/resume-update?id_cv=${CV.id}">Cập nhật hồ sơ</button></p>
          		</c:when>
          		<c:otherwise>
          			<p class="text-center"><button class="btn btn-success btn-xl btn-round" type="submit" formaction="/PBL3/resume-add">Thêm hồ sơ</button></p>
          		</c:otherwise>
          	</c:choose>

            

          </div>
        </section>
        <!-- END Submit -->


      </main>
      <!-- END Main container -->

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
              <li><a href="#">Về trang web</a></li>
              <li><a href="#">Cách thức hoạt động</a></li>
              <li><a href="#">Trung tâm trợ giúp</a></li>
              <li><a href="#">Bảo mật</a></li>
              <li><a href="#">Liên hệ</a></li>
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Trending jobs</h6>
            <ul class="footer-links">
              <li><a href="#">Công nghệ phần mềm</a></li>
              <li><a href="#">Nhà phát triển website</a></li>
              <li><a href="#">Marketting</a></li>
              <li><a href="#">Kĩ sư điều khiển</a></li>
              <li><a href="#">Tự động hóa</a></li>
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
    <script src="${pageContext.request.contextPath}/view/assets/vendors/summernote/summernote.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>

  </body>
</html>
