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
        <!--============ Featured Ads ===========================================================================-->
        <section class="block">
            <div class="container">
                <h2>Featured Ads</h2>
                <div class="items grid grid-xl-3-items grid-lg-3-items grid-md-2-items">
                    <div class="item">
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

                </div>
            </div>
        </section>
        <!--============ End Featured Ads =======================================================================-->
        <!--============ Features Steps =========================================================================-->
        <section class="block">
            <div class="container">
                <div class="block">
                    <h2>Selling With Us Is Easy</h2>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="feature-box">
                                <figure>
                                    <img src="assets/icons/feature-user.png" alt="">
                                    <span>1</span>
                                </figure>
                                <h3>Create an Account</h3>
                                <p>Etiam molestie viverra dui vitae mattis. Ut velit est</p>
                            </div>
                            <!--end feature-box-->
                        </div>
                        <!--end col-->
                        <div class="col-md-3">
                            <div class="feature-box">
                                <figure>
                                    <img src="assets/icons/feature-upload.png" alt="">
                                    <span>2</span>
                                </figure>
                                <h3>Submit Your Ad</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <!--end feature-box-->
                        </div>
                        <!--end col-->
                        <div class="col-md-3">
                            <div class="feature-box">
                                <figure>
                                    <img src="assets/icons/feature-like.png" alt="">
                                    <span>3</span>
                                </figure>
                                <h3>Make a Deal</h3>
                                <p>Nunc ultrices eu urna quis cursus. Sed viverra ullamcorper</p>
                            </div>
                            <!--end feature-box-->
                        </div>
                        <!--end col-->
                        <div class="col-md-3">
                            <div class="feature-box">
                                <figure>
                                    <img src="assets/icons/feature-wallet.png" alt="">
                                    <span>4</span>
                                </figure>
                                <h3>Enjoy the Money!</h3>
                                <p>Integer nisl ipsum, sodales sed scelerisque nec, aliquet sit</p>
                            </div>
                            <!--end feature-box-->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                </div>
                <!--end block-->
            </div>
            <!--end container-->
            <div class="background" data-background-color="#fff"></div>
            <!--end background-->
        </section>
        <!--end block-->
        <!--============ End Features Steps =====================================================================-->
        <!--============ Recent Ads =============================================================================-->
        <section class="block">
            <div class="container">
                <h2>Recent Ads</h2>
                <div class="items grid grid-xl-4-items grid-lg-3-items grid-md-2-items">
                    <div class="item">
                        <div class="wrapper">
                            <div class="image">
                                <h3>
                                    <a href="#" class="tag category">Real Estate</a>
                                    <a href="single-listing-1.html" class="title">Luxury Apartment</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-04.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Greeley, CO</a>
                            </h4>
                            <div class="price">$75,000</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>13.03.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Hills Estate
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Area</figure>
                                        <aside>368m<sup>2</sup></aside>
                                    </li>
                                    <li>
                                        <figure>Bathrooms</figure>
                                        <aside>2</aside>
                                    </li>
                                    <li>
                                        <figure>Bedrooms</figure>
                                        <aside>3</aside>
                                    </li>
                                    <li>
                                        <figure>Garage</figure>
                                        <aside>1</aside>
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
                                    <a href="#" class="tag category">Architecture</a>
                                    <a href="single-listing-1.html" class="title">We'll Redesign Your Apartment</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-05.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Greeley, CO</a>
                            </h4>
                            <div class="price">
                                <span class="appendix">From</span>
                                $200
                            </div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>13.03.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>XL Designers
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Area</figure>
                                        <aside>368m<sup>2</sup></aside>
                                    </li>
                                    <li>
                                        <figure>Bathrooms</figure>
                                        <aside>2</aside>
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
                        <div class="ribbon-featured">Featured</div>
                        <!--end ribbon-->
                        <div class="wrapper">
                            <div class="image">
                                <h3>
                                    <a href="#" class="tag category">Jobs</a>
                                    <a href="single-listing-1.html" class="title">Seeking for a Job</a>
                                    <span class="tag">Demand</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-06.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Delavan, IL</a>
                            </h4>
                            <div class="price">$1,200</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>10.03.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Aurelio Thomas
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Degree</figure>
                                        <aside>Bachelor’s</aside>
                                    </li>
                                    <li>
                                        <figure>Category</figure>
                                        <aside>Art & Design</aside>
                                    </li>
                                    <li>
                                        <figure>Experience</figure>
                                        <aside>5 years</aside>
                                    </li>
                                    <li>
                                        <figure>Language</figure>
                                        <aside>English, German</aside>
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
                                    <a href="#" class="tag category">Pets & Animals</a>
                                    <a href="single-listing-1.html" class="title">Baby Cats</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-07.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Detroit, MI</a>
                            </h4>
                            <div class="price">
                                <span class="appendix">From</span>
                                $80
                            </div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>23.02.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Detroit Pet Center
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Pellentesque ullamcorper justo quis bibendum
                                    consequat. Integer id euismod lacus, facilisis faucibus urna.
                                </p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Age</figure>
                                        <aside>2 weeks</aside>
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
                                    <a href="#" class="tag category">Mobiles</a>
                                    <a href="single-listing-1.html" class="title">Used Smartphone</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-08.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">West Roxbury, MA</a>
                            </h4>
                            <div class="price">$300</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>28.02.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Gloria A. Crawford
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Vestibulum congue at justo semper dignissim. Pellentesque ullamcorper justo quis bibendum
                                    consequat. Integer id euismod lacus, facilisis faucibus urna.
                                </p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Status</figure>
                                        <aside>Used</aside>
                                    </li>
                                    <li>
                                        <figure>Brand</figure>
                                        <aside>Samsung</aside>
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
                                    <a href="#" class="tag category">Cars</a>
                                    <a href="single-listing-1.html" class="title">Offroad Car</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-09.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Nehalem, OR</a>
                            </h4>
                            <div class="price">$30,000</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>14.01.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Leonardo
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Nam eget imperdiet massa. Cras dolor nulla, tristique eu nisl ut, venenatis volutpat massa.
                                    Integer imperdiet finibus ipsum vitae scelerisque.
                                </p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Brand</figure>
                                        <aside>Jeep</aside>
                                    </li>
                                    <li>
                                        <figure>Engine</figure>
                                        <aside>Diesel</aside>
                                    </li>
                                    <li>
                                        <figure>Mileage</figure>
                                        <aside>28,630</aside>
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
                                    <a href="#" class="tag category">Clothing</a>
                                    <a href="single-listing-1.html" class="title">High Boots</a>
                                    <span class="tag">Offer</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-10.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Raleigh, NC</a>
                            </h4>
                            <div class="price">$67</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>05.01.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Bobby
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Nam pulvinar mollis tortor, eu lobortis mauris luctus non. Integer lobortis sapien enim,
                                    ut imperdiet leo faucibus id. Fusce tincidunt nunc elit, at varius erat rutrum vitae.
                                </p>
                            </div>
                            <!--end description-->
                            <div class="additional-info">
                                <ul>
                                    <li>
                                        <figure>Status</figure>
                                        <aside>Used</aside>
                                    </li>
                                    <li>
                                        <figure>Material</figure>
                                        <aside>Genuine Leather</aside>
                                    </li>
                                    <li>
                                        <figure>Size</figure>
                                        <aside>10</aside>
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
                                    <a href="#" class="tag category">Books & Magazines</a>
                                    <a href="single-listing-1.html" class="title">Will Buy "Behind the Sea" Book</a>
                                    <span class="tag">Demand</span>
                                </h3>
                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                    <img src="assets/img/image-11.jpg" alt="">
                                </a>
                            </div>
                            <!--end image-->
                            <h4 class="location">
                                <a href="#">Long Beach, CA</a>
                            </h4>
                            <div class="price">$30</div>
                            <div class="meta">
                                <figure>
                                    <i class="fa fa-calendar-o"></i>02.01.2017
                                </figure>
                                <figure>
                                    <a href="#">
                                        <i class="fa fa-user"></i>Patty McAlexander
                                    </a>
                                </figure>
                            </div>
                            <!--end meta-->
                            <div class="description">
                                <p>Mauris nisi ligula, pulvinar eu commodo eu, semper id quam. In vitae purus bibendum,
                                    mattis ex nec, eleifend diam. Cras at vehicula metus. Sed elementum lectus ut aliquet vehicula.
                                </p>
                            </div>
                            <!--end description-->
                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                        </div>
                    </div>
                    <!--end item-->
                </div>
            </div>
            <!--end container-->
        </section>
        <!--end block-->
        <!--============ End Recent Ads =========================================================================-->
        <!--============ Newsletter =============================================================================-->
        <section class="block">
            <div class="container">
                <div class="box has-dark-background">
                    <div class="row align-items-center justify-content-center d-flex">
                        <div class="col-md-10 py-5">
                            <h2>Get the Latest Ads in Your Inbox</h2>
                            <form class="form email">
                                <div class="form-row">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label for="newsletter_category" class="col-form-label">Category?</label>
                                            <select name="newsletter_category" id="newsletter_category" data-placeholder="Select Category" >
                                                <option value="">Select Category</option>
                                                <option value="1">Computers</option>
                                                <option value="2">Real Estate</option>
                                                <option value="3">Cars & Motorcycles</option>
                                                <option value="4">Furniture</option>
                                                <option value="5">Pets & Animals</option>
                                            </select>
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-4-->
                                    <div class="col-md-7 col-sm-7">
                                        <div class="form-group">
                                            <label for="newsletter_email" class="col-form-label">Your Email</label>
                                            <input name="newsletter_email" type="email" class="form-control" id="newsletter_email" placeholder="Your Email">
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-9-->
                                    <div class="col-md-1 col-sm-1">
                                        <div class="form-group">
                                            <label class="invisible">.</label>
                                            <button type="submit" class="btn btn-primary width-100"><i class="fa fa-chevron-right"></i></button>
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-9-->
                                </div>
                            </form>
                            <!--end form-->
                        </div>
                    </div>
                    <div class="background">
                        <div class="background-image">
                            <img src="assets/img/hero-background-image-01.jpg" alt="">
                        </div>
                        <!--end background-image-->
                    </div>
                    <!--end background-->
                </div>
                <!--end box-->
            </div>
            <!--end container-->
        </section>
        <!--end block-->

        <section class="block">
            <div class="container">
                <div class="d-flex align-items-center justify-content-around">
                    <a href="#">
                        <img src="assets/img/partner-1.png" alt="">
                    </a>
                    <a href="#">
                        <img src="assets/img/partner-2.png" alt="">
                    </a>
                    <a href="#">
                        <img src="assets/img/partner-3.png" alt="">
                    </a>
                    <a href="#">
                        <img src="assets/img/partner-4.png" alt="">
                    </a>
                    <a href="#">
                        <img src="assets/img/partner-5.png" alt="">
                    </a>
                </div>
            </div>

        </section>

    </section>
    <!--end content-->

    <!--*********************************************************************************************************-->
    <!--************ FOOTER *************************************************************************************-->
    <!--*********************************************************************************************************-->
    <footer class="footer">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <a href="#" class="brand">
                            <img src="assets/img/logo.png" alt="">
                        </a>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec tincidunt arcu, sit amet
                            fermentum sem. Class aptent taciti sociosqu ad litora torquent per conubia nostra.
                        </p>
                    </div>
                    <!--end col-md-5-->
                    <div class="col-md-3">
                        <h2>Navigation</h2>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <nav>
                                    <ul class="list-unstyled">
                                        <li>
                                            <a href="#">Home</a>
                                        </li>
                                        <li>
                                            <a href="#">Listing</a>
                                        </li>
                                        <li>
                                            <a href="#">Pages</a>
                                        </li>
                                        <li>
                                            <a href="#">Extras</a>
                                        </li>
                                        <li>
                                            <a href="#">Contact</a>
                                        </li>
                                        <li>
                                            <a href="#">Submit Ad</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <nav>
                                    <ul class="list-unstyled">
                                        <li>
                                            <a href="#">My Ads</a>
                                        </li>
                                        <li>
                                            <a href="#">Sign In</a>
                                        </li>
                                        <li>
                                            <a href="#">Register</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!--end col-md-3-->
                    <div class="col-md-4">
                        <h2>Contact</h2>
                        <address>
                            <figure>
                                124 Abia Martin Drive<br>
                                New York, NY 10011
                            </figure>
                            <br>
                            <strong>Email:</strong> <a href="#">hello@example.com</a>
                            <br>
                            <strong>Skype: </strong> Craigs
                            <br>
                            <br>
                            <a href="contact.html" class="btn btn-primary text-caps btn-framed">Contact Us</a>
                        </address>
                    </div>
                    <!--end col-md-4-->
                </div>
                <!--end row-->
            </div>
            <div class="background">
                <div class="background-image original-size">
                    <img src="assets/img/footer-background-icons.jpg" alt="">
                </div>
                <!--end background-image-->
            </div>
            <!--end background-->
        </div>
    </footer>
    <!--end footer-->
</div>
<!--end page-->

<c:import url="views/user/header/foot.jsp"/>

</body>
</html>
