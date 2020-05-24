<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);

%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"
    integrity="sha256-Kg2zTcFO9LXOc7IwcBx1YeUBJmekycsnTsq2RuFHSZU=" crossorigin="anonymous"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/my.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<h1 class="text-center text-white d-none d-lg-block site-heading"><span class="text-primary site-heading-upper mb-3">we
        provide quality food on time</span><span class="site-heading-lower">Not Africa</span></h1>
<nav class="navbar navbar-light navbar-expand-lg bg-dark py-lg-4" id="mainNav">
    <div class="container">
        <div>
            <a class="navbar-brand text-uppercase d-lg-none text-expanded" href="index.jsp">NotAfrica</a>
            <small class="text-primary">
                Hello,${User.name}
            </small>
        </div>
        <button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler"
            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav navbar-nav mx-auto">
                <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="about.jsp">About us</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="products.jsp">Products</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="store.jsp">Store</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="team.jsp">OUR TEAM</a></li>
                <c:if test="${empty User}">
                    <li class='nav-item shadow-none mb-2' role='presentation'><a
                            class='nav-link bg-warning border rounded border-warning' href='login.jsp'>LOGIN</a></li>
                    <li class='nav-item' role='presentation'><a
                            class='nav-link bg-warning border rounded border-warning shadow' href='register.jsp'>SIGN
                            UP</a>
                    </li>"
                </c:if>
                <c:if test="${!empty User}">
                    <li class="nav-item shadow-none mb-2" role="presentation"><a
                            class="nav-link bg-warning border rounded border-warning" href="logout">LOGOUT</a></li>
                </c:if>

            </ul>
        </div>
    </div>
</nav>