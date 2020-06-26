<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>

    <c:import url="views/user/header/head.jsp"/>
    <title>Craigs - Easy Buy & Sell Listing HTML Template</title>

</head>
<body>
<div class="page home-page">
    <!--*********************************************************************************************************-->
    <!--************ HERO ***************************************************************************************-->
    <!--*********************************************************************************************************-->
    <header class="hero has-dark-background">
        <div class="hero-wrapper">
            <!--============ Secondary Navigation ===============================================================-->
            <c:import url="views/user/header/secondary-navigation.jsp"/>
            <!--============ End Secondary Navigation ===========================================================-->
            <!--============ Main Navigation ====================================================================-->
            <c:import url="views/user/header/main-navigation.jsp"/>
            <!--============ End Main Navigation ================================================================-->
            <!--============ Page Title =========================================================================-->
            <c:import url="views/user/header/page-title.jsp"/>
            <!--============ End Page Title =====================================================================-->
            <!--============ Hero Form ==========================================================================-->
            <c:import url="views/user/header/hero-form.jsp"/>
            <!--============ End Hero Form ======================================================================-->
            <c:import url="views/user/header/background.jsp"/>
            <!--end background-->
        </div>
        <!--end hero-wrapper-->
    </header>
    <!--end hero-->

    <!--*********************************************************************************************************-->
    <!--************ CONTENT ************************************************************************************-->
    <!--*********************************************************************************************************-->
    <section class="content">
        <section class="block">
            <div class="container">
                <!--============ Section Title===================================================================-->
                <div class="section-title clearfix">
                    <div class="float-left float-xs-none">
                        <label class="mr-3 align-text-bottom">Sort by: </label>
                        <select name="sorting" id="sorting" class="small width-200px"
                                data-placeholder="Default Sorting">
                            <option value="">Default Sorting</option>
                            <option value="1">Newest First</option>
                            <option value="2">Oldest First</option>
                            <option value="3">Lowest Price First</option>
                            <option value="4">Highest Price First</option>
                        </select>

                    </div>
                    <div class="float-right d-xs-none thumbnail-toggle">
                        <a href="#" class="change-class active" data-change-from-class="list"
                           data-change-to-class="grid" data-parent-class="items">
                            <i class="fa fa-th"></i>
                        </a>
                        <a href="#" class="change-class" data-change-from-class="grid" data-change-to-class="list"
                           data-parent-class="items">
                            <i class="fa fa-th-list"></i>
                        </a>
                    </div>
                </div>
                <!--============ Items ==========================================================================-->
                <div class="items grid grid-xl-4-items grid-lg-4-items grid-md-4-items">
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
                                    <a href="#" class="image-wrapper background-image">
                                        <img src="<c:url value='${product.image_id}'/>" alt="">
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

                    <!--end item-->
                </div>
                <!--============ End Items ======================================================================-->
                <div class="page-pagination">
                    <nav aria-label="Pagination">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="fa fa-chevron-left"></i>
                                        </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">
                                            <i class="fa fa-chevron-right"></i>
                                        </span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--end page-pagination-->
            </div>
            <!--end container-->
        </section>
        <!--end block-->
    </section>
    <!--end content-->
    <!--end content-->

    <!--*********************************************************************************************************-->
    <!--************ FOOTER *************************************************************************************-->
    <!--*********************************************************************************************************-->
    <footer class="footer">
        <div class="wrapper">
            <c:import url="views/user/footer/content.jsp"/>
            <c:import url="views/user/footer/background.jsp"/>
            <!--end background-->
        </div>
    </footer>
    <!--end footer-->
</div>
<!--end page-->

<c:import url="views/user/header/foot.jsp"/>

</body>
</html>
