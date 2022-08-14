
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background: url(img/laptopimg.jpg);background-size: cover;background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">

                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;" class="center-align">Register Here</h3>
                            <h5 id="rsuccess" class="center-align"></h5>
                            <div class="form center-align">
                                <!--//creating form-->
                                <form action="register" method="post" id="signupform">

                                    <input type="text" name="user_name" placeholder="Enter your name">
                                    <input type="password" name="user_password" placeholder="Enter your Password">
                                    <input type="email" name="user_email" placeholder="Enter your Email">

                                    <button type="submit" class="btn">Register</button>
                                </form>

                            </div>
                            <div class="loader center-align" style="margin-top: 10px; display: none">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Please wait...</h5>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script  
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {

                console.log("Page is ready.....");


                $("#signupform").on('submit', function (event) {

                    event.preventDefault();

                    var f = $(this).serialize();

                    console.log(f);

                    $(".loader").show();
                    $(".form").hide();

                    $.ajax({
                        url: "register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            $(".loader").hide();
                            $(".form").show();
                            console.log(data);
                            console.log("success.........");
                            if (data.trim() === 'registered') {
           
                                $("#rsuccess").html("Registered");
                                $("#rsuccess").addClass('green-text');
                            } else {
                                $("#rsuccess").html("Something went Wrong");
                                $("#rsuccess").addClass('red-text');
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $(".loader").hide();
                            $(".form").show();
                            console.log(data);
                            console.log("error.........");
                              $("#rsuccess").html("Something went Wrong");
                                $("#rsuccess").addClass('red-text');
                        }
                    });
                });
            });

        </script>
    </body>
</html>
