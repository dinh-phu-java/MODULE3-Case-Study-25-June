<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="block">
    <div class="container">
        <div class="row">
            <!--============ Listing Detail =============================================================-->
            <div class="col-md-9">

                <section class="content">
                    <h2>Similar Ads</h2>
                    <div class="items list compact">
                        <c:forEach items="${postList}" var="post">
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <h3>
                                            <a href="/product-controller?action=car-detail&car-id=${post.car_id}" class="tag category">${post.car_type}</a>
                                            <a href="/product-controller?action=car-detail&car-id=${post.car_id}" class="title">${post.car_name}</a>

                                        </h3>
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="${post.image_id}" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="/home?action=owner-car-list&user-id=${post.user_id}&page=1">${post.address}</a>
                                    </h4>
                                    <div class="price">$${post.car_price}</div>
                                    <div class="meta">
                                        <figure>
                                            <i class="fa fa-calendar-o"></i>${post.post_date}
                                        </figure>
                                        <figure>
                                            <a href="/home?action=owner-car-list&user-id=${post.user_id}&page=1">
                                                <i class="fa fa-user"></i>${post.fullName}
                                            </a>
                                        </figure>
                                    </div>
                                    <!--end meta-->
                                    <div class="description">
                                        <p>${post.gear}-${post.engine_type}-${post.fuel_type}-${post.valves}</p>
                                    </div>
                                    <!--end description-->

                                    <a href="/user-action?action=remove-cart&car-id=${post.car_id}" class="detail text-caps underline">Remove from cart</a>
                                </div>
                            </div>
                            <!--end item-->
                        </c:forEach>

                    </div>
                    <!--end items.list.compact-->
                </section>
                <p style="font-weight: bold;text-transform: uppercase;">Total Price is: $${totalPrice}</p>
                <form action="user-control" method="POST">
                    <input type="hidden" name="action" value="buy-item">
                    <input type="hidden" name="total_price" value="${totalPrice}">
                    <button class="btn btn-danger">Buy Items</button>
                </form>

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
                                <input name="keyword" type="text" class="form-control" id="what"
                                       placeholder="What are you looking for?">
                            </div>
                            <!--end form-group-->
                            <div class="form-group">
                                <label for="input-location" class="col-form-label">Where?</label>
                                <input name="location" type="text" class="form-control" id="input-location"
                                       placeholder="Enter Location">
                                <span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top"
                                      title="Find My Position"><i class="fa fa-map-marker"></i></span>
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
                                <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"
                                   aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i
                                        class="fa fa-plus"></i>More Options</a>
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
                                            <input name="min_price" type="text" class="form-control small"
                                                   id="min-price" placeholder="Minimal Price">
                                            <span class="input-group-addon small">$</span>
                                        </div>
                                        <!--end form-group-->
                                        <div class="form-group">
                                            <input name="max_price" type="text" class="form-control small"
                                                   id="max-price" placeholder="Maximal Price">
                                            <span class="input-group-addon small">$</span>
                                        </div>
                                        <!--end form-group-->
                                        <div class="form-group">
                                            <select name="distance" id="distance" class="small"
                                                    data-placeholder="Distance">
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