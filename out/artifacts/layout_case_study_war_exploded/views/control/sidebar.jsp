<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="main-sidebar sidebar-dark-primary elevation-4">

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="dist/img/avatar.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Alexander Pierce</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item has-treeview">
                    <a href="<c:url value="/home"/>" class="nav-link">
                        <i class="fa fa-home"></i>
                        <p>

                            Home
                        </p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="<c:url value="/user-control?action=user-profile"/>" class="nav-link">
                        <i class="fa fa-user"></i>
                        <p>
                            My Profile
                        </p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="<c:url value="/user-control?action=my-car-list"/>" class="nav-link">
                        <i class="fa fa-list"></i>
                        <p>
                            My Car List
                        </p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="<c:url value="/user-control?action=change-password"/>" class="nav-link">
                        <i class="fa fa-user-edit"></i>
                        <p>
                            Change Password
                        </p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="<c:url value="/user-control?action=add-car"/>" class="nav-link">
                        <i class="fa fa-adjust"></i>
                        <p>
                            Add Car
                        </p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="<c:url value="/user-control?action=user-logout"/>" class="nav-link">
                        <i class="fa fa-anchor"></i>
                        <p>
                            Log Out
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>