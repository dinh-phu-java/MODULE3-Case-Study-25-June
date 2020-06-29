<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <c:forEach items="${sessionScope.productList}" var="product">
                    <div class="item">
                            <%--                            <div class="ribbon-featured">Featured</div>--%>
                        <!--end ribbon-->
                        <div class="wrapper">
                            <div class="image">
                                <h3>
                                    <a href="/product-controller?action=car-detail&car-id=${product.car_id}"
                                       class="tag category">${product.car_type}</a>
                                    <a href="/product-controller?action=car-detail&car-id=${product.car_id}"
                                       class="title">${product.car_name}</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="/product-controller?action=car-detail&car-id=${product.car_id}"
                                   class="image-wrapper background-image">
                                    <img src="<c:url value='${product.image_id}'/>" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">${product.address}</a>
                            </h4>
                            <div class="price">$${product.car_price}</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>${product.post_date}
                                </figure>
                                <figure>
                                    <a href="/home?action=owner-car-list&user-id=${product.user_id}&page=1">
                                        <i class="fa fa-user"></i>${product.fullName}
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>${product.gear}-${product.engine_type}-${product.fuel_type}-${product.valves}</p>
                            </div>
                            <!--end description-->
                            <a href="/product-controller?action=car-detail&car-id=${product.car_id}"
                               class="detail text-caps underline">Detail</a>


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
                            <a class="page-link"
                               href="<c:url value="/home?action=search-post&page=${sessionScope.page-1}&car_name=${car_name}&location=${location}&car_type=${car_type}"/>"
                               aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="fa fa-chevron-left"></i>
                                        </span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${sessionScope.listSize}">
                            <li class="page-item <c:if test="${sessionScope.page == i}"> active </c:if>">
                                <a class="page-link"
                                   href="<c:url value="/home?action=search-post&page=${i}&car_name=${car_name}&location=${location}&car_type=${car_type}"/>">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item">
                            <a class="page-link"
                               href="<c:url value="/home?action=search-post&page=${sessionScope.page+1}&car_name=${car_name}&location=${location}&car_type=${car_type}"/>"
                               aria-label="Next">
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