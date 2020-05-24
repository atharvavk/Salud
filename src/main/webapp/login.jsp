<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login - NOT AFRICA</title>
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
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image"
                                    style="background-image: url(&quot;assets/img/login/image3.jpg&quot;);background-size: cover; ">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Welcome Back!</h4>
                                    </div>
                                    <form class="user" action="login" method="POST" >
                                        <div class="form-group"><input class="form-control form-control-user"
                                                type="text" id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Email Address/Mobile Number..." name="email"></div>
                                        <div class="form-group has-feedback"><input
                                                class="form-control form-control-user" type="password"
                                                id="exampleInputPassword" placeholder="Password" name="password">
                                            <small class='text-danger ml-3 '>
                                                <c:if test="${param.error == 'incorrect'}">
                                                    incorrect password
                                                </c:if>
                                            </small>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><input
                                                        class="form-check-input custom-control-input" type="checkbox"
                                                        id="formCheck-1"><label
                                                        class="form-check-label custom-control-label"
                                                        for="formCheck-1">Remember Me</label></div>
                                            </div>
                                        </div><button class="btn btn-primary btn-block text-white btn-user"
                                            type="submit">Login</button>
                                        <hr><a class="btn btn-primary btn-block text-white btn-google btn-user"
                                            role="button"><i class="fab fa-google"></i>&nbsp; Login with Google</a><a
                                            class="btn btn-primary btn-block text-white btn-facebook btn-user"
                                            role="button"><i class="fab fa-facebook-f"></i>&nbsp; Login with
                                            Facebook</a>
                                        <hr>
                                    </form>
                                    <div class="text-center"><a class="small" href="forgot-password.jsp">Forgot
                                            Password?</a></div>
                                    <div class="text-center"><a class="small" href="register.jsp">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
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