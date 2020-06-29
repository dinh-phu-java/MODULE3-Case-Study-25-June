<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <form method="POST" action="user-control">
            <%--            <input type="hidden" name="action" value="change-password">--%>
            <div class="row">
                <div class="col-md-8">
                    <h2>${loginUser.userName} Sold Items: </h2>
                    <section>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <th>Car Id</th>
                                        <th>Seller</th>
                                        <th>Car Name</th>
                                        <th>Car Price</th>
                                        <th>Vendor</th>
                                        <th>Status</th>
                                    </tr>
                                    <c:forEach items="${infoList}" var="car">
                                        <tr>
                                            <td>${car[0]}</td>
                                            <td>${car[1]}</td>
                                            <td>${car[2]}</td>
                                            <td>${car[3]}</td>
                                            <td>${car[4]}</td>
                                            <td>${car[5]}</td>
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