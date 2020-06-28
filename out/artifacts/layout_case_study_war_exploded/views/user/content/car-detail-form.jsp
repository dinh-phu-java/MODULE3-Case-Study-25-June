<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="block">
    <div class="container">
        <div class="row">
            <!--============ Listing Detail =============================================================-->
            <div class="col-md-9">
                <!--Gallery Carousel-->
                <section>
                    <h2>${detailProduct.car_name}</h2>
                    <!--end section-title-->
                    <div class="gallery-carousel owl-carousel">
                        <img src="<c:url value="${detailProduct.image_id}"/>" alt="" data-hash="1">
                    </div>

                </section>
                <!--end Gallery Carousel-->
                <!--Description-->

                <section>
                    <h2>Description</h2>
                    <p>
                        ${detailProduct.description}
                    </p>
                </section>

                <section>
                    <div class="row">
                        <div class="col-md-5">
                            <h2>Details</h2>
                            <dl>
                                <dt>Car Name</dt>
                                <dd>${detailProduct.car_name}</dd>
                                <dt>Engine Type</dt>
                                <dd>${detailProduct.engine_type}</dd>
                                <dt>Gear</dt>
                                <dd>${detailProduct.gear}</dd>
                                <dt>Front Wheel</dt>
                                <dd>${detailProduct.front_wheel}</dd>
                                <dt>Fuel Type</dt>
                                <dd>${detailProduct.fuel_type}</dd>
                                <dt>Valves</dt>
                                <dd>${detailProduct.valves}</dd>
                                <dt>Date Of Manufacture</dt>
                                <dd>${detailProduct.date_of_manufacture}</dd>
                                <dt>Vendor</dt>
                                <dd>${detailProduct.vendor}</dd>
                                <dt>Car Type</dt>
                                <dd>${detailProduct.car_type}</dd>
                                <dt>Car Price</dt>
                                <dd>$${detailProduct.car_price}</dd>
                            </dl>
<%--                            <c:forEach items="${cartList}" var="cart">--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test = "${(cart.user_id == loginUser.id) && (detailProduct.car_id == cart.car_id)}">--%>
<%--                                        <a href="#" class="btn btn-primary ">Check Cart List</a>--%>
<%--                                    </c:when>--%>

<%--                                    <c:when test = "${loginUser.id==ownerUser.id}">--%>
<%--                                        <a href="/user-control?action=edit-car&car-id=${detailProduct.car_id}" class="btn btn-primary ">Edit your car</a>--%>
<%--                                    </c:when>--%>

<%--                                    <c:when test = "${(loginUser.id!=ownerUser.id) && (loginUser!=null)}">--%>
<%--                                        <a href="/user-control?action=add-to-cart&car-id=${detailProduct.car_id}" class="btn btn-danger ">Add to Cart</a>--%>
<%--                                    </c:when>--%>

<%--                                    <c:when test = "${loginUser.id==null}">--%>
<%--                                        <a href="<c:url value="/register-user?action=login"/>" class="btn btn-warning ">Please login</a>--%>
<%--                                    </c:when>--%>

<%--                                    <c:otherwise>--%>
<%--                                        No comment sir...--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>
<%--                            </c:forEach>--%>
                        <c:forEach items="${cartList}" var="cart">
                            <c:if test = "${(cart.user_id == loginUser.id) && (detailProduct.car_id == cart.car_id)}">
                                <a href="#" class="btn btn-secondary">Check Cart List</a>
                                <c:set var="checkCart" value="1"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${checkCart!= 1}">
                            <c:if test = "${loginUser.id==ownerUser.id}">
                                <a href="/user-control?action=edit-car&car-id=${detailProduct.car_id}" class="btn btn-primary ">Edit your car</a>
                            </c:if>
                            <c:if test = "${(loginUser.id!=ownerUser.id) && (loginUser!=null)}">
                                <a href="/user-control?action=add-to-cart&car-id=${detailProduct.car_id}" class="btn btn-danger ">Add to Cart</a>
                            </c:if>
                            <c:if test = "${loginUser.id==null}">
                                <a href="<c:url value="/register-user?action=login"/>" class="btn btn-warning ">Please login</a>
                            </c:if>
                        </c:if>

                        </div>

                    </div>
                </section>

                <!--Author-->
                <section>
                    <h2>Car Owner</h2>
                    <div class="box">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="author">
                                    <div class="author-image">
                                        <div class="background-image">
                                            <img src="assets/img/author-01.jpg" alt="">
                                        </div>
                                    </div>
                                    <!--end author-image-->
                                    <div class="author-description">
                                        <h3>${ownerUser.fullName}</h3>
                                        <div class="rating" data-rating="4"></div>
                                        <a href="seller-detail-1.html" class="text-uppercase">Show My Car Listings
                                            <span class="appendix">(12)</span>
                                        </a>
                                    </div>
                                    <!--end author-description-->
                                </div>
                                <hr>
                                <dl>
                                    <dt>Email</dt>
                                    <dd>${ownerUser.email}</dd>
                                    <dt>Address</dt>
                                    <dd>${ownerUser.address}</dd>
                                </dl>
                                <!--end author-->
                            </div>
                            <!--end col-md-5-->
                            <div class="col-md-7">
                                <form class="form email">
                                    <div class="form-group">
                                        <label for="name" class="col-form-label">Name</label>
                                        <input name="name" type="text" class="form-control" id="name" placeholder="Your Name">
                                    </div>
                                    <!--end form-group-->
                                    <div class="form-group">
                                        <label for="email" class="col-form-label">Email</label>
                                        <input name="email" type="email" class="form-control" id="email" placeholder="Your Email">
                                    </div>
                                    <!--end form-group-->
                                    <div class="form-group">
                                        <label for="message" class="col-form-label">Message</label>
                                        <textarea name="message" id="message" class="form-control" rows="4" placeholder="Hi there! I am interested in your offer ID 53951. Please give me more details."></textarea>
                                    </div>
                                    <!--end form-group-->
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </form>
                            </div>
                            <!--end col-md-7-->
                        </div>
                        <!--end row-->
                    </div>
                    <!--end box-->
                </section>
                <!--End Author-->
                <section class="content">
                    <h2>Similar Ads</h2>
                    <div class="items list compact">
                        <div class="item">
                            <div class="ribbon-featured">Featured</div>
                            <!--end ribbon-->
                            <div class="wrapper">
                                <div class="image">
                                    <h3>
                                        <a href="#" class="tag category">Home & Decor</a>
                                        <a href="single-listing-1.html" class="title">Furniture for sale</a>
                                        <span class="tag">Offer</span>
                                    </h3>
                                    <a href="single-listing-1.html" class="image-wrapper background-image">
                                        <img src="assets/img/image-01.jpg" alt="">
                                    </a>
                                </div>
                                <!--end image-->
                                <h4 class="location">
                                    <a href="#">Manhattan, NY</a>
                                </h4>
                                <div class="price">$80</div>
                                <div class="meta">
                                    <figure>
                                        <i class="fa fa-calendar-o"></i>02.05.2017
                                    </figure>
                                    <figure>
                                        <a href="#">
                                            <i class="fa fa-user"></i>Jane Doe
                                        </a>
                                    </figure>
                                </div>
                                <!--end meta-->
                                <div class="description">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                                </div>
                                <!--end description-->
                                <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                            </div>
                        </div>
                        <!--end item-->

                        <div class="item">
                            <div class="wrapper">
                                <div class="image">
                                    <h3>
                                        <a href="#" class="tag category">Education</a>
                                        <a href="single-listing-1.html" class="title">Creative Course</a>
                                        <span class="tag">Offer</span>
                                    </h3>
                                    <a href="single-listing-1.html" class="image-wrapper background-image">
                                        <img src="assets/img/image-02.jpg" alt="">
                                    </a>
                                </div>
                                <!--end image-->
                                <h4 class="location">
                                    <a href="#">Nashville, TN</a>
                                </h4>
                                <div class="price">$125</div>
                                <div class="meta">
                                    <figure>
                                        <i class="fa fa-calendar-o"></i>28.04.2017
                                    </figure>
                                    <figure>
                                        <a href="#">
                                            <i class="fa fa-user"></i>Peter Browner
                                        </a>
                                    </figure>
                                </div>
                                <!--end meta-->
                                <div class="description">
                                    <p>Proin at tortor eros. Phasellus porta nec elit non lacinia. Nam bibendum erat at leo faucibus vehicula. Ut laoreet porttitor risus, eget suscipit tellus tincidunt sit amet. </p>
                                </div>
                                <!--end description-->
                                <div class="additional-info">
                                    <ul>
                                        <li>
                                            <figure>Start Date</figure>
                                            <aside>25.06.2017 09:00</aside>
                                        </li>
                                        <li>
                                            <figure>Length</figure>
                                            <aside>2 months</aside>
                                        </li>
                                        <li>
                                            <figure>Bedrooms</figure>
                                            <aside>3</aside>
                                        </li>
                                    </ul>
                                </div>
                                <!--end addition-info-->
                                <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                            </div>
                        </div>
                        <!--end item-->

                        <div class="item">
                            <div class="wrapper">
                                <div class="image">
                                    <h3>
                                        <a href="#" class="tag category">Adventure</a>
                                        <a href="single-listing-1.html" class="title">Into The Wild</a>
                                        <span class="tag">Ad</span>
                                    </h3>
                                    <a href="single-listing-1.html" class="image-wrapper background-image">
                                        <img src="assets/img/image-03.jpg" alt="">
                                    </a>
                                </div>
                                <!--end image-->
                                <h4 class="location">
                                    <a href="#">Seattle, WA</a>
                                </h4>
                                <div class="price">$1,560</div>
                                <div class="meta">
                                    <figure>
                                        <i class="fa fa-calendar-o"></i>21.04.2017
                                    </figure>
                                    <figure>
                                        <a href="#">
                                            <i class="fa fa-user"></i>Peak Agency
                                        </a>
                                    </figure>
                                </div>
                                <!--end meta-->
                                <div class="description">
                                    <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                </div>
                                <!--end description-->
                                <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                            </div>
                        </div>
                        <!--end item-->

                        <div class="center">
                            <a href="#" class="btn btn-primary text-caps btn-framed">Show All</a>
                        </div>
                    </div>
                    <!--end items.list.compact-->
                </section>
            </div>
            <!--============ End Listing Detail =========================================================-->
            <!--============ Sidebar ====================================================================-->
            <div class="col-md-3">
                <aside class="sidebar">
                    <section>
                        <h2>Search Ads</h2>
                        <!--============ Side Bar Search Form ===========================================-->
                        <form class="sidebar-form form">
                            <div class="form-group">
                                <label for="what" class="col-form-label">What?</label>
                                <input name="keyword" type="text" class="form-control" id="what" placeholder="What are you looking for?">
                            </div>
                            <!--end form-group-->
                            <div class="form-group">
                                <label for="input-location" class="col-form-label">Where?</label>
                                <input name="location" type="text" class="form-control" id="input-location" placeholder="Enter Location">
                                <span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>
                            </div>
                            <!--end form-group-->
                            <div class="form-group">
                                <label for="category" class="col-form-label">Category?</label>
                                <select name="category" id="category" data-placeholder="Select Category">
                                    <option value="">Select Category</option>
                                    <option value="1">Computers</option>
                                    <option value="2">Real Estate</option>
                                    <option value="3">Cars & Motorcycles</option>
                                    <option value="4">Furniture</option>
                                    <option value="5">Pets & Animals</option>
                                </select>
                            </div>
                            <!--end form-group-->
                            <button type="submit" class="btn btn-primary width-100">Search</button>

                            <!--Alternative Form-->
                            <div class="alternative-search-form">
                                <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
                                <div class="collapse" id="collapseAlternativeSearchForm">
                                    <div class="wrapper">
                                        <label>
                                            <input type="checkbox" name="new">
                                            New
                                        </label>
                                        <label>
                                            <input type="checkbox" name="used">
                                            Used
                                        </label>
                                        <label>
                                            <input type="checkbox" name="with_photo">
                                            With Photo
                                        </label>
                                        <label>
                                            <input type="checkbox" name="featured">
                                            Featured
                                        </label>
                                        <div class="form-group">
                                            <input name="min_price" type="text" class="form-control small" id="min-price" placeholder="Minimal Price">
                                            <span class="input-group-addon small">$</span>
                                        </div>
                                        <!--end form-group-->
                                        <div class="form-group">
                                            <input name="max_price" type="text" class="form-control small" id="max-price" placeholder="Maximal Price">
                                            <span class="input-group-addon small">$</span>
                                        </div>
                                        <!--end form-group-->
                                        <div class="form-group">
                                            <select name="distance" id="distance" class="small" data-placeholder="Distance" >
                                                <option value="">Distance</option>
                                                <option value="1">1km</option>
                                                <option value="2">5km</option>
                                                <option value="3">10km</option>
                                                <option value="4">50km</option>
                                                <option value="5">100km</option>
                                            </select>
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end wrapper-->
                                </div>
                                <!--end collapse-->
                            </div>
                            <!--end alternative-search-form-->
                        </form>
                        <!--============ End Side Bar Search Form =======================================-->
                    </section>
                    <section>
                        <h2>Similar Ads</h2>
                        <div class="items compact">
                            <div class="item">
                                <div class="ribbon-featured">Featured</div>
                                <!--end ribbon-->
                                <div class="wrapper">
                                    <div class="image">
                                        <h3>
                                            <a href="#" class="tag category">Home & Decor</a>
                                            <a href="single-listing-1.html" class="title">Furniture for sale</a>
                                            <span class="tag">Offer</span>
                                        </h3>
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/img/image-01.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">Manhattan, NY</a>
                                    </h4>
                                    <div class="price">$80</div>
                                    <div class="meta">
                                        <figure>
                                            <i class="fa fa-calendar-o"></i>02.05.2017
                                        </figure>
                                        <figure>
                                            <a href="#">
                                                <i class="fa fa-user"></i>Jane Doe
                                            </a>
                                        </figure>
                                    </div>
                                    <!--end meta-->
                                </div>
                                <!--end wrapper-->
                            </div>
                            <!--end item-->

                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <h3>
                                            <a href="#" class="tag category">Education</a>
                                            <a href="single-listing-1.html" class="title">Creative Course</a>
                                            <span class="tag">Offer</span>
                                        </h3>
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/img/image-02.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">Nashville, TN</a>
                                    </h4>
                                    <div class="price">$125</div>
                                    <div class="meta">
                                        <figure>
                                            <i class="fa fa-calendar-o"></i>28.04.2017
                                        </figure>
                                        <figure>
                                            <a href="#">
                                                <i class="fa fa-user"></i>Peter Browner
                                            </a>
                                        </figure>
                                    </div>
                                    <!--end meta-->
                                </div>
                                <!--end wrapper-->
                            </div>
                            <!--end item-->

                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <h3>
                                            <a href="#" class="tag category">Adventure</a>
                                            <a href="single-listing-1.html" class="title">Into The Wild</a>
                                            <span class="tag">Ad</span>
                                        </h3>
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/img/image-03.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">Seattle, WA</a>
                                    </h4>
                                    <div class="price">$1,560</div>
                                    <div class="meta">
                                        <figure>
                                            <i class="fa fa-calendar-o"></i>21.04.2017
                                        </figure>
                                        <figure>
                                            <a href="#">
                                                <i class="fa fa-user"></i>Peak Agency
                                            </a>
                                        </figure>
                                    </div>
                                    <!--end meta-->
                                </div>
                            </div>
                            <!--end item-->
                        </div>

                    </section>

                </aside>
            </div>
            <!--============ End Sidebar ================================================================-->
        </div>
    </div>
    <!--end container-->
</section>