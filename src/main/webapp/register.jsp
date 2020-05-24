<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - NOT AFRICA</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="login.css">
</head>

<body class="bg-gradient-primary">
    <%@ include file="header.jsp"
    %>
    <div class="container">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-flex">
                        <div class="flex-grow-1 bg-register-image"
                            style="background-image: url(&quot;assets/img/login/image2.jpg&quot;);background-size: cover;">
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Create an Account!</h4>
                            </div>
                            <form class="user" method="post" action="register" onsubmit="return validateRegister()">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user"
                                            type="text" id="exampleFirstName" placeholder="First Name"
                                            name="first_name"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text"
                                            id="exampleFirstName" placeholder="Last Name" name="last_name"></div>
                                </div>
                                <div class="form-group"><input class="form-control form-control-user" type="email"
                                        id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Email Address"
                                        name="email"></div>
                                <div class="form-group"><input class="form-control form-control-user" type="text"
                                        id="exampleInputnumber" aria-describedby="numberHelp"
                                        placeholder="(1234)-567-890" name="number" ></div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user"
                                            type="password" id="examplePasswordInput" placeholder="Password"
                                            name="password"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="password"
                                            id="exampleRepeatPasswordInput" placeholder="Repeat Password"
                                            name="password_repeat"></div>
                                </div>
                                <c:if test="${param.error=='already'}">
                                    <small class="text-danger ml-3 md-1 mu-1">User Already Exists</small>
                                </c:if>
                                <button class="btn btn-primary btn-block text-white btn-user" type="submit">Register
                                    Account</button>
                                <hr><a class="btn btn-primary btn-block text-white btn-google btn-user" role="button"><i
                                        class="fab fa-google"></i>&nbsp; Register with Google</a><a
                                    class="btn btn-primary btn-block text-white btn-facebook btn-user" role="button"><i
                                        class="fab fa-facebook-f"></i>&nbsp; Register with Facebook</a>
                                <hr>
                            </form>
                            <div class="text-center"><a class="small" href="forgot-password.jsp">Forgot Password?</a>
                            </div>
                            <div class="text-center"><a class="small" href="login.jsp">Already have an account?
                                    Login!</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"
    %>
</body>

</html>