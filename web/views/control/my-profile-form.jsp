<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <form method="POST" action="user-control">
            <input type="hidden" name="action" value="edit-profile">
            <div class="row">
                <div class="col-md-8">

                    <h2>Personal Information</h2>
                    <section>
                        <div class="row">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fullName" class="col-form-label required">Full Name</label>
                                    <input name="fullName" type="text" class="form-control" id="fullName" placeholder="Your Name" value="${sessionScope.loginUser.fullName}" required>
                                </div>
                                <!--end form-group-->
                            </div>
                            <!--end col-md-8-->
                        </div>
                        <!--end row-->
                        <div class="form-group">
                            <label for="userName" class="col-form-label required">Your username</label>
                            <input name="userName" type="text" class="form-control" id="userName" placeholder="Your username" value="${sessionScope.loginUser.userName}" disabled>
                        </div>
                        <!--end form-group-->

                    </section>

                    <section>
                        <h2>Contact</h2>
                        <div class="form-group">
                            <label for="address" class="col-form-label">Address</label>
                            <input name="address" type="text" class="form-control" id="address" placeholder="Your Address" value="${sessionScope.loginUser.address}">
                        </div>
                        <!--end form-group-->
                        <div class="form-group">
                            <label for="email" class="col-form-label">Email</label>
                            <input name="email" type="email" class="form-control" id="email" placeholder="Your Email" value="${sessionScope.loginUser.email}" disabled>
                        </div>
                        <!--end form-group-->
                    </section>

                    <section class="clearfix">
                        <button type="submit" class="btn btn-outline-danger float-left">Save Changes</button>
                    </section>

                    <p style="color:green;">${message}</p>
                    <c:if test="${message !=null}">
                        <c:remove  var="message"/>
                    </c:if>
                </div>
                <!--end col-md-8-->

            </div>
        </form>
    </section>
</div>