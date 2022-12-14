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
		              <li><a href="/PBL3/view/change-pass.jsp">?????i m???t kh???u</a></li>
		              <li><a href="/PBL3/logout">????ng xu???t</a></li>
		            </ul>
		          </div>
		        
		        </div>
       			<!-- END User account -->
			</c:when>
			<c:otherwise>
				<!-- User account NOT SIGNED--> 
		        <div class="pull-right user-login">
		          <a class="btn btn-sm btn-primary" href="/PBL3/view/user-login.jsp">????ng nh???p</a> or  <a href="/PBL3/view/user-register.jsp">&nbsp;????ng k??</a>
		        </div>
		        <!-- END User account -->
			</c:otherwise>
			
		</c:choose>

        

        

        <!-- Navigation menu -->
        <ul class="nav-menu">
          <li>
            <a href="/PBL3">Trang Ch???</a>
          </li>
            <c:if test="${role eq 'admin'}">
		        <li>
		            <a href="#">C??ng Vi???c</a>
		            <ul>
		              <li><a href="/PBL3/acc-manage">Qu???n l?? t??i kho???n</a></li>
		              <li><a href="/PBL3/job-inspect">Duy???t b??i ????ng</a></li>
		            </ul>
		        </li>
	        </c:if>
	        <c:if test="${role eq 'recruiter'}">
		        <li>
		            <a href="#">C??ng Vi???c</a>
		            <ul>
		              <li><a href="/PBL3/forward-job-add">????ng b??i tuy???n d???ng</a></li>
		              <li><a href="/PBL3/job-manage">Danh s??ch b??i ????ng</a></li>
		            </ul>
		        </li>
	        </c:if>
          	<c:if test="${role eq 'jobseeker'}">
	          	<li>
	              <a href="#">H??? s??</a>
	              <ul>
	              	<li><a href="/PBL3/view/resume-add.jsp">T???o h??? s??</a></li>
	              	<li><a href="/PBL3/resume-manage">Qu???n l?? h??? s??</a></li>
	              	<li><a href="/PBL3/job-applied">H??? s?? ???? n???p</a></li>
	          	  </ul>
	         	</li>
          	</c:if>
          	<c:if test="${role eq 'recruiter'}">
          		<li>
		            <a href="#">C??ng ty</a>
		            <ul>
		              <li><a href="/PBL3/view/company-add.jsp">Th??m c??ng ty</a></li>
		              <li><a href="/PBL3/company-manage">Qu???n l?? c??ng ty</a></li>
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
    <header class="page-header bg-img" style="background-image: url(${pageContext.request.contextPath}/view/assets/img/bg-banner1.jpg);">
      <div class="container page-name">
        <h1 class="text-center">T???t c??? b??i ????ng</h1>
        <p class="lead text-center">T??m ki???m c??ng vi???c theo nhu c???u c???a b???n</p>
      </div>

      <div class="container">
        <form action="/PBL3/job-list" method="post">

          <div class="row">
            <div class="form-group col-xs-12 col-sm-4">
              <input type="text" class="form-control" name="txtSearch" placeholder="T??? kho??">
            </div>

            <div class="form-group col-xs-12 col-sm-4">
              <input type="text" class="form-control" name="txtAddress" placeholder="?????a ch???">
            </div>

            <div class="form-group col-xs-12 col-sm-4">
              <select class="form-control selectpicker" name="cbbJobCate">
                <option selected>T???t c???</option>
                <option>L???p tr??nh vi??n</option>
                <option>Thi???t k??? ????? ho???</option>
                <option>K??? to??n</option>
                <option>Marketing</option>
                <option>Sale</option>
              </select>
            </div>

          </div>

          <div class="button-group">
            <div class="action-buttons">
              <button class="btn btn-primary" type="submit">T??m ki???m</button>
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

            <div class="col-xs-12">
              <br>
              <h5>T??m th???y <strong>${countJob}</strong> jobs</h5>
            </div>
			
			<c:forEach var="i" items="${listJob}">
				<!-- Job item -->
	            <div class="col-xs-12">
	              <a class="item-block" href="/PBL3/job-detail?id_job=${i.id}">
	                <header>
	                  <img src="${pageContext.request.contextPath}/view/assets/img/logo-default.png" alt="">
	                  <div class="hgroup">
	                    <h4>${i.title}</h4>
	                    <h5>${i.name_cpn}<span class="label label-success">${i.job_type}</span></h5>
	                  </div>
	                  <time><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${i.time_post}" /></time>
	                </header>
	
	                <div class="item-body">
	                  <p>${i.sort_desc}</p>
	                </div>
	
	                <footer>
	                  <ul class="details cols-3">
	                    <li>
	                      <i class="fa fa-map-marker"></i>
	                      <span>${i.address}</span>
	                    </li>
	
	                    <li>
	                      <i class="fa fa-money"></i>
	                      <span>${i.job_salary}</span>
	                    </li>
	
	                    <li>
	                      <i class="fa fa-certificate"></i>
	                      <span>${i.job_degree}</span>
	                    </li>
	                  </ul>
	                </footer>
	              </a>
	            </div>
	            <!-- END Job item -->
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
            <p class="text-justify">An employment website is a web site that deals specifically with employment or careers. Many employment websites are designed to allow employers to post job requirements for a position to be filled and are commonly known as job boards. Other employment sites offer employer reviews, career and job-search advice, and describe different job descriptions or employers. Through a job website a prospective employee can locate and fill out a job application.</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Company</h6>
            <ul class="footer-links">
              <li><a href="page-about.html">About us</a></li>
              <li><a href="page-typography.html">How it works</a></li>
              <li><a href="page-faq.html">Help center</a></li>
              <li><a href="page-typography.html">Privacy policy</a></li>
              <li><a href="page-contact.html">Contact us</a></li>
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Trendeing jobs</h6>
            <ul class="footer-links">
              <li><a href="job-list.html">Front-end developer</a></li>
              <li><a href="job-list.html">Android developer</a></li>
              <li><a href="job-list.html">iOS developer</a></li>
              <li><a href="job-list.html">Full stack developer</a></li>
              <li><a href="job-list.html">Project administrator</a></li>
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
