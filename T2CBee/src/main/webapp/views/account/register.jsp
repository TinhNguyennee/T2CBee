<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title> Trang đăng ký </title>
  <link rel="stylesheet" href="../../css/register.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body class="body-acc">
  <div class="container-acc">
    <div class="title">ĐĂNG KÝ</div>
    <div class="content">
      <form action="#">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Họ và tên</span>
            <input type="text" placeholder="Nhập tên của bạn" required>
          </div>
          <div class="input-box">
            <span class="details">Tên tài khoản</span>
            <input type="text" placeholder="Nhập tên dùng của bạn" required>
          </div>
          <div class="input-box">
            <span class="details">Nhập địa chỉ</span>
            <input type="text" placeholder="Nhập địa chỉ của bạn" required>
          </div>
          <div class="input-box">
            <span class="details">Nhập số điện thoại</span>
            <input type="text" placeholder="Nhập số điện thoại " required>
          </div>
          <div class="input-box">
            <span class="details">Nhập mật khẩu</span>
            <input type="text" placeholder="Nhập mật khẩu " required>
          </div>
          <div class="input-box">
            <span class="details">Nhập xác nhận mật khẩu</span>
            <input type="text" placeholder="Nhập xác nhận mật khẩu" required>
          </div>
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" id="dot-1">
          <input type="radio" name="gender" id="dot-2">
          <!-- <input type="radio" name="gender" id="dot-3"> -->
          <span class="gender-title">Giới tính</span>
          <div class="category">
            <label for="dot-1">
              <span class="dot one"></span>
              <span class="gender">Nam</span>
            </label>
            <label for="dot-2">
              <span class="dot two"></span>
              <span class="gender">Nữ</span>
            </label>
            <!-- <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender">Ẩn giới tính</span>
            </label> -->
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Đăng ký">
        </div>
      </form>
    </div>
  </div>

</body>

</html>