<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Store - SALUD</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i">
    <script src="assets/js/store.js"></script>
</head>

<body class="main-bg">
    <%@ include file="header.jsp"
    %>
    <section class="page-section">
        <div class="container">
            <div class="row">
                <c:forEach var="prod" items="${products}">
                <div class="col-lg-4 col-md-6 mb-3 d-flex">
                    <div class="card flex-fill">
                        <img src="admin/uploads/${prod.filepath}.jpg" class="card-img-top " style="height:350px;">
                        <div class="card-body" id="prod${prod.id}">
                            <h5 class="card-title text-uppercase">${prod.name}</h5>
                            <span>Price : <i class="fa fa-inr"></i>${prod.price}</span>
                            <p class="card-text">${prod.description}</p>
                            <c:if test="${prod.stock eq 0}">
                                <p class='text-danger ml-3 '>
                                        out of stock
                                </p>
                            </c:if>
                            <c:choose>
                                <c:when test="${prod.incart}">
                                    <button class="btn btn-primary " onclick="removecart(${prod.id},${User.id})" id="proddel${prod.id}">Remove From Cart</button>
                                    <button hidden class="btn btn-primary " onclick="addcart(${prod.id},${User.id})" id="prodadd${prod.id}">Add To Cart</button>
                                </c:when>
                                <c:when test="${! empty User}">
                                    <button hidden class="btn btn-primary " onclick="removecart(${prod.id},${User.id})" id="proddel${prod.id}">Remove From Cart</button>
                                    <button <c:if test="${prod.stock eq 0}">disabled</c:if> class="btn btn-primary " onclick="addcart(${prod.id},${User.id})" id="prodadd${prod.id}">Add To Cart</button>
                                </c:when>
                                <c:otherwise>
                                    <a href="login.jsp" class="btn btn-primary " >Add To Cart</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <%@ include file="footer.jsp"
    %>
</body>

</html>