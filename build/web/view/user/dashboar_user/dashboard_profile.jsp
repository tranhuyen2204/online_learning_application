<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Users" %>
<%
    // Lấy user từ session
    Users user = (Users) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Mini Finance - Profile Page</title>

        <!-- CSS FILES -->      
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@300;400;700&display=swap" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/tooplate-mini-finance.css" rel="stylesheet">

        <style>
            /* Điều chỉnh sidebar */
            #sidebarMenu {
                width: 240px;
                min-width: 240px;
                max-width: 240px;
            }

            /* Điều chỉnh nội dung chính */
            .main-wrapper {
                margin-left: 240px;
                padding: 30px;
                overflow-x: hidden;
            }

            /* Profile image chỉnh cân đối */
            .custom-block-profile {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                padding: 40px;
                background-color: #1e1e2f;
                border-radius: 15px;
            }

            .custom-block-profile-image-wrap {
                position: relative;
                text-align: center;
            }

            .custom-block-profile-image {
                width: 180px;
                height: 180px;
                border-radius: 50%;
                object-fit: cover;
                border: 5px solid #cc204c;
            }

            /* Icon chỉnh sửa */
            .custom-block-edit-icon {
                position: absolute;
                bottom: 10px;
                right: 10px;
                background: #cc204c;
                color: #fff;
                padding: 8px;
                border-radius: 50%;
                font-size: 1.2em;
                transition: 0.3s ease-in-out;
            }

            .custom-block-edit-icon:hover {
                background: #a31a3b;
            }

            /* Thông tin cá nhân */
            .profile-info {
                padding-left: 100px;
                text-align: left;
            }

            .profile-info p {
                font-size: 1.1em;
                margin-bottom: 10px;
            }

            .profile-info strong {
                color: #fff;
                margin-right: 10px;
            }

            .profile-info a {
                color: #cc204c;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <header class="navbar sticky-top flex-md-nowrap">
            <div class="col-md-3 col-lg-3 me-0 px-3 fs-6">
                 <div class="site-logo">
                            <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
                        </div>
            </div>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" 
                    data-bs-toggle="collapse" data-bs-target="#sidebarMenu" 
                    aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-nav me-lg-2">
                <div class="nav-item text-nowrap d-flex align-items-center">
                    <div class="dropdown px-3">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://www.caythuocdangian.com/wp-content/uploads/anh-dai-dien-47.jpg" class="profile-image img-fluid" alt="">
                        </a>
                        <ul class="dropdown-menu bg-white shadow">
                            <li>
                                <div class="dropdown-menu-profile-thumb d-flex">
                

                                    <div class="d-flex flex-column">
                                        <small><span><%= user != null ? user.getFull_name() : "N/A" %></span></small>
                                        <a href="#"><%= user != null ? user.getEmail() : "N/A" %></a>
                                    </div>
                                </div>
                            </li>
                            <li class="border-top mt-3 pt-2 mx-4">
                                <a class="dropdown-item ms-0 me-0" href="${pageContext.request.contextPath}/authen?action=logout">
                                    <i class="bi-box-arrow-left me-2"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-3 d-md-block sidebar collapse">
                    <jsp:include page="../../common/user/sidebarMenu.jsp"></jsp:include>
                    </nav>

                    <main class="main-wrapper col-md-9 ms-sm-auto py-4 col-lg-9 px-md-4 border-start">
                        <div class="title-group mb-3">
                            <h1 class="h2 mb-0">Profile</h1>
                        </div>
                        <div class="row my-4">
                            <div class="col-lg-12 col-12">
                                <div class="custom-block custom-block-profile d-flex">

                                    <div class="profile-info">
                                        <p><strong>Name:</strong> <span><%= user != null ? user.getFull_name() : "N/A" %></span></p>
                                    <p><strong>Email:</strong> <a href="#"><%= user != null ? user.getEmail() : "N/A" %></a></p>
                                    <p><strong>Student ID:</strong> <span><%= user != null ? user.getUser_id() : "N/A" %></span></p>
                                    <p><strong>Role:</strong> <span><%= user != null ? user.getRole() : "N/A" %></span></p>
                                    <p><strong>Status:</strong> <span><%= user != null ? user.getStatus() : "N/A" %></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                                
                    <footer class="site-footer">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-12">
                                    <p class="copyright-text">
                                        Copyright © Mini Finance 2048 
                                        - Design: <a rel="sponsored" href="https://www.tooplate.com" target="_blank">Tooplate</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </footer>
                </main>
            </div>
        </div>

        <!-- JAVASCRIPT FILES -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/custom.js"></script>
    </body>
</html>
