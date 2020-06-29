<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <title>AdminLTE 3 | Editors</title>
    <c:import url="views/control/head-admin.jsp"/>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <c:if test="${loginUser.userName=='admin'}">
    <!-- Navbar -->
        <c:import url="views/control/navbar.jsp"/>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <c:import url="views/admin/sidebar.jsp"/>

        <!-- Content Wrapper. Contains page content -->
        <c:import url="views/admin/admin-page-form.jsp"/>
    <!-- /.content-wrapper -->
    </c:if>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<c:import url="views/control/foot-admin.jsp"/>
</body>
</html>
