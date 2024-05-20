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
        <h4>Account Details</h4>

        <hr class="mt-5">




    </div>


    <div class="container-fluid px-4 ">


       


        <div class="row">

            <div class="col-3">


                <jsp:include page="../component/list-info.jsp"></jsp:include>



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






      <jsp:include page="../component/footer.jsp"></jsp:include>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>