<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">MY ACCOUNT</span>
    <h4>Address Book</h4>

    <hr class="mt-5">




</div>


<div class="container-fluid px-4 ">






    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>



        </div>



        <div class="col-9">


            <!-- <div class="row text-center" style="margin-left: -33.33%;">

                        <h1 class="my-5"><i class="bi bi-info-circle"></i></h1>
                        <h4>You don’t have any saved addresses</h4>
                        <span class="fs14px">Add an address to check out more quickly</span>
                        <a href="" class="text-body-secondary"  data-bs-toggle="modal" data-bs-target="#exampleModal" >Add an address</a>

                    </div>   -->




            <div class="row d-flex">

                <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal"
                    class="card col-6 m-2 card-2-items-inline rounded-0 none-underline d-flex justify-content-center text-center"
                    style="border: 1px solid rgb(210,210,210)">

                    <span class="text-body-secondary fs15px">Add an address</span>

                </a>


                <jsp:include page="../../component/cp-address.jsp"></jsp:include>

            </div>




            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>





        </div>

    </div>

</div>