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
                                        <th>Seller</th>
                                        <th>Car Name</th>
                                        <th>Price</th>
                                    </tr>
                                    <c:forEach items="${infoList}" var="info">
                                        <tr>
                                            <td>
                                                <a href="/user-control?action=show-order-list" >
                                                    ${info[0]}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="/home?action=owner-car-list&user-id=${info[4]}&page=1">${info[1]}</a>
                                            </td>
                                            <td>${info[2]}</td>
                                            <td>${info[3]}</td>
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