<%-- 
    Document   : header-top-area
    Created on : Dec 15, 2025, 5:48:39 PM
    Author     : dotha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header-top-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="language-area">
                    <ul>
                        <li><img src="${pageContext.request.contextPath}/img/flag/1.jpg" alt="flag" /><a href="#">English<i class="fa fa-angle-down"></i></a>
                            <div class="header-sub">
                                <ul>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/img/flag/2.jpg" alt="flag" />france</a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/img/flag/3.jpg" alt="flag" />croatia</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#">USD $<i class="fa fa-angle-down"></i></a>
                            <div class="header-sub dolor">
                                <ul>
                                    <li><a href="#">EUR €</a></li>
                                    <li><a href="#">USD $</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <div class="account-area text-end">
                    <ul>
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <li><a href="my-account.html">${sessionScope.account.username}</a></li>
                                <li><a href="${pageContext.request.contextPath}/Login?action=logout">Log Out</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="${pageContext.request.contextPath}/Login?action=register">Register</a></li>
                                <li><a href="${pageContext.request.contextPath}/Login">Sign in</a></li>
                                </c:otherwise>
                            </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
