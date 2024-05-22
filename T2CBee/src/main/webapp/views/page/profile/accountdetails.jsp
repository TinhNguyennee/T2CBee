<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">MY ACCOUNT</span>
    <h4>Account Details</h4>

    <hr class="mt-5">




</div>


<div class="container-fluid px-4 ">





    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>



        </div>



        <div class="col-9">


            <div class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Personal Information</h4>
                <span class="fs14px">${name}</span>
                <span class="fs14px">${birthday}</span>
                <hr class="text-body-secondary">
                <a href="" class="text-black none-underline">Edit</a>
            </div>

            <div class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Email address</h4>
                <span class="fs14px">${email}</span>
                <hr class="text-body-secondary">
                <a href="" class="text-black none-underline">Edit</a>
            </div>

            <div class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Password</h4>
                <span class="fs14px">${password}</span>
                <hr class="text-body-secondary">
                <a href="" class="text-black none-underline">Edit</a>
            </div>

        </div>

    </div>

</div>