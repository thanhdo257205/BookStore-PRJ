<%-- 
    Document   : myAccount
    Created on : Dec 21, 2025, 6:36:18 PM
    Author     : dotha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <!-- Mirrored from htmldemo.net/koparion/koparion/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:38 GMT -->
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
    <body class="cart">
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
                                    <li><a href="#" class="active">my-account</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumbs-area-end -->
            <!-- entry-header-area-start -->
            <div class="entry-header-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="entry-header-title">
                                <h2>My-Account</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- entry-header-area-end -->
            <!-- my account wrapper start -->
            <div class="my-account-wrapper mb-70">
                <div class="container">
                    <div class="section-bg-color">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- My Account Page Start -->
                                <div class="myaccount-page-wrapper">
                                    <!-- My Account Tab Menu Start -->
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4">
                                            <div class="myaccount-tab-menu nav" role="tablist">
                                                <a href="#dashboad" class="active" data-bs-toggle="tab"><i class="fa fa-dashboard"></i>
                                                    Dashboard</a>
                                                <a href="#orders" data-bs-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
                                                    Orders</a>
                                                <a href="#download" data-bs-toggle="tab"><i class="fa fa-cloud-download"></i>
                                                    Download</a>
                                                <a href="#payment-method" data-bs-toggle="tab"><i class="fa fa-credit-card"></i>
                                                    Payment
                                                    Method</a>
                                                <a href="#address-edit" data-bs-toggle="tab"><i class="fa fa-map-marker"></i>
                                                    address</a>
                                                <a href="#account-info" data-bs-toggle="tab"><i class="fa fa-user"></i> Account
                                                    Details</a>
                                                <a href="login.html"><i class="fa fa-sign-out"></i> Logout</a>
                                            </div>
                                        </div>
                                        <!-- My Account Tab Menu End -->

                                        <!-- My Account Tab Content Start -->
                                        <div class="col-lg-9 col-md-8">
                                            <div class="tab-content" id="myaccountContent">
                                                <!-- Single Tab Content Start -->
                                                <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Dashboard</h5>
                                                        <div class="welcome">
                                                            <p>Hello, <strong>${sessionScope.account.username}</strong> (If Not<a href="${pageContext.request.contextPath}/Login?action=logout" class="logout"> Logout</a>)</p>
                                                        </div>
                                                        <p class="mb-0">From your account dashboard. you can easily check &
                                                            view your recent orders, manage your shipping and billing addresses
                                                            and edit your password and account details.</p>
                                                    </div>
                                                </div>
                                                <!-- Single Tab Content End -->

                                                <!-- Single Tab Content Start -->
                                                <div class="tab-pane fade" id="orders" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Orders</h5>
                                                        <div class="myaccount-table table-responsive text-center">
                                                            <table class="table table-bordered">
                                                                <thead class="thead-light">
                                                                    <tr>
                                                                        <th>Order</th>
                                                                        <th>Date</th>
                                                                        <th>Status</th>
                                                                        <th>Total</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>1</td>
                                                                        <td>Aug 22, 2018</td>
                                                                        <td>Pending</td>
                                                                        <td>$3000</td>
                                                                        <td><a href="cart.html" class="btn btn-sqr">View</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2</td>
                                                                        <td>July 22, 2018</td>
                                                                        <td>Approved</td>
                                                                        <td>$200</td>
                                                                        <td><a href="cart.html" class="btn btn-sqr">View</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>3</td>
                                                                        <td>June 12, 2017</td>
                                                                        <td>On Hold</td>
                                                                        <td>$990</td>
                                                                        <td><a href="cart.html" class="btn btn-sqr">View</a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single Tab Content End -->

                                                <!-- Single Tab Content Start -->
                                                <div class="tab-pane fade" id="download" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Downloads</h5>
                                                        <div class="myaccount-table table-responsive text-center">
                                                            <table class="table table-bordered">
                                                                <thead class="thead-light">
                                                                    <tr>
                                                                        <th>Product</th>
                                                                        <th>Date</th>
                                                                        <th>Expire</th>
                                                                        <th>Download</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>Haven - Free Real Estate PSD Template</td>
                                                                        <td>Aug 22, 2018</td>
                                                                        <td>Yes</td>
                                                                        <td><a href="#" class="btn btn-sqr"><i
                                                                                    class="fa fa-cloud-download"></i>
                                                                                Download File</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>HasTech - Profolio Business Template</td>
                                                                        <td>Sep 12, 2018</td>
                                                                        <td>Never</td>
                                                                        <td><a href="#" class="btn btn-sqr"><i
                                                                                    class="fa fa-cloud-download"></i>
                                                                                Download File</a></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single Tab Content End -->

                                                <!-- Single Tab Content Start -->
                                                <div class="tab-pane fade" id="payment-method" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Payment Method</h5>
                                                        <p class="saved-message">You Can't Saved Your Payment Method yet.</p>
                                                    </div>
                                                </div>
                                                <!-- Single Tab Content End -->

                                                <!-- Single Tab Content Start -->
                                                <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Billing Address</h5>
                                                        <address>
                                                            <p><strong>Erik Jhonson</strong></p>
                                                            <p>1355 Market St, Suite 900 <br>
                                                                San Francisco, CA 94103</p>
                                                            <p>Mobile: (123) 456-7890</p>
                                                        </address>
                                                        <a href="#" class="btn btn-sqr"><i class="fa fa-edit"></i>
                                                            Edit Address</a>
                                                    </div>
                                                </div>
                                                <!-- Single Tab Content End -->

                                                <!-- Single Tab Content Start -->
                                                <div class="tab-pane fade" id="account-info" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Account Details</h5>
                                                        <div class="account-details-form">
                                                            <form action="#">
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="first-name" class="required">First
                                                                                Name</label>
                                                                            <input type="text" id="first-name" placeholder="First Name" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="last-name" class="required">Last
                                                                                Name</label>
                                                                            <input type="text" id="last-name" placeholder="Last Name" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="single-input-item">
                                                                    <label for="display-name" class="required">Display Name</label>
                                                                    <input type="text" id="display-name" placeholder="Display Name" />
                                                                </div>
                                                                <div class="single-input-item">
                                                                    <label for="email" class="required">Email Addres</label>
                                                                    <input type="email" id="email" placeholder="Email Address" />
                                                                </div>
                                                                <fieldset>
                                                                    <legend>Password change</legend>
                                                                    <div class="single-input-item">
                                                                        <label for="current-pwd" class="required">Current
                                                                            Password</label>
                                                                        <input type="password" id="current-pwd" placeholder="Current Password" />
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            <div class="single-input-item">
                                                                                <label for="new-pwd" class="required">New
                                                                                    Password</label>
                                                                                <input type="password" id="new-pwd" placeholder="New Password" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6">
                                                                            <div class="single-input-item">
                                                                                <label for="confirm-pwd" class="required">Confirm
                                                                                    Password</label>
                                                                                <input type="password" id="confirm-pwd" placeholder="Confirm Password" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </fieldset>
                                                                <div class="single-input-item">
                                                                    <button class="btn btn-sqr">Save Changes</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div> <!-- Single Tab Content End -->
                                            </div>
                                        </div> <!-- My Account Tab Content End -->
                                    </div>
                                </div> <!-- My Account Page End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- my account wrapper end -->
            <!-- footer-area-start -->
        <jsp:include page="/view/common/footer-area-start.jsp"></jsp:include>
            <!-- footer-area-end -->


            <!-- all js here -->
            <!-- jquery latest version -->
            <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/myscript.js"></script>

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

    <!-- Mirrored from htmldemo.net/koparion/koparion/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:39 GMT -->
</html>
