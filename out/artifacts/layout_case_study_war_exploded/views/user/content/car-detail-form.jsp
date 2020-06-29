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

                            <c:forEach items="${cartList}" var="cart">
                                <c:if test="${(cart.user_id == loginUser.id) && (detailProduct.car_id == cart.car_id)}">
                                    <a href="/user-control?action=cart-list" class="btn btn-secondary">Check Cart
                                        List</a>
                                    <c:set var="checkCart" value="1"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${checkCart!= 1}">
                                <c:if test="${loginUser.id==ownerUser.id}">
                                    <a href="/user-control?action=edit-car&car-id=${detailProduct.car_id}"
                                       class="btn btn-primary ">Edit your car</a>
                                </c:if>
                                <c:if test="${(loginUser.id!=ownerUser.id) && (loginUser!=null)}">
                                    <a href="/user-control?action=add-to-cart&car-id=${detailProduct.car_id}"
                                       class="btn btn-danger ">Add to Cart</a>
                                </c:if>
                                <c:if test="${loginUser.id==null}">
                                    <a href="<c:url value="/register-user?action=login"/>" class="btn btn-warning ">Please
                                        login</a>
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
                                        <a href="/home?action=owner-car-list&user-id=${ownerUser.id}&page=1"
                                           class="text-uppercase">Show My Car Listings
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
                                        <input name="name" type="text" class="form-control" id="name"
                                               placeholder="Your Name">
                                    </div>
                                    <!--end form-group-->
                                    <div class="form-group">
                                        <label for="email" class="col-form-label">Email</label>
                                        <input name="email" type="email" class="form-control" id="email"
                                               placeholder="Your Email">
                                    </div>
                                    <!--end form-group-->
                                    <div class="form-group">
                                        <label for="message" class="col-form-label">Message</label>
                                        <textarea name="message" id="message" class="form-control" rows="4"
                                                  placeholder="Hi there! I am interested in your offer ID 53951. Please give me more details."></textarea>
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
                    <h2>Recent Post</h2>
                    <div class="items list compact">
                        <c:forEach items="${featureProducts}" var="product">


                            <div class="item">
                                <div class="ribbon-featured">Featured</div>
                                <!--end ribbon-->
                                <div class="wrapper">
                                    <div class="image">
                                        <h3>
                                            <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="tag category">${product.car_type}</a>
                                            <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="title">${product.car_name}</a>
                                            <span class="tag">Offer</span>
                                        </h3>
                                        <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="image-wrapper background-image">
                                            <img src="${product.image_id}" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="/home?action=owner-car-list&user-id=${product.user_id}&page=1">${product.address}</a>
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
                                    <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="detail text-caps underline">Detail</a>
                                </div>
                            </div>
                            <!--end item-->
                        </c:forEach>
                        <div class="center">
                            <a href="/home?action=all-post&page=1" class="btn btn-primary text-caps btn-framed">Show All</a>
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
                        <form class="sidebar-form form" method="get" action="home">
                            <input type="hidden" name="action" value="search-post">
                            <input type="hidden" name="page" value="1">
                            <div class="form-group">
                                <label for="what" class="col-form-label">Car Name?</label>
                                <input name="car_name" type="text" class="form-control" id="what"
                                       placeholder="What are you looking for?">
                            </div>
                            <!--end form-group-->
                            <div class="form-group">
                                <label for="input-location" class="col-form-label">Where?</label>
                                <input name="location" type="text" class="form-control" id="input-location"
                                       placeholder="Enter Location">
                            </div>
                            <!--end form-group-->
                            <div class="form-group">
                                <label for="category" class="col-form-label">Category?</label>
                                <select name="car_type" id="category" data-placeholder="Select Car Type">
                                    <option value="4 Door Sedans">4-Door Sedans</option>
                                    <option value="2 Door Coupes">2-Door Coupes</option>
                                    <option value="Station Wagons">Liquefied</option>
                                    <option value="Convertibles">Petroleum</option>
                                    <option value="Sports Cars">Sports Cars</option>
                                    <option value="Mini Vans">Mini-Vans</option>
                                    <option value="suvs">SUVs</option>
                                    <option value="Pickup Trucks">Pickup Trucks</option>
                                    <option value="Vans">Vans</option>
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
                        <h2>${loginUser.fullName} Recent Post</h2>
                        <div class="items compact">
                           <c:forEach items="${ownerProducts}" var="product">
                            <div class="item">
                                <div class="ribbon-featured">Featured</div>
                                <!--end ribbon-->
                                <div class="wrapper">
                                    <div class="image">
                                        <h3>
                                            <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="tag category">${product.car_type}</a>
                                            <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="title">${product.car_name}</a>
                                            <span class="tag">Offer</span>
                                        </h3>
                                        <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="image-wrapper background-image">
                                            <img src="${product.image_id}" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="/home?action=owner-car-list&user-id=${product.user_id}&page=1">${product.address}</a>
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
                                </div>
                                <!--end wrapper-->
                            </div>
                            <!--end item-->
                           </c:forEach>
                        </div>

                    </section>

                </aside>
            </div>
            <!--============ End Sidebar ================================================================-->
        </div>
    </div>
    <!--end container-->
</section>