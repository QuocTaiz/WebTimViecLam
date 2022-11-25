<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="TheJobs is a directory listing template.">
    <meta name="keywords" content="">

    <title>TheJobs - FAQs</title>

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
            <a href="/PBL3/view/page-faq.jsp" class="active">FAQs</a>
          </li>
        </ul>
        <!-- END Navigation menu -->

      </div>
    </nav>
    <!-- END Navigation bar -->

    <!-- Site header -->
    <header class="site-header size-lg text-center" style="background-image: url(${pageContext.request.contextPath}/view/assets/img/building.jpg)">
      <div class="container">
        <div class="col-xs-12">
          <h1>Các câu hỏi thường gặp</h1>
          <h5 class="font-alt">Có lẽ bạn sẽ tìm thấy câu trả lời của mình ở đây. Liên hệ với chúng tôi nếu bạn không tìm thấy những gì bạn đang tìm kiếm.</h5>
          <br>
          <div id="faq-search" class="form-group">
            <i class="ti-search fa-flip-horizontal1"></i>
            <input type="text" class="form-control" name="search" placeholder="Nhập để tìm kiếm...">
          </div>
        </div>

      </div>
    </header>
    <!-- END Site header -->



    <!-- Main container -->
    <main id="faq-result">
      <section>
        <div class="container">
          <header class="section-header text-left">
            <span>Câu hỏi thường gặp</span>
            <h2>Chung</h2>
          </header>

          <ul class="faq-items">
            <li>
              <h5>Công việc là gì?</h5>
              <p>Công việc (công tác) (tiếng Anh là activity (work), hay task), hay tức là công việc (quản lý dự án), là những hoạt động (hay những nhiệm vụ) công việc chuyên môn do các tổ đội (team work) thực hiện trên từng phân đoạn của dự án (là các cấp độ phân chia dự án được phân chia bởi Cơ cấu phân chia công việc, phân khúc dự án theo quy mô mà không theo chuyên môn) (các công việc chuyên môn khác nhau lần lượt được thực hiện trên mỗi phân đoạn).</p>
            </li>

            <li>
              <h5>Tại sao phải đi làm?</h5>
              <p>Để có trách nhiệm với bản thân, với xã hội, với gia đình, để học tập, phát triển,...</p>
            </li>

            <li>
              <h5>Khi nào có thể đi làm?</h5>
              <p>Khi bạn đã sẵng sàn, có đủ trình độ kiến thức về chuyên môn, kiến thức về pháp luật cơ bản,...</p>
            </li>

            <li>
              <h5>Các nghành nghề đang cần nhiều nhân lực?</h5>
              <p>công nghệ thông tin, marketing, bất động sản, tự động hóa,...</p>
            </li>
          </ul>
        </div>
      </section>


      <section class="bg-alt">
        <div class="container">
          <header class="section-header text-left">
            <span>kỹ năng</span>
            <h2>Những kỹ năng cần thiết</h2>
          </header>

          <ul class="faq-items">
            <li>
              <h5>Các công cụ cơ bản của người làm văn phòng ?</h5>
              <p>Thành thạo exel, word, powerpoint, canvas,...</p>
            </li>

            <li>
              <h5>Kỹ năng khi đi làm ?</h5>
              <p>Làm việc nhóm, giao tiếp, tự học, tinh thần trách nhiệm,...</p>
            </li>

            <li>
              <h5>Kỹ năng càn thiết khi đi xin việc ?</h5>
              <p>Khả năng quản lý thời gian, có tính đồng đội, tự tin, hoạt ngôn,...</p>
            </li>
          </ul>
        </div>
      </section>


      <section>
        <div class="container">
          <header class="section-header text-left">
            <span>Ngành nghề</span>
            <h2>công việc</h2>
          </header>

          <ul class="faq-items">
            <li>
              <h5>marketing là gì?</h5>
              <p> Marketing là một quá trình kinh doanh tạo mối quan hệ và làm hài lòng khách hàng. Tập trung vào khách hàng, một trong những thành phần hàng đầu của quản lý doanh nghiệp..</p>
            </li>

            <li>
              <h5>Lập trình viên là gì ?</h5>
              <p>Lập trình viên (người lập trình hay thảo chương viên điện toán) là người viết ra các chương trình máy tính. "Thảo chương viên điện toán" là một từ cũ, được dùng trước năm 1975, và đang trở nên ít phổ thông hơn. Theo thuật ngữ máy tính, lập trình viên có thể là một chuyên gia trong một lĩnh vực của chương trình máy tính hoặc là một người không chuyên, viết mã cho các loại phần mềm. Người đã thực hiện và đưa ra cách tiếp cận chính thức để lập trình được gọi là người phân tích phần mềm.</p>
            </li>
          </ul>
        </div>
      </section>


      <section class="bg-alt">
        <div class="container">
          <header class="section-header text-left">
            <span>Giữ an toàn</span>
            <h2>Bảo mật</h2>
          </header>

          <ul class="faq-items">
            <li>
              <h5>An ninh mạng là gì ?</h5>
              <p>An ninh mạng, an ninh máy tính, bảo mật công nghệ thông tin là việc bảo vệ hệ thống mạng máy tính khỏi các hành vi trộm cắp hoặc làm tổn hại đến phần cứng, phần mềm và các dữ liệu, cũng như các nguyên nhân dẫn đến sự gián đoạn, chuyển lệch hướng của các dịch vụ hiện đang được được cung cấp.</p>
            </li>

            <li>
              <h5>các ứng dụng tin nhắn an toàn ?</h5>
              <p>Zalo, telgram,...</p>
            </li>

            <li>
              <h5> Có nên chia sẻ thông tin cá nhân, riêng tư cho người khác?</h5>
              <p>Nhằm giữ an toàn cho bản thân, quyền riêng tư, trảnh sự lợi dụng của kẻ xấu không nên chia sẻ thông tin cá nhân cho người lạ,...</p>
            </li>
          </ul>
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

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/view/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/thejobs.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/custom.js"></script>

  </body>
</html>
