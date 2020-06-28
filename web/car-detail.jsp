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
        <c:import url="views/user/content/car-detail-form.jsp"/>
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
