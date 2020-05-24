<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <%@ include file="sidebar.jsp"
        %>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <%@include file="topnavbar.jsp"
                %>
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Dashboard</h3>
                    </div>
                    <div class="row">
                        <div class=" col-lg-4 mb-4">
                            <div class="card shadow border-left-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-primary font-weight-bold text-xs mb-1">
                                                <span>Earnings (monthly)</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span>$40,000</span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-calendar fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class=" col-lg-4 mb-4">
                            <div class="card shadow border-left-success py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-success font-weight-bold text-xs mb-1">
                                                <span>Earnings (annual)</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span>$215,000</span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class=" col-lg-4 mb-4">
                            <div class="card shadow border-left-info py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-info font-weight-bold text-xs mb-1">
                                                <span>users</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span>15,000</span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-7 col-xl-8">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 font-weight-bold">Add New Product</p>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group"><label for="name"><strong>Name</strong></label><input
                                                class="form-control" type="text" placeholder="Hand Sanitizer"
                                                name="name"></div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="quantity"><strong>Quantity
                                                        </strong></label><input class="form-control" type="number"
                                                        placeholder="jita lao utna km" name="quantity"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="price"><strong>Price</strong></label><input
                                                        class="form-control" type="number" placeholder="100"
                                                        name="price"></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><button class="btn btn-primary btn-sm"
                                                type="submit">Add&nbsp;Product</button></div>
                                    </form>
                                </div>
                            </div>
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 font-weight-bold">Update Details</p>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group"><label for="name"><strong>Name</strong></label><input
                                                class="form-control" type="text" placeholder="Hand Sanitizer"
                                                name="name"></div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="quantity"><strong>Quantity
                                                        </strong></label><input class="form-control" type="number"
                                                        placeholder="quantity to be added" name="quantity"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="price"><strong>Price</strong></label><input
                                                        class="form-control" type="number" placeholder="new price"
                                                        name="price"></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><button class="btn btn-primary btn-sm"
                                                type="submit">Add&nbsp;Product</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-xl-4">
                            <div class="card shadow mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary font-weight-bold m-0">Revenue Sources</h6>
                                    <div class="dropdown no-arrow"><button class="btn btn-link btn-sm dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false" type="button"><i
                                                class="fas fa-ellipsis-v text-gray-400"></i></button>
                                        <div class="dropdown-menu shadow dropdown-menu-right animated--fade-in"
                                            role="menu">
                                            <p class="text-center dropdown-header">dropdown header:</p><a
                                                class="dropdown-item" role="presentation" href="#">&nbsp;Action</a><a
                                                class="dropdown-item" role="presentation" href="#">&nbsp;Another
                                                action</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item"
                                                role="presentation" href="#">&nbsp;Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area"><canvas
                                            data-bs-chart="{&quot;type&quot;:&quot;doughnut&quot;,&quot;data&quot;:{&quot;labels&quot;:[&quot;Direct&quot;,&quot;Social&quot;,&quot;Referral&quot;],&quot;datasets&quot;:[{&quot;label&quot;:&quot;&quot;,&quot;backgroundColor&quot;:[&quot;#4e73df&quot;,&quot;#1cc88a&quot;,&quot;#36b9cc&quot;],&quot;borderColor&quot;:[&quot;#ffffff&quot;,&quot;#ffffff&quot;,&quot;#ffffff&quot;],&quot;data&quot;:[&quot;50&quot;,&quot;30&quot;,&quot;15&quot;]}]},&quot;options&quot;:{&quot;maintainAspectRatio&quot;:false,&quot;legend&quot;:{&quot;display&quot;:false},&quot;title&quot;:{}}}"></canvas>
                                    </div>
                                    <div class="text-center small mt-4"><span class="mr-2"><i
                                                class="fas fa-circle text-primary"></i>&nbsp;Direct</span><span
                                            class="mr-2"><i
                                                class="fas fa-circle text-success"></i>&nbsp;Social</span><span
                                            class="mr-2"><i class="fas fa-circle text-info"></i>&nbsp;Refferal</span>
                                    </div>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>