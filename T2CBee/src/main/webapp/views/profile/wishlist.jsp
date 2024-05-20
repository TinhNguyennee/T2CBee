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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">


</head>

<body>




        <jsp:include page="../component/header.jsp"></jsp:include>




    <div class="container-fluid text-center" style="padding-top: 195px">

        <span class="text-body-secondary fs14px">MY ACCOUNT</span>
        <h4>Wish List</h4>

        <hr class="mt-5">




    </div>


    <div class="container-fluid px-4 ">


        <div class="row">

            <div class="dropdown d-flex justify-content-end">
                <button class="btn btn-secondary btn-sm dropdown-toggle rounded-0 bg-white text-black" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Sort By
                </button>
                <ul class="dropdown-menu rounded-0">
                  <li><a class="dropdown-item list-hover" href="#">Recently Add</a></li>
                  <li><a class="dropdown-item list-hover" href="#">Price High to Low</a></li>
                  <li><a class="dropdown-item list-hover" href="#">Price Low to High</a></li>
                </ul>
              </div>

        </div>



        <div class="row">

            <div class="col-3">


                   <jsp:include page="../component/list-info.jsp"></jsp:include>



            </div>

           

            <div class="col-9">

                
                <div class="row d-flex">

               <jsp:include page="../component/cp-product.jsp"></jsp:include>


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