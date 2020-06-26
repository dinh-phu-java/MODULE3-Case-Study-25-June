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
                <div class="row justify-content-center">
                    <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
                        <ul style="color:red;margin-top:15px;">
                            <c:forEach items="${message}" var="m">
                                <li>${m}</li>
                            </c:forEach>
                        </ul>
                        <form class="form clearfix" action="user-action" method="POST">
                            <input type="hidden" name="action" value="login">

                            <div class="form-group">
                                <label for="userName" class="col-form-label required">User Name</label>
                                <input name="userName" type="text" class="form-control" id="userName" placeholder="User Name" required>
                            </div>
                            <!--end form-group-->

                            <div class="form-group">
                                <label for="password" class="col-form-label required">Password</label>
                                <input name="password" type="password" class="form-control" id="password" placeholder="Password" required>
                            </div>
                            <!--end form-group-->

                            <div class="d-flex justify-content-between align-items-baseline">
                                <button type="submit" class="btn btn-danger">Login</button>
                            </div>
                        </form>

                    </div>
                    <!--end col-md-6-->
                </div>
                <!--end row-->
            </div>
            <!--end container-->
        </section>
        <!--end block-->

    </section>
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
