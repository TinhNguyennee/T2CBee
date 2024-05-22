<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
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
      <form action="#">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Họ và tên</span>
            <input type="text" placeholder="Nhập tên của bạn" required> <br>
          </div>
          <div class="input-box">
            <span class="details">Nhập mật khẩu</span>
            <input type="text" placeholder="Nhập mật khẩu " required>
          </div>
          <div class="radio">
            <input type="checkbox" id="checkboxId" name="checkboxName">
            <label for="checkboxId">Forgot password?</label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Đăng Nhập">
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