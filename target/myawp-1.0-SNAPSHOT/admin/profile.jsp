<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="profile.css">
    <script type="text/javascript" src="assets/js/my.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#usersubmit").click(function () {
                var firstname = $("#first_name").val();
                var lastname = $("#last_name").val();
                var number = $("#number").val();
                var email = $("#email").val();
                var passwd = $("#password").val();
                $.ajax({
                    type: 'POST',
                    data: {
                        first_name: firstname,
                        last_name: lastname,
                        number: number,
                        email: email,
                        password: passwd
                    },
                    url: "../AdminUserReg",
                    success: function (msg) {
                        alert(msg);
                    }
                });
            });
        });
    </script>
</head>

<body id="page-top">
    <div id="wrapper">
        <%@include file="sidebar.jsp"
        %>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <%@include file="topnavbar.jsp"
                %>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">ADD USER</h3>
                    <div class="row mb-3">
                        <div class="col-lg-8">
                            <div class="card shadow mb-3">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 font-weight-bold">User Settings</p>
                                </div>
                                <div class="card-body">
                                    <!--done validation-->
                                    <form method="post" id="user">
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="first_name"><strong>First
                                                            Name</strong></label><input class="form-control" type="text"
                                                        placeholder="John" name="first_name" id="first_name"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label for="last_name"><strong>Last
                                                            Name</strong></label><input class="form-control" type="text"
                                                        placeholder="Doe" name="last_name" id="last_name"></div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="number"><strong>Mobile
                                                            Number</strong></label><input class="form-control"
                                                        type="text" placeholder="888-888-8888"
                                                        aria-describedby="numberHelp" name="number" id="number"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label for="email"><strong>Email
                                                            Address</strong></label><input class="form-control"
                                                        type="email" placeholder="user@example.com" name="email"
                                                        id="email"></div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="password"><strong>Password
                                                        </strong></label><input class="form-control" type="password"
                                                        name="password" id="password"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label for="password_repeat"><strong>Repeat
                                                            Password</strong></label><input class="form-control"
                                                        type="password" name="password_repeat" id="password_repeat">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group"><button class="btn btn-primary btn-sm" type="submit"
                                                name='submit' id='usersubmit'>Save User</button>
                                            <span class="mx-4 text-danger" id='usererror'></span>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp"
            %>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
    <script src="assets/js/profile.js "></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>