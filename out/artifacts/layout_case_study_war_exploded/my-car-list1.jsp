<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dinh Phu
  Date: 6/26/2020
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="views/user/header/head.jsp"/>
</head>
<body>
<p>${sessionScope.loginUser.fullName}</p>
<ul>
<c:forEach  items="${sessionScope.productList}" var="product">
    <li>${product.engine_type}</li>
    <li>${product.gear}</li>
    <li>${product.front_wheel}</li>
    <li>${product.car_name}</li>
    <li><img src="<c:url value="${product.image_id}"/>" width="100" height="100" alt=""></li>
</c:forEach>
</ul>

<c:forEach  items="${sessionScope.productList}" var="product">
    <div class="item">
            <%--                            <div class="ribbon-featured">Featured</div>--%>
        <!--end ribbon-->
        <div class="wrapper">
            <div class="image">
                <h3>
                    <a href="#" class="tag category">${product.car_type}</a>
                    <a href="single-listing-1.html" class="title">${product.car_name}</a>
                    <span class="tag">Offer</span>
                </h3>
                <a href="<c:url value="${product.image_id}"/>" class="image-wrapper background-image">
                    <img src="assets/img/image-01.jpg" alt="">
                </a>
            </div>
            <!--end image-->
            <h4 class="location">
                <a href="#">${sessionScope.loginUser.address}</a>
            </h4>
            <div class="price">$${product.car_price}</div>
            <div class="meta">
                <figure>
                    <i class="fa fa-calendar-o"></i>${product.post_date}
                </figure>
                <figure>
                    <a href="#">
                        <i class="fa fa-user"></i>${sessionScope.loginUser.fullName}
                    </a>
                </figure>
            </div>
            <!--end meta-->
            <div class="description">
                <p>${product.gear}</p>
            </div>
            <!--end description-->
            <a href="/product-controller?action=car-detail" class="detail text-caps underline">Detail</a>
        </div>
    </div>
</c:forEach>

<c:import url="views/user/header/foot.jsp"/>
</body>
</html>
