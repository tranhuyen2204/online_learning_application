<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> efd4cba7778f4028de96bfcbef08514a5650e4e1
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mini Finance - Settings</title>

        <!-- CSS FILES -->
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

            /* Chỉnh sửa khoảng cách form */
            .profile-form .form-control, .password-form .form-control {
                margin-bottom: 15px;
            }

            /* Căn chỉnh nút Reset & Update */
            .d-flex button {
                padding: 10px;
                font-size: 1em;
            }

            /* Chỉnh sửa dropdown notifications */
            .dropdown .notifications-block-wrap {
                max-width: 300px;
                word-wrap: break-word;
            }
        </style>
    </head>

    <body>
        <header class="navbar sticky-top flex-md-nowrap">
            <div class="col-md-3 col-lg-3 me-0 px-3 fs-6">
                <a class="navbar-brand" href="wallet.html">
                    <i class="bi-box"></i>
                    Mini Finance
                </a>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-3 d-md-block sidebar collapse">
                    <jsp:include page="../../common/user/sidebarMenu.jsp"></jsp:include>
                    </nav>

                    <main class="main-wrapper col-md-9 ms-sm-auto py-4 col-lg-9 px-md-4 border-start">
                        <div class="title-group mb-3">
                            <h1 class="h2 mb-0">Settings</h1>
                        </div>

                        <div class="row my-4">
                            <div class="col-lg-12 col-12">
                                <div class="custom-block bg-white">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab">Profile</button>
                                        </li>

                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="password-tab" data-bs-toggle="tab" data-bs-target="#password-tab-pane" type="button" role="tab">Password</button>
                                        </li>
                                    </ul>

                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="profile-tab-pane">
                                            <h6 class="mb-4">User Profile</h6>
<<<<<<< HEAD
                                        <c:if test="${not empty message}">
=======
<<<<<<< HEAD

                                            <form class="custom-form profile-form" action="#" method="post">
                                                <input class="form-control" type="text" name="profile-name" placeholder="John Doe">
                                                <input class="form-control" type="email" name="profile-email" placeholder="Johndoe@gmail.com">

                                                <div class="d-flex">
                                                    <button type="button" class="form-control me-3">Reset</button>
                                                    <button type="submit" class="form-control ms-2">Update</button>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="tab-pane fade" id="password-tab-pane">
                                            <h6 class="mb-4">Password</h6>

                                            <form class="custom-form password-form" action="#" method="post">
                                                <input type="password" name="password" class="form-control" placeholder="Current Password" required="">
                                                <input type="password" name="new_password" class="form-control" placeholder="New Password" required="">
                                                <input type="password" name="confirm_password" class="form-control" placeholder="Confirm Password" required="">

                                                <div class="d-flex">
                                                    <button type="button" class="form-control me-3">Reset</button>
                                                    <button type="submit" class="form-control ms-2">Update Password</button>
                                                </div>
                                            </form>
                                        </div>
=======
                                            <c:if test="${not empty message}">
>>>>>>> 323fd40f5979c0aea985a37d2ae304a6c9a1f7b8
                                            <div class="alert alert-success" role="alert">
                                                ${message}
                                            </div>
                                            <c:remove var="message" scope="session"/>
                                        </c:if>

                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger" role="alert">
                                                ${error}
                                            </div>
                                            <c:remove var="error" scope="session"/>
                                        </c:if>

                                        <form class="custom-form profile-form" action="${pageContext.request.contextPath}/user/settings?action=account" method="post">
                                            <input class="form-control" type="text" name="profile-name" value="${user.full_name}" placeholder="Enter your name">
                                            <input class="form-control" type="email" name="profile-email" value="${user.email}" placeholder="Enter your email">

                                            <div class="d-flex">
                                                <button type="reset" class="form-control me-3">Reset</button>
                                                <button type="submit" class="form-control ms-2">Update</button>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade" id="password-tab-pane">
                                        <h6 class="mb-4">Password</h6>
                                        <!-- Hiển thị thông báo lỗi -->
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger" role="alert">
                                                ${errorMessage}
                                            </div>
                                            <c:remove var="errorMessage" scope="session"/>
                                        </c:if>

                                        <!-- Hiển thị thông báo thành công -->
                                        <c:if test="${not empty successMessage}">
                                            <div class="alert alert-success" role="alert">
                                                ${successMessage}
                                            </div>
                                            <c:remove var="successMessage" scope="session"/>
                                        </c:if>

                                        <form class="custom-form password-form" action="${pageContext.request.contextPath}/user/settings?action=pass" method="post">
                                            <input type="password" name="password" class="form-control" placeholder="Current Password" required="">
                                            <input type="password" name="new_password" class="form-control" placeholder="New Password" required="">
                                            <input type="password" name="confirm_password" class="form-control" placeholder="Confirm Password" required="">

                                            <div class="d-flex">
                                                <button type="button" class="form-control me-3">Reset</button>
                                                <button type="submit" class="form-control ms-2">Update Password</button>
                                            </div>
                                        </form>
>>>>>>> efd4cba7778f4028de96bfcbef08514a5650e4e1
                                    </div>
                                </div>
                            </div>
                        </div>
<<<<<<< HEAD

                        <footer class="site-footer">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 col-12">
                                        <p class="copyright-text">Copyright © Mini Finance 2048 
                                            - Design: <a href="https://www.tooplate.com" target="_blank">Tooplate</a></p>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </main>
                </div>
            </div>

            <!-- JAVASCRIPT FILES -->
            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
=======
                    </div>

                    <footer class="site-footer">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-12">
                                    <p class="copyright-text">Copyright © Mini Finance 2048 
                                        - Design: <a href="https://www.tooplate.com" target="_blank">Tooplate</a></p>
                                </div>
                            </div>
                        </div>
                    </footer>
                </main>
            </div>
        </div>

        <!-- JAVASCRIPT FILES -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
>>>>>>> efd4cba7778f4028de96bfcbef08514a5650e4e1
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/custom.js"></script>

    </body>
</html>
