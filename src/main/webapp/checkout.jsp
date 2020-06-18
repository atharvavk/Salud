<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Checkout example for Bootstrap</title>
    <link rel="canonical" href="index.html">
    <!-- Bootstrap core CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>


    <script>
        $(document).ready(function () {

            $('form[name = "checkout"] input[name="cc-expiration"]').mask('00-00-0000');
            $('form[name = "checkout"] input[name="cc-number"]').mask('0000-0000-0000-0000');

            $('form[name = "checkout"]').submit(function (e) {

                let retval = false;
                var first_name = $('form[name = "checkout"] input[name="firstName"]').val();
                var last_name = $('form[name = "checkout"] input[name="lastName"]').val();
                var phone1 = $('form[name = "checkout"] input[name="phone"]').val();

                var phone = parseInt(phone1);

                var email = $('form[name = "checkout"] input[name="email"]').val();

                var address = $('form[name = "checkout"] input[name="address"]').val();

                var pin = $('form[name = "checkout"] input[name="zip"]').val();

                var cc_number = $('form[name = "checkout"] input[name="cc-number"]').val();

                var cc_name = $('form[name = "checkout"] input[name="cc-name"]').val();

                var cc_cvv = $('form[name = "checkout"] input[name="cc-cvv"]').val();

                var cc_expire = $('form[name = "checkout"] input[name="cc-expiration"]').val();


                if (first_name.length === 0) {
                    $('form[name="checkout"] input[name="firstName"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                } else {
                    $('form[name="checkout"] input[name="firstName"]').addClass(
                        'is-valid'
                    );
                }


                if (last_name.length === 0) {
                    $('form[name="checkout"] input[name="lastName"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                } else {
                    $('form[name="checkout"] input[name="lastName"]').addClass(
                        'is-valid'
                    );
                }



                if (Number.isInteger(phone)) {
                    if (phone > 0) {
                        $('form[name="checkout"] input[name="phone"]').addClass(
                            'is-valid'
                        );
                    } else {
                        $('form[name="checkout"] input[name="phone"]').addClass(
                            'is-invalid'
                        );
                        retval = true;
                    }
                } else {
                    $('form[name="checkout"] input[name="phone"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                }



                if (!email.match('^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$')) {
                    $('form[name="checkout"] input[name="email"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                } else {
                    $('form[name="checkout"] input[name="email"]').addClass(
                        'is-valid'
                    );
                }



                if (address.length === 0) {
                    $('form[name="checkout"] input[name="address"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                } else {
                    $('form[name="checkout"] input[name="address"]').addClass(
                        'is-valid'
                    );
                }



                if (cc_name.length === 0) {
                    $('form[name="checkout"] input[name="cc-name"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                } else {
                    $('form[name="checkout"] input[name="cc-name"]').addClass(
                        'is-valid'
                    );
                }



                if (pin.length === 6) {
                    $('form[name="checkout"] input[name="pin"]').addClass(
                        'is-valid'
                    );

                } else {
                    $('form[name="checkout"] input[name="pin"]').addClass(
                        'is-invalid'
                    );
                    retval = true;
                }


                if (cc_number.length === 19) {
                    $('form[name="checkout"] input[name="cc-number"]').addClass(
                        'is-valid'
                    );

                } else {
                    $('form[name="checkout"] input[name="cc-number"]').addClass(
                        'is-invalid'
                    );

                    retval = true;
                }





                if (cc_cvv.length === 3) {
                    $('form[name="checkout"] input[name="cc-cvv"]').addClass(
                        'is-valid'
                    );

                } else {
                    $('form[name="checkout"] input[name="cc-cvv"]').addClass(
                        'is-invalid'
                    );

                    retval = true;
                }



                if (cc_expire.length === 10) {
                    $('form[name="checkout"] input[name="cc-expiration"]').addClass(
                        'is-valid'
                    );

                } else {
                    $('form[name="checkout"] input[name="cc-expiration"]').addClass(
                        'is-invalid'
                    );

                    retval = true;
                }









                if (retval === true) {
                    e.preventDefault();
                }

            });
        });
    </script>



</head>

<body class="main-bg">
    <%@include file="header.jsp"
%>
    <c:if test="${empty User}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <div class="container">
        <div class="row my-5">
            <div class="col-md-8 col-lg-8 order-md-1"
                style="border-radius: 10px;padding: 30px 30px;background-color: rgba(0, 0, 0, 0.5);">
                <h4 class="mb-3 text-warning">Billing address</h4>
                <form name="checkout" method="post" action="confirm">
                    <div class="row ">
                        <div class="col-md-6 mb-3">
                            <label for="firstName" class="text-primary">First name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder=""
                                value="">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName" class="text-primary">Last name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder=""
                                value="">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="text-primary">PhoneNO</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">+91</span>
                            </div>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone">

                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="text-primary">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">

                    </div>
                    <div class="mb-3">
                        <label for="address" class="text-primary">Address</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="1234 Main St">

                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="state" class="text-primary">State</label>
                            <select class="custom-select d-block w-100" id="state" required>
                                <option value="">Choose...</option>
                                <option value=?Andhra Pradesh?>Andhra Pradesh</option>
                                <option value=?Andaman and Nicobar Islands?>Andaman and Nicobar Islands</option>
                                <option value=?Arunachal Pradesh?>Arunachal Pradesh</option>
                                <option value=?Assam?>Assam</option>
                                <option value=?Bihar?>Bihar</option>
                                <option value=?Chandigarh?>Chandigarh</option>
                                <option value=?Chhattisgarh?>Chhattisgarh</option>
                                <option value=?Dadar and Nagar Haveli?>Dadar and Nagar Haveli</option>
                                <option value=?Daman and Diu?>Daman and Diu</option>
                                <option value=?Delhi?>Delhi</option>
                                <option value=?Lakshadweep?>Lakshadweep</option>
                                <option value=?Puducherry?>Puducherry</option>
                                <option value=?Goa?>Goa</option>
                                <option value=?Gujarat?>Gujarat</option>
                                <option value=?Haryana?>Haryana</option>
                                <option value=?Himachal Pradesh?>Himachal Pradesh</option>
                                <option value=?Jammu and Kashmir?>Jammu and Kashmir</option>
                                <option value=?Jharkhand?>Jharkhand</option>
                                <option value=?Karnataka?>Karnataka</option>
                                <option value=?Kerala?>Kerala</option>
                                <option value=?Madhya Pradesh?>Madhya Pradesh</option>
                                <option value=?Maharashtra?>Maharashtra</option>
                                <option value=?Manipur?>Manipur</option>
                                <option value=?Meghalaya?>Meghalaya</option>
                                <option value=?Mizoram?>Mizoram</option>
                                <option value=?Nagaland?>Nagaland</option>
                                <option value=?Odisha?>Odisha</option>
                                <option value=?Punjab?>Punjab</option>
                                <option value=?Rajasthan?>Rajasthan</option>
                                <option value=?Sikkim?>Sikkim</option>
                                <option value=?Tamil Nadu?>Tamil Nadu</option>
                                <option value=?Telangana?>Telangana</option>
                                <option value=?Tripura?>Tripura</option>
                                <option value=?Uttar Pradesh?>Uttar Pradesh</option>
                                <option value=?Uttarakhand?>Uttarakhand</option>
                                <option value=?West Bengal?>West Bengal</option>
                            </select>

                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="pincode" class="text-primary">pincode</label>
                            <input type="text" class="form-control" id="zip" name="zip" placeholder="">
                        </div>
                    </div>
                    <hr class="mb-4">
                    <h4 class="mb-3 text-warning">Payment</h4>
                    <div class="d-block my-3">
                        <div class="custom-control custom-radio">
                            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked
                                required>
                            <label class="custom-control-label text-primary" for="credit">Credit card</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="cash" name="paymentMethod" type="radio" class="custom-control-input">
                            <label class="custom-control-label text-primary" for="cash">cash</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cc-name" class="text-primary">Name on card</label>
                            <input type="text" class="form-control" id="cc-name" name="cc-name" placeholder="">
                            <small class="text-muted">Full name as displayed on card</small>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cc-number" class="text-primary">Credit card number</label>
                            <input type="text" class="form-control" id="cc-number" name="cc-number" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="cc-expiration" class="text-primary">Expiration</label>
                            <input type="text" class="form-control" id="cc-expiration" name="cc-expiration"
                                placeholder="">
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="cc-expiration" class="text-primary">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv" name="cc-cvv" placeholder="">
                        </div>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block" type="submit" id="submitDetail"
                        name="submitDetail">Confirm Order</button>
                </form>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"
%>
</body>

</html>