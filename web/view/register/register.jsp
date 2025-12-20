<%-- 
    Document   : register
    Created on : Dec 20, 2025, 10:16:42 PM
    Author     : dotha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from htmldemo.net/koparion/koparion/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:57 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Book Shop HTML5 Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.png">

        <!-- all css here -->
        <!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- flexslider.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <!-- chosen.min.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <!-- modernizr css -->

    </head>

    <body class="register">
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <!-- header-area-start -->
        <header>
            <!-- header-top-area-start -->
            <jsp:include page="/view/common/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->
                <!-- header-mid-area-start -->
            <jsp:include page="/view/common/header-mid-area.jsp"></jsp:include>
                <!-- header-mid-area-end -->
                <!-- main-menu-area-start -->
            <jsp:include page="/view/common/main-menu-area-start.jsp"></jsp:include>
                <!-- main-menu-area-end -->
                <!-- mobile-menu-area-start -->
            <jsp:include page="/view/common/mobile-menu-area-start.jsp"></jsp:include>
                <!-- mobile-menu-area-end -->
            </header>
            <!-- header-area-end -->
            <!-- breadcrumbs-area-start -->
            <div class="breadcrumbs-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-menu">
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#" class="active">register</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumbs-area-end -->
            <!-- user-login-area-start -->
            <div class="user-login-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="login-title text-center mb-30">
                                <h2>Sign Up</h2>
                                <p>tungtungtung sharuaa<br>chalalelo chalala</p>
                            </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/Login" method="POST">
                            <input type="hidden" name="action" value="registerEnter">
                            <div class="offset-lg-2 col-lg-8 col-md-12 col-12">
                                <div class="billing-fields">
                                    <div class="single-register">
                                        <label>Account password<span>*</span><span style="color: red"> ${error}</span></label>
                                        <input name="username" type="text" placeholder="Account" style="width: 100%; height: 50px; background-color: #fff; border: 1px solid #ccc; padding: 10px"/>
                                    </div>
                                    <div class="single-register">
                                        <label>Confirm password<span>*</span></label>
                                        <input name="password" type="text" placeholder="Password" style="width: 100%; height: 50px; background-color: #fff; border: 1px solid #ccc; padding: 10px"/>
                                    </div>
                                    <div class="single-register">
                                        <a id="register">Register</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- user-login-area-end -->
            <!-- footer-area-start -->
        <jsp:include page="/view/common/footer-area-start.jsp"></jsp:include>
            <!-- footer-area-end -->


            <!-- all js here -->
            <!-- jquery latest version -->
            <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>
        <script>
            let submitForm = document.querySelector("#register");
            submitForm.addEventListener('click', function () {
                submitForm.closest("form").submit();
            });
        </script>

        <!-- bootstrap js -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- owl.carousel js -->
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>
        <!-- wow js -->
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <!-- jquery.parallax-1.1.3.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.parallax-1.1.3.js"></script>
        <!-- jquery.countdown.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <!-- jquery.flexslider.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
        <!-- chosen.jquery.min.js -->
        <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
        <!-- jquery.counterup.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <!-- waypoints.min.js -->
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <!-- plugins js -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/koparion/koparion/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:57 GMT -->
</html>