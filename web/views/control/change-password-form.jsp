<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <form method="POST" action="user-control">
            <input type="hidden" name="action" value="change-password">
            <div class="row">
                <div class="col-md-8">

                    <h2>Change Password</h2>
                    <section>
                        <div class="row">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label  class="col-form-label required">Current Password</label>
                                    <input name="currentPassword" type="password" class="form-control"  placeholder="Current Password"  required>
                                </div>
                                <!--end form-group-->
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label  class="col-form-label required">New Password</label>
                                    <input name="newPassword" type="password" class="form-control"  placeholder="New Password"  required>
                                </div>
                                <!--end form-group-->
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label  class="col-form-label required">Confirm New Password</label>
                                    <input name="confirmNewPassword" type="password" class="form-control"  placeholder="Confirm Password"  required>
                                </div>
                                <!--end form-group-->
                            </div>
                            <!--end col-md-8-->
                        </div>
                        <!--end row-->
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