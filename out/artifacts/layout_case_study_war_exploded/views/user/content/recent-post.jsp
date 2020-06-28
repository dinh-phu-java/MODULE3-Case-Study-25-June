<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="block">
    <div class="container">
        <h2>Recent Post</h2>

        <div class="items grid grid-xl-4-items grid-lg-3-items grid-md-2-items">
            <c:forEach items="${recentProducts}" var="product">
                <div class="item">
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
                            <a href="/product-controller?action=car-detail&car-id=${product.car_id}">${product.address}</a>
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

                        <a href="/product-controller?action=car-detail&car-id=${product.car_id}" class="detail text-caps underline">Detail</a>
                    </div>
                </div>
                <!--end item-->
            </c:forEach>
        </div>
    </div>
    <!--end container-->
</section>