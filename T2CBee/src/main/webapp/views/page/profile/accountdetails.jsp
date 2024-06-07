<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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


            <div id="personal-info" class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Thông tin cá nhân</h4>
                <span class="fs14px text-dark">${name}</span>
                <span class="fs14px text-dark"><fmt:formatDate pattern="yyyy-MM-dd"
                                                               value="${birthday}"/></span>
                <hr class="text-body-secondary">
                <button class="text-black none-underline border-0 bg-white"
                        style="width: 30px;text-align: left" onclick="editPersonalInfo()">Sửa
                </button>
            </div>

            <%--            edit thông tin cá nhân--%>

            <div id="edit-personal-info" style="display: none;" class="card">

                <form action="cap-nhat-thong-tin" method="post" class="card p-4 rounded-0 mb-3">
                    <h4 class="py-3">Thông tin cá nhân</h4>
                    <label for="name" class="fs15px text-dark">Tên</label>
                    <input type="text" class="form-control rounded-0 focus-none" id="name" name="name" value="${name}">
                    <label for="birthday" class="fs15px text-dark">Ngày sinh</label>
                    <input type="date" class="form-control rounded-0 focus-none" id="birthday" name="birthday"
                           value="${birthday}">

                    <hr class="text-body-secondary">
                    <div>
                        <button type="submit" class="text-black none-underline border-0 bg-white"
                                style="width: 30px;text-align: left;margin-right: 30px">OK
                        </button>

                        <button type="button" class="text-black none-underline border-0 bg-white"
                                style="width: 30px;text-align: left" onclick="offEditPersonalInfo()">Hủy
                        </button>
                    </div>
                </form>

            </div>

            <%--            ! edit thông tin cá nhân--%>


            <div id="personal-email" class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Email</h4>
                <span class="fs14px text-dark">${email}</span>
                <hr class="text-body-secondary">
                <button class="text-black none-underline border-0 bg-white"
                        style="width: 30px;text-align: left" onclick="editPersonalEmail()">Sửa
                </button>
            </div>


            <%--            edit email--%>

            <div id="edit-personal-email" style="display: none;" class="card">

                <form action="cap-nhat-email" method="post" class="card p-4 rounded-0 mb-3">
                    <h4 class="py-3">Email</h4>
                    <label for="email" class="fs15px text-dark">Email</label>
                    <input type="email" class="form-control rounded-0 focus-none" id="email" name="email" value="${email}">

                    <hr class="text-body-secondary">
                    <div>
                        <button type="submit" class="text-black none-underline border-0 bg-white"
                                style="width: 30px;text-align: left;margin-right: 30px">OK
                        </button>

                        <button type="button" class="text-black none-underline border-0 bg-white"
                                style="width: 30px;text-align: left" onclick="offEditPersonalEmail()">Hủy
                        </button>
                    </div>
                </form>

            </div>

            <%--            ! edit email--%>


            <div id="personal-password" class="card p-4 rounded-0 mb-3">
                <h4 class="py-3">Mật Khẩu</h4>
                <span class="fs14px text-dark">**********</span>
                <hr class="text-body-secondary">
                <button class="text-black none-underline border-0 bg-white"
                        style="width: 30px;text-align: left" onclick="editPersonalPassword()">Sửa
                </button>
            </div>


            <%--            edit password--%>

            <div id="edit-personal-password" style="display: none;" class="card">

                <form action="cap-nhat-mat-khau" method="post" class="card p-4 rounded-0 mb-3">
                    <h4 class="py-3">Mật Khẩu</h4>

                    <c:if test="${error!=null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                    </c:if>

                    <label for="pwOld" class="fs15px text-dark">Mật khẩu cũ</label>
                    <input type="password" class="form-control rounded-0 focus-none" id="pwOld" name="pwOld" value="">
                    <label for="pwNew" class="fs15px text-dark">Mật khẩu mới</label>
                    <input type="password" class="form-control rounded-0 focus-none" id="pwNew" name="pwNew" value="">
                    <label for="pwRepeat" class="fs15px text-dark">Xác nhận mật khẩu mới</label>
                    <input type="password" class="form-control rounded-0 focus-none" id="pwRepeat" name="pwRepeat" value="">

                    <hr class="text-body-secondary">
                    <div>
                        <button type="submit" class="text-black none-underline border-0 bg-white"
                                style="width: 30px;text-align: left;margin-right: 30px">OK
                        </button>

                        <button type="button" class="text-black none-underline border-0 bg-white"
                                style="width: 30px;text-align: left" onclick="offEditPersonalPassword()">Hủy
                        </button>
                    </div>
                </form>

            </div>

            <%--            ! edit password--%>


        </div>

    </div>

</div>

<script>

    function editPersonalInfo() {
        document.getElementById("personal-info").style.display = "none";
        document.getElementById("edit-personal-info").style.display = "flex";
    }

    function offEditPersonalInfo() {
        document.getElementById("personal-info").style.display = "flex";
        document.getElementById("edit-personal-info").style.display = "none";
    }

    function editPersonalEmail() {
        document.getElementById("personal-email").style.display = "none";
        document.getElementById("edit-personal-email").style.display = "flex";
    }

    function offEditPersonalEmail() {
        document.getElementById("personal-email").style.display = "flex";
        document.getElementById("edit-personal-email").style.display = "none";
    }

    function editPersonalPassword() {
        document.getElementById("personal-password").style.display = "none";
        document.getElementById("edit-personal-password").style.display = "flex";
    }

    function offEditPersonalPassword() {
        document.getElementById("personal-password").style.display = "flex";
        document.getElementById("edit-personal-password").style.display = "none";
    }

</script>