<%-- 
    Document   : payment
    Created on : Dec 21, 2025, 7:38:09 PM
    Author     : dotha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <!-- Mirrored from htmldemo.net/koparion/koparion/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:44 GMT -->
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
        <jsp:include page="../common/header-top-area.jsp"></jsp:include>
            <!-- header-top-area-end -->
            <!-- header-mid-area-start -->
        <jsp:include page="../common/header-mid-area.jsp"></jsp:include>
            <!-- header-mid-area-end -->
            <!-- main-menu-area-start -->
        <jsp:include page="../common/main-menu-area-start.jsp"></jsp:include>
            <!-- main-menu-area-end -->
            <!-- mobile-menu-area-start -->
        <jsp:include page="../common/mobile-menu-area-start.jsp"></jsp:include>
            <!-- mobile-menu-area-end -->
            <!-- header-area-end -->
            <!-- breadcrumbs-area-start -->
            <div class="breadcrumbs-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-menu">
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#" class="active">cart</a></li>
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
                                <h2>Cart</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- entry-header-area-end -->
            <!-- cart-main-area-start -->
            <div class="cart-main-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="#">
                                <div class="table-content table-responsive mb-15 border-1">
                                <c:if test="${cart == null}">
                                    <p>Không có sản phẩm trong giỏ hàng!!</p>
                                </c:if>
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${listCartItem}">
                                            <tr>
                                                <td class="product-thumbnail"><a href="#"><img src="${pageContext.request.contextPath}/img/product/${product.product.image}" alt="man" /></a></td>
                                                <td class="product-name"><a href="#">${product.product.name}</a></td>
                                                <td class="product-price" data-price="${product.product.price}"><span class="amount">$${product.product.price}</span></td>
                                                <td class="product-quantity"><input name="quantity" type="number" value="${product.quantity}" min="1" max="${product.product.quantity}"></td>
                                                <td class="product-subtotal totalProduct"></td>
                                                <td class="product-remove"><a href="${pageContext.request.contextPath}/Payment?action=remove&cartid=${product.cartId}&productid=${product.productId}"><i class="fa fa-times"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-12">
                        <div class="buttons-cart mb-30">
                            <ul>
                                <li><a href="#">Update Cart</a></li>
                                <li><a href="#">Continue Shopping</a></li>
                            </ul>
                        </div>
                        <div class="coupon">
                            <h3>Coupon</h3>
                            <p>Enter your coupon code if you have one.</p>
                            <form action="#">
                                <input type="text" placeholder="Coupon code">
                                <a href="#">Apply Coupon</a>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="cart_totals">
                            <h2>Cart Totals</h2>
                            <table>
                                <tbody>
                                    <tr class="cart-subtotal">
                                        <th>Subtotal</th>
                                        <td>
                                            <span class="amount" id="amount-total"></span>
                                        </td>
                                    </tr>
                                    <tr class="shipping">
                                        <th>Shipping</th>
                                        <td>
                                            <ul id="shipping_method">
                                                <form>
                                                    <li>
                                                        <input id="shipCount" name="ship" type="radio" value="7">
                                                        <label>
                                                            Flat Rate:
                                                            <span class="amount" >$7.00</span>
                                                        </label>
                                                    </li>
                                                    <li>
                                                        <input name="ship" type="radio" value="0">
                                                        <label> Free Shipping </label>
                                                    </li>
                                                </form>
                                            </ul>
                                            <a href="#">Calculate Shipping</a>
                                        </td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Total</th>
                                        <td>
                                            <strong>
                                                <span class="amount" id="amountEnd"></span>
                                            </strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="wc-proceed-to-checkout">
                                <a href="#">Proceed to Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- cart-main-area-end -->
        <!-- footer-area-start -->
        <jsp:include page="../common/footer-area-start.jsp"></jsp:include>
            <!-- footer-area-end -->
            <!-- all js here -->
            <!-- jquery latest version -->
            <script>
                let total = document.querySelectorAll(".totalProduct");
                let totalText = 0;
                for (let i = 0; i < total.length; i++) {
                    let tr = total[i].closest("tr");
                    let quantity = tr.querySelector(".product-quantity").querySelector("input").value.trim();
                    let price = tr.querySelector(".product-price").dataset.price;
                    total[i].textContent = '$' + (quantity * price);
                    totalText += quantity * price;
                }
                document.querySelectorAll(".product-quantity input").forEach(input => {
                    input.addEventListener("input", function () {
                        let totalText = 0;
                        let totals = document.querySelectorAll(".totalProduct");
                        for (let i = 0; i < totals.length; i++) {
                            let tr = totals[i].closest("tr");
                            let quantity = Number(
                                    tr.querySelector(".product-quantity input").value
                                    );
                            let price = Number(
                                    tr.querySelector(".product-price").dataset.price
                                    );
                            let subtotal = quantity * price;
                            totals[i].textContent = '$' + subtotal.toFixed(2);
                            totalText += subtotal;
                        }
                        document.querySelector("#amount-total").textContent =
                                '$' + totalText.toFixed(2);
                        let radio = document.querySelector("input[name='ship']:checked");
                        let shipFee = radio ? Number(radio.value) : 0;
                        document.querySelector("#amountEnd").textContent =
                                '$' + (totalText + shipFee).toFixed(2);
                    });
                });

                let amountTotal = document.querySelector("#amount-total").textContent = '$' + totalText;
                document.querySelector("#amountEnd").textContent = '$' + Number(totalText).toFixed(2);
                document.querySelectorAll("input[name='ship']").forEach(radio => {
                    radio.addEventListener('change', function () {
                        let radioo = document.querySelector("input[name='ship']:checked");

                        let shipFee = radioo ? Number(radioo.value) : 0;

                        document.querySelector("#amountEnd").textContent =
                                '$' + (Number(totalText) + shipFee).toFixed(2);
                    });
                });


            </script>
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

    <!-- Mirrored from htmldemo.net/koparion/koparion/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:45 GMT -->
</html>
