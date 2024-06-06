<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/profile-css.css">


<div href="" class="card col-6 m-2 card-2-items-inline rounded-0 none-underline pt-3"
    style="border: 1px solid rgb(210,210,210)">

    <span class="fs15px text-dark">${name}</span>
    <span class="fs15px text-dark">${city}</span>
    <span class="fs15px text-dark">${address}</span>
    <span class="fs15px text-dark">${numberphone}</span>
    <hr class="text-body-secondary">
    <div class="d-flex">
        <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal" class="text-black none-underline pb-3 fs15px">Sửa</a>
        <a href="xoa-dia-chi" class="text-black none-underline pb-3 mx-4 fs15px">Xóa</a>
    </div>
</div>