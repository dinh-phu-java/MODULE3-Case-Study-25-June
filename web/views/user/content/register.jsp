<section class="block">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
                <form class="form clearfix" action="user-action" method="POST">
                    <input type="hidden" name="action" value="register">
                    <div class="form-group">
                        <label for="fullName" class="col-form-label required">Full Name</label>
                        <input name="fullName" type="text" class="form-control" id="fullName" placeholder="Full Name" required>
                    </div>
                    <div class="form-group">
                        <label for="userName" class="col-form-label required">User Name</label>
                        <input name="userName" type="text" class="form-control" id="userName" placeholder="User Name" required>
                    </div>
                    <!--end form-group-->
                    <div class="form-group">
                        <label for="email" class="col-form-label required">Email</label>
                        <input name="email" type="email" class="form-control" id="email" placeholder="Your Email" required>
                    </div>
                    <!--end form-group-->
                    <div class="form-group">
                        <label for="address" class="col-form-label required">Address</label>
                        <input name="address" type="text" class="form-control" id="address" placeholder="Your Address" required>
                    </div>
                    <!--end form-group-->
                    <div class="form-group">
                        <label for="password" class="col-form-label required">Password</label>
                        <input name="password" type="password" class="form-control" id="password" placeholder="Password" required>
                    </div>
                    <!--end form-group-->
                    <div class="form-group">
                        <label for="repeat_password" class="col-form-label required">Repeat Password</label>
                        <input name="repeat_password" type="password" class="form-control" id="repeat_password" placeholder="Repeat Password" required>
                    </div>
                    <!--end form-group-->
                    <div class="d-flex justify-content-between align-items-baseline">
                        <label>
                            <input type="checkbox" name="newsletter" value="1">
                            Receive Newsletter
                        </label>
                        <button type="submit" class="btn btn-danger">Register</button>
                    </div>
                </form>
                <hr>
                <p>
                    By clicking "Register" button, you agree with our <a href="#" class="link">Terms & Conditions.</a>
                </p>
            </div>
            <!--end col-md-6-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</section>