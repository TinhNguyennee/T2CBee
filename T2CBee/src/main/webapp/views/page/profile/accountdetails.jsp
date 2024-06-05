<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">Tài Khoản Của Tôi</span>
    <h4>Tài Khoản</h4>

    <hr class="mt-5">




</div>


<div class="container-fluid px-4 ">





    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>



        </div>



        <div class="col-9">


            <div class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Thông tin cá nhân</h4>
                <span class="fs14px">${name}ten</span>
                <span class="fs14px">${birthday}ngaysinh</span>
                <hr class="text-body-secondary">
                <a href="" class="text-black none-underline">Sửa</a>
            </div>

            <div class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Email</h4>
                <span class="fs14px">${email}mail</span>
                <hr class="text-body-secondary">
                <a href="" class="text-black none-underline">Sửa</a>
            </div>

            <div class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Mật Khẩu</h4>
                <span class="fs14px">${password}****</span>
                <hr class="text-body-secondary">
                <a href="" class="text-black none-underline">Sửa</a>
            </div>

        </div>

    </div>

</div>