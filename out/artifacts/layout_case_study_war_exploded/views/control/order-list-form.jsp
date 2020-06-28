<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <form method="POST" action="user-control">
<%--            <input type="hidden" name="action" value="change-password">--%>
            <div class="row">
                <div class="col-md-8">

                    <h2>Order List</h2>
                    <section>
                        <div class="row">

                            <div class="col-md-12">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Shipped Date</th>
                                        <th>Status</th>
                                        <th>Total Price</th>
                                        <th>Order detail</th>
                                    </tr>
                                    <c:forEach items="${orderList}" var="order">
                                        <tr>
                                            <td>${order.order_id}</td>
                                            <td>${order.order_date}</td>
                                            <td>${order.shipped_date}</td>
                                            <td>Total Price: $?</td>
                                            <td><a href="#">Detail</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>


                            </div>


                        </div>

                    </section>

<%--                    <section class="clearfix">--%>
<%--                        <button type="submit" class="btn btn-outline-danger float-left">Save Changes</button>--%>
<%--                    </section>--%>

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