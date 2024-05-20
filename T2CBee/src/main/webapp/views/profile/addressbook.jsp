<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/profile-css.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">


</head>

<body>




        <jsp:include page="../component/header.jsp"></jsp:include>




    <div class="container-fluid text-center" style="padding-top: 195px">

        <span class="text-body-secondary fs14px">MY ACCOUNT</span>
        <h4>Address Book</h4>

        <hr class="mt-5">




    </div>


    <div class="container-fluid px-4 ">






        <div class="row">

            <div class="col-3">


                               <jsp:include page="../component/list-info.jsp"></jsp:include>



            </div>



            <div class="col-9">


                <!-- <div class="row text-center" style="margin-left: -33.33%;">

                        <h1 class="my-5"><i class="bi bi-info-circle"></i></h1>
                        <h4>You don’t have any saved addresses</h4>
                        <span class="fs14px">Add an address to check out more quickly</span>
                        <a href="" class="text-body-secondary"  data-bs-toggle="modal" data-bs-target="#exampleModal" >Add an address</a>

                    </div>   -->




                <div class="row d-flex">

                    <a href=""  data-bs-toggle="modal" data-bs-target="#exampleModal"
                        class="card col-6 m-2 card-2-items-inline rounded-0 none-underline d-flex justify-content-center text-center" style="border: 1px solid rgb(210,210,210)">

                        <span class="text-body-secondary fs15px">Add an address</span>

                    </a>


      <jsp:include page="../component/cp-address.jsp"></jsp:include>

                </div>




                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
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





        <jsp:include page="../component/footer.jsp"></jsp:include>
        
        
        
        

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>