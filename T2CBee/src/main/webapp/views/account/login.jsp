<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title> Trang đăng nhập </title>
  <link rel="stylesheet" href="../../css/login.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="body-acc">
  <div class="container-acc">
    <div class="title">ĐĂNG NHẬP</div>
    <div class="content">
      <form action="dang-nhap" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Họ và tên</span>
            <input name="username" type="text" placeholder="Nhập tên của bạn" required> <br>
          </div>
          <div class="input-box">
            <span class="details">Nhập mật khẩu</span>
            <input name="password" type="text" placeholder="Nhập mật khẩu " required>
          </div>
          <div class="radio">
            <input type="checkbox" id="checkboxId" name="checkboxName">
            <label for="checkboxId">Lưu lại mật khẩu?</label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Đăng Nhập">
        </div>
        <div class="registere">
          <span>Bạn chưa có tài khoản?Đăng ký <a href="/dang-ky">Tại Đây</a></span>
        </div>
        <div class="icon"
          style="justify-content: space-between; justify-content: space-between;padding: 0 20px; margin: 30px;display: flex;">
          <i class="bi bi-facebook"></i>
          <i class="bi bi-google"></i>
          <i class="bi bi-instagram"></i>
          <i class="bi bi-twitter-x"></i>
        </div>
      </form>
    </div>
  </div>

</body>

</html>