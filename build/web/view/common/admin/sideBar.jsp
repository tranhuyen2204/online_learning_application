<%-- 
    Document   : sideBar
    Created on : Mar 8, 2025, 11:52:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3><img src="img/logo.png" class="img-fluid"/><span>Vishweb design</span></h3>
            </div>
            <!-- Sidebar -->
            <div class="sidebar d-flex flex-column p-3">
                <h4 class="text-center py-3 border-bottom">TicketBox Admin</h4>
                <ul class="list-unstyled components">
                    <!-- Manage Courses -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/course" class="nav-link active">
                            <i class="material-icons">book</i><span>Manage Courses</span>
                        </a>
                    </li>

                    <!-- Manage Enrollments -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/enrollments" class="nav-link">
                            <i class="material-icons">group</i><span>Manage Enrollments</span>
                        </a>
                    </li>

                    <!-- Manage Users -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/user" class="nav-link">
                            <i class="material-icons">person</i><span>Manage Users</span>
                        </a>
                    </li>

                    <!-- Manage Rooms -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/room" class="nav-link">
                            <i class="material-icons">meeting_room</i><span>Manage Rooms</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Content Area -->
            <div class="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Profile</a>
                                </li>
                                <li class="nav-link">
                                    <a href="${pageContext.request.contextPath}/authen?action=home">Home</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- Your page content goes here -->
            </div>

        </nav>
    </body>
</html>
