<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <form method="POST" action="user-control">
<%--            <input type="hidden" name="action" value="change-password">--%>
            <div class="row">
                <div class="col-md-8">

                    <h2>Change Password</h2>
                    <section>
                        <div class="row">
                           <c:forEach items="${orderList}" var="order">
                            <div class="col-md-12">
                                <p>${order.order_id}</p>
                                <p>${order.order_date}</p>
                                <p>${order.shipped_date}</p>
                            </div>
                           </c:forEach>

                        </div>
                        <!--end row-->
                        <!--end form-group-->

                    </section>

                    <section class="clearfix">
                        <button type="submit" class="btn btn-outline-danger float-left">Save Changes</button>
                    </section>

<%--                    <p style="color:green;">${message}</p>--%>
<%--                    <c:if test="${message !=null}">--%>
<%--                        <c:remove  var="message"/>--%>
<%--                    </c:if>--%>
                </div>
                <!--end col-md-8-->

            </div>
        </form>

    </section>
</div>