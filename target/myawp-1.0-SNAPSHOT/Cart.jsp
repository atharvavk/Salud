<%--
  Created by IntelliJ IDEA.
  User: risha
  Date: 6/15/2020
  Time: 12:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Cart</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <script src="assets/js/cart.js"></script>
</head>

<body class="main-bg">
    <%@ include file="header.jsp"
    %>
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", -1);
    %>
    <c:if test="${empty User}">
        <c:redirect url="login.jsp" />
    </c:if>
    <section>
        <div class="container my-5">
            <div class="row">
                <div class="col-lg-8">
                    <div class="card wish-list mb-3">
                        <div class="card-body">
                            <h5 class="mb-4">Cart (<span>${cartproducts.size()}</span> items)</h5>
                            <input type="hidden" value="${User.id}" id="userid">
                            <c:set var="totalcost" value="0" />
                            <c:forEach var="prod" items="${cartproducts}">
                                <c:set var="temp" value="${prod.price*prod.quantity}"></c:set>
                                <c:set var="totalcost" value="${totalcost+temp}" />
                                <div class="row mb-4" id="item${prod.id}">
                                    <div class="col-md-5 col-lg-3 col-xl-3">
                                        <img class="img-fluid w-100"
                                            src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12a.jpg"
                                            alt="Sample">
                                    </div>
                                    <div class="col-md-7 col-lg-9 col-xl-9">
                                        <div>
                                            <div class="d-flex justify-content-between">
                                                <div class="col">
                                                    <h5 class="text-uppercase">${prod.name}</h5>
                                                    <p class="mb-3 text-muted text-capitalize small">${prod.description}
                                                    </p>
                                                </div>
                                                <div>
                                                    <div class="def-number-input number-input safari_only mb-0 w-100">
                                                        <button
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown();subquantity(${prod.id},${prod.price})"
                                                            class="minus btn btn-outline-primary"><i class="fa fa-minus"
                                                                aria-hidden="true"></i></button>
                                                        <input class="quantity input-number" min="0" name="quantity"
                                                            value="${prod.quantity}" type="number">
                                                        <button
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp();addquantity(${prod.id},${prod.price})"
                                                            class="plus btn btn-outline-primary"><i class="fa fa-plus"
                                                                aria-hidden="true"></i></button>
                                                    </div>
                                                    <c:if test="${prod.stock lt 2}">
                                                        <small id="passwordHelpBlock"
                                                            class="form-text text-muted text-center">
                                                            (Note, only ${prod.stock} piece left)
                                                        </small></c:if>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <a type="button"
                                                        class="card-link-secondary small text-uppercase mr-3 deleteitem"
                                                        id="${prod.id}"><i class="fas fa-trash-alt mr-1"></i> Remove
                                                        item </a>
                                                    <input type="hidden" value="${prod.id}">
                                                </div>
                                                <p class="mb-0"><span><strong>Price : <i
                                                                class="fa fa-inr"></i>${prod.price}</strong></span></p>
                                                <p class="mb-0 "><span><strong>Amount : <i class="fa fa-inr"></i><span
                                                                id="Amount${prod.id}">
                                                                <fmt:formatNumber type="number" maxFractionDigits="2"
                                                                    minFractionDigits="2" value="${temp}" />
                                                            </span></strong></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-4">
                            </c:forEach>

                            <p class="text-primary mb-0"><i class="fas fa-info-circle mr-1"></i> Do not delay the
                                purchase, adding
                                items to your cart does not mean booking them.</p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-header">
                            <h5>Previous Orders</h5>
                        </div>

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="temp" value="0"/>
                            <c:forEach var="ord" items="${prevorder}">
                                <c:set var="temp" value="${temp +1}"></c:set>
                                <tr>
                                    <th scope="row">${temp}</th>
                                    <td>${ord.productname}</td>
                                    <td><i class="fa fa-inr"></i>${ord.price}</td>
                                    <td>${ord.quantity}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="mb-4">We accept</h5>
                            <img class="mr-2" width="45px"
                                src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                alt="Visa">
                            <img class="mr-2" width="45px"
                                src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                                alt="American Express">
                            <img class="mr-2" width="45px"
                                src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                alt="Mastercard">
                            <img class="mr-2" width="45px"
                                src="https://z9t4u9f6.stackpathcdn.com/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.png"
                                alt="PayPal acceptance mark">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="mb-3">Total </h5>
                            <ul class="list-group list-group-flush">
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div>
                                        <strong>Total : </strong>
                                        <strong>
                                            <p class="mb-0">(including VAT)</p>
                                        </strong>
                                    </div>
                                    <span><strong><i class="fa fa-inr"><span id="Total">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2"
                                                        minFractionDigits="2" value="${totalcost}" />
                                                </span></i></strong></span>
                                </li>
                            </ul>
                            <a href="checkout.jsp" class="btn btn-primary btn-block waves-effect waves-light">go to
                                checkout</a>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <a class="dark-grey-text d-flex justify-content-between" data-toggle="collapse"
                                href="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                                Add a discount code (optional)
                                <span><i class="fas fa-chevron-down pt-1"></i></span>
                            </a>
                            <div class="collapse" id="collapseExample1">
                                <div class="mt-3">
                                    <div class="md-form md-outline mb-0">
                                        <input type="text" id="discount-code1" class="form-control font-weight-light"
                                            placeholder="Enter discount code">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@ include file="footer.jsp"
    %>
    <script>
        $(document).ready(function () {
            $(".deleteitem").click(function (e) {
                var id = this.id;
                console.log("delete clicked",id);
                $.ajax({
                    type: 'POST',
                    data: {
                        id: id
                    },
                    url: "removecart",
                    success: function (data) {
                        $("#item" + id).hide();
                        var amount=$("#Amount"+id).text();
                        amount=parseFloat(amount);
                        var total=$("#Total").text();
                        total=parseFloat(total);
                        total-=amount;
                        total=total.toFixed(2);
                        console.log(total,amount);
                        $("#Total").text(total);
                    },
                    error: function () {
                        alert("Couldn't remove!");
                    }
                });
                e.preventDefault();
            });
        });
    </script>



</body>

</html>