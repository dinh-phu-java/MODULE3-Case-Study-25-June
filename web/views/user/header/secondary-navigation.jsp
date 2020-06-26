<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="secondary-navigation">
    <div class="container">
        <ul class="left">
            <li>
                            <span>
                                <i class="fa fa-phone"></i> +1 123 456 789
                            </span>
            </li>
        </ul>
        <!--end left-->
        <ul class="right">
            <c:choose>
                <c:when test="${sessionScope.loginUser == null}">

                    <li>
                        <a href="<c:url value="/register-user?action=login"/>">
                            <i class="fa fa-sign-in"></i>Sign In
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/register-user?action=register-user"/>">
                            <i class="fa fa-pencil-square-o"></i>Register
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href='<c:url value="/user-control?action=user-profile"/>'><i class="fa fa-user"></i> ${sessionScope.loginUser.fullName}</a>
                    </li>
                    <li>
                        <a href='<c:url value="/user-control?action=user-logout"/>' ><i class="fa fa-sign-out"></i> Logout</a>
                    </li>
                </c:otherwise>
            </c:choose>


        </ul>
        <!--end right-->
    </div>
    <!--end container-->
</div>