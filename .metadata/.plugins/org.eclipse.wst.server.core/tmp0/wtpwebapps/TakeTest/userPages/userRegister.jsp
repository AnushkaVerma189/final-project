<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="stylesheet" href="UserResources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="UserResources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="UserResources/css/bootstrap.min.css">
    <link rel="stylesheet" href="UserResources/css/newStyle.css">
    <style>
        .btn-link {
            display: inline-block;
            padding: 5px 10px;
            margin-top: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #8080ff;
            border: 1px solid #8080ff;
            border-radius: 5px;
        }

        .btn-link:hover {
            color: black;
            background-color: #6643b5;
            border: 1px solid #6643b5;
        }

        .form-group {
            margin-bottom: 15px !important; /* Reduced margin-bottom */
            border-width: 0px !important;
        }

        .form-group .form-control {
            height: 30px; /* Reduced height */
            padding-bottom: 10px !important;
            border-bottom: solid #000 !important;
            
        }

        .btn-link:focus, .btn-link:hover, .btn-link:active {
            text-decoration: none;
            outline: none;
            border: none;
        }
    </style>
</head>
<body>

<div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('../WE.png');"></div>
    <div class="contents order-2 order-md-1">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-7">
                    <h1>Register as <br><strong><span style="color: #ff5757; font-size: 4rem;">User</span></strong></h1>
                    <form action="/TakeTest/VerifyUser" method="post" onsubmit="return validateForm()">
                        <div class="form-group first" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="name"><b>Enter your username</b></label>
                            <input type="text" class="form-control" placeholder="Username (Max 20 characters)" required id="name" name="name" style="border-radius: 5px;" required maxlength="50">
                        </div>
                        <div class="form-group" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="mobile"><b>Enter your mobile number</b></label>
                            <input type="tel" class="form-control" placeholder="Mobile (10 digits)" id="mobile" required name="mobile" style="border-radius: 5px;" required pattern="[0-9]{10}">
                        </div>
                        <div class="form-group last mb-3" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="password"><b>Enter your password</b></label>
                            <input type="password" class="form-control" placeholder="Password (Min 8 characters with at least 1 number)" required id="password" name="password" style="border-radius: 5px;" required minlength="8" pattern="(?=.*\d).{8,}" title="Password must be at least 8 characters long and contain at least one number">
                        </div>
                        <div class="form-group" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="email"><b>Enter your email</b></label>
                            <input type="email" class="form-control" placeholder="Enter email" id="email" name="email" style="border-radius: 5px;" required >
                        </div>

                        <input type="submit" value="Verify your email" class="btn btn-block btn-warning">
                    </form>
                    <p id="error" style="color: red;"></p>
                    <%
                        String error = request.getParameter("error");
                        String toprint = "Error. Try again.";
                        if(error != null){
                            if(error.equals("mobile_invalid")) toprint = "Invalid mobile number.";
                            else if(error.equals("user_already_exists")) toprint = "Already registered with this mobile.";
                            else if(error.equals("email_already_exists")) toprint = "Already registered with this email.";
                            else if(error.equals("wrong_otp")) toprint = "You entered the wrong otp.";

                    %>
                    <p style="color: red;"><%= toprint %> Try again</p>
                    <%
                        }
                    %>
                    <div class="text-center">
                        <a href="/TakeTest/home.jsp" class="btn-link">Back to Home</a>
                        <a href="/TakeTest/userPages/userLogin.jsp" class="btn-link">Already a User, Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="UserResources/js/jquery-3.3.1.min.js"></script>
<script src="UserResources/js/popper.min.js"></script>
<script src="UserResources/js/bootstrap.min.js"></script>
<script src="UserResources/js/main.js"></script>

<script>
    function validateForm() {
        var username = document.getElementById("name").value;
        if (username.length > 20) {
            document.getElementById("error").innerHTML = "Username should not exceed 20 characters.";
            return false;
        }
        return true;
    }
</script>

</body>
</html>
