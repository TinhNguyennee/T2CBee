<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>T2CBee - Xác nhận mật khẩu</title>
    <%@include file="../component/css-embed.jsp" %>

</head>

<body class="bg-secondary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Thay Đổi Mật Khẩu</h1>
                                        <p class="mb-4">Nhập mật khẩu mới và chúng tôi sẽ thay đổi nó cho bạn!</p>
                                    </div>
                                    <c:if test="${message != null}">
                                        <div class="alert ${alertCssClass} alert-dismissible">
                                                ${message}
                                        </div>
                                    </c:if>
                                    <form class="user" action="${pageContext.request.contextPath}/admin/thay-doi-mat-khau" method="POST">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                 aria-describedby="emailHelp"
                                                placeholder="Mật khẩu..." name="matKhau" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                    aria-describedby="d"
                                                   placeholder="Xác nhận mật khẩu..." name="nhapLaiMatKhau" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            Thay Đổi Mật Khẩu
                                        </button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/admin/dang-nhap">Đã có tài khoản? Đăng nhập!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</body>

</html>