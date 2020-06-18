<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">

</head>

<body id="page-top">
    <div id="wrapper">
        <%@include file="sidebar.jsp"%>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <%@include file="topnavbar.jsp"%>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Orders</h3>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Order Info</p>
                        </div>
                        <div class="card-body">

                            <% int count = 0; %>
                            <c:set var="start" value="${(param.page-1)*10 + 1}"></c:set>
                                
                            <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                                url="jdbc:mysql://localhost:3306/myawp" user="root" password="admin" />
                            <sql:query var="rs" dataSource="${db}">SELECT * FROM orders limit ${start-1}, 10</sql:query>
                            <div class="table-responsive table mt-2" id="dataTables" role="grid"
                                aria-describedby="dataTable_info">
                                <table class="table dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>UserId</th>
                                            <th>ProductId</th>
                                            <th>Quantity</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${rs.rows}" var="row">
                                            <% count++; %>
                                            <tr id="row${row.Id}">
                                                <td>${row.Id}</td>
                                                <td>${row.UserId}</td>
                                                <td>${row.ProductId}</td>
                                                <td>${row.Quantity}</td>
                                                <td>${row.Address}</td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>UserId</th>
                                            <th>ProductId</th>
                                            <th>Quantity</th>
                                            <th>Adress</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <nav
                                        class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" <%
                                                        int prev = Integer.parseInt(request.getParameter("page"));
                                                        prev = prev - 1;
                                                        if(prev>=1)
                                                            out.println("href=" + "\'" + "producttable.jsp?page=" + prev + "\'");
                                                        else
                                                            out.println("");
                                                                     %> aria-label="Previous"><span
                                                        aria-hidden="true">&laquo;</span></a></li>
                                            <li class="page-item active"><a class="page-link"><%
                                                out.println(request.getParameter("page"));
                                                    %></a></li>

                                            <li class="page-item"><a class="page-link" <%
                                                        int next = Integer.parseInt(request.getParameter("page"));
                                                        next = next + 1;
                                                        if(count==10)
                                                            out.println("href=" + "\'" + "producttable.jsp?page=" + next + "\'");
                                                        else
                                                            out.println("");
                                                                             %> aria-label="Next"><span
                                                        aria-hidden="true">&raquo;</span></a></li>
                                            <span id="temp"></span>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp"%>
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