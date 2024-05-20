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
    





    <div class="container-fluid" style="padding-top: 195px">


        <div class="profile-top w-100 d-flex align-items-end pb-5" style="padding-top: 195px">
            <div class="container">
                <h1 class="text-white">Xin chào, ${name}</h1>
            </div>
        </div>


        <div class="container d-flex pt-4 gap-4">

            <div class="row">

                <a href="myorders" class="card card-3-items-inline col-4 rounded-0 none-underline shadow text-center p-5 m-2">
                    <h4>My Orders</h4>
                    <hr>
                    <span class="text-body-secondary">Track the progress of your order, or arrange an exchange or
                        return</span>

                </a>


                <a href="wishlist" class="card card-3-items-inline col-4 rounded-0 none-underline shadow text-center p-5 m-2">
                    <h4>Wish List</h4>
                    <hr>
                    <span class="text-body-secondary">Add your favorite items to keep track of their availability and
                        purchase later</span>

                </a>


                <a href="accountdetails" class="card card-3-items-inline col-4 rounded-0 none-underline shadow text-center p-5 m-2">
                    <h4>Account Details</h4>
                    <hr>
                    <span class="text-body-secondary">View or change your sign-in information</span>

                </a>



                <a href="addressbook" class="card card-3-items-inline col-4 rounded-0 none-underline shadow text-center p-5 m-2">
                    <h4>Address Book</h4>
                    <hr>
                    <span class="text-body-secondary">Manage your billing or delivery address</span>

                </a>





            </div>

        </div>

    </div>



    <jsp:include page="../component/footer.jsp"></jsp:include>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>