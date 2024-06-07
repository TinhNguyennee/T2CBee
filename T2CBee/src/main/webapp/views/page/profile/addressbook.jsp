<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">Tài Khoản Của Tôi</span>
    <h4>Địa Chỉ</h4>

    <hr class="mt-5">


</div>


<div class="container-fluid px-4 ">


    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>


        </div>


        <div class="col-9">


            <c:if test="${fullAddress == null}">


                <div class="row text-center" style="margin-left: -33.33%;">

                    <h1 class="my-5"><i class="bi bi-info-circle"></i></h1>
                    <h4>Bạn chưa cài đặt địa chỉ !</h4>
                    <span class="fs14px text-dark">Vui lòng thêm địa chỉ để đặt hàng</span>
                    <a href="" class="text-body-secondary mb-5" data-bs-toggle="modal" data-bs-target="#exampleModal">Add an
                        address</a>

                </div>


            </c:if>


            <c:if test="${fullAddress != null}">

                <div class="row d-flex">


                    <jsp:include page="../../component/cp-address.jsp"></jsp:include>

                </div>

            </c:if>


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thông tin Địa chỉ</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Form bắt đầu ở đây -->
                            <form id="addressForm" method="post" action="so-dia-chi">
                                <div class="mb-3">
                                    <label for="city" class="form-label">Thành Phố/Tỉnh</label>
                                    <select class="form-select" id="city" name="city" required>
                                        <option value="">Chọn Thành Phố/Tỉnh</option>
                                        <c:forEach var="province" items="${provinces}">
                                            <option value="${province}">${province}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" name="address"
                                           placeholder="Nhập Địa chỉ" required>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy
                                    </button>
                                    <button type="submit" class="btn btn-primary">Lưu
                                    </button>
                                </div>
                            </form>
                            <!-- Form kết thúc ở đây -->
                        </div>

                    </div>
                </div>
            </div>


        </div>

    </div>

</div>