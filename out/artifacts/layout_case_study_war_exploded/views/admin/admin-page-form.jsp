<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <form method="POST" action="user-control">
            <%--            <input type="hidden" name="action" value="change-password">--%>
            <div class="row">
                <div class="col-md-8">
                    <h2>Order List: Hello admin ${loginUser.userName}</h2>
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
                                        <th>Confirm Order</th>
                                    </tr>
                                    <c:forEach items="${infoList}" var="info">
                                        <tr>
                                            <td>${info[0]}</td>
                                            <td>${info[1]}</td>
                                            <td>${info[2]}</td>
                                            <td>${info[3]}</td>
                                            <td>${info[4]}</td>
                                            <td><a href="#">Detail</a></td>
                                            <td><a href="/admin-controller?action=confirm-order&order-id=${info[0]}">Confirm</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </section>

                </div>
                <!--end col-md-8-->
            </div>
        </form>
    </section>
</div>