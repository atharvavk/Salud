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
    <script type="text/javascript" src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    

    
    
    <script type="text/javascript">
        $(document).ready(function(){
                $('form[name = "new_product"]').submit(function (e) {
        
        let retval = false; 
        var name = $('form[name="new_product"] input[name="name"]').val();
        var quantity1 = $('form[name="new_product"] input[name="stock"]').val();
        
        var quantity = parseInt(quantity1) ; 
        
        var price1 = $('form[name="new_product"] input[name="price"]').val();
        
        var price = parseInt(price1) ; 
        
        if(name.length === 0)
        {
            $('form[name="new_product"] input[name="name"]').addClass(
				'is-invalid'
			);
			retval = true;
        }
        
        else 
        {
            $('form[name="new_product"] input[name="name"]').removeClass(
				'is-invalid'
			);
			$('form[name="new_product"] input[name="name"]').addClass(
				'is-valid'
			);
        }
        
        
        if(Number.isInteger(quantity))
        {
            if(quantity > 0)
            {
                $('form[name="new_product"] input[name="stock"]').removeClass(
				'is-invalid'
			);
			$('form[name="new_product"] input[name="stock"]').addClass(
				'is-valid'
			);
            }
            
            else 
            {
                            $('form[name="new_product"] input[name="stock"]').addClass(
				'is-invalid'
			);
			retval = true;
            }
        }
        
        else 
        {
                          $('form[name="new_product"] input[name="stock"]').addClass(
				'is-invalid'
			);
			retval = true;
        }
        
        
        
        if(Number.isInteger(price))
        {
            if(price > 0)
            {
                $('form[name="new_product"] input[name="price"]').removeClass(
				'is-invalid'
			);
			$('form[name="new_product"] input[name="price"]').addClass(
				'is-valid'
			);
            }
            
            else 
            {
                $('form[name="new_product"] input[name="price"]').removeClass(
				'is-invalid'
			);
                
                retval = true;
            }
        }
        
        else 
        {
            $('form[name="new_product"] input[name="price"]').removeClass(
				'is-invalid'
			);
                
                retval = true;
        }
        
        if (retval === true) {
			e.preventDefault();
		}

                              
    
                
                
                $.ajax({
                    type: 'POST',
                    data: {name:name, stock:stock, price:price, description:description},
                    url: "../AdminAddProduct",
                    success: function(msg){
                        alert(msg);
                    },
                    error: function(){
                        alert("Couldn't add product");
                    }
                });    
            });
        });
        
        
    </script>
    
    
    
    
    
    
    
    
    
    <script type="text/javascript">  
         $(document).ready(function(){
             $('form[name = "update_product"]').submit(function (e) {
         
         let retval = false; 
         
         
         var id1 =$('form[name="update_product"] input[name="u_id"]').val();  
         
         var id = parseInt(id1) ; 
         var name = $('form[name="update_product"] input[name="u_name"]').val();   
         
         
         var stock1 =$('form[name="update_product"] input[name="u_stock"]').val();  
         
         var stock = parseInt(stock1) ; 
         var price1 = $('form[name="update_product"] input[name="u_price"]').val();  
         
         var price = parseInt(price1) ; 
         
         
         
         if(name.length === 0)
        {
            $('form[name="update_product"] input[name="u_name"]').addClass(
				'is-invalid'
			);
			retval = true;
        }
        
        else 
        {
            $('form[name="update_product"] input[name="u_name"]').removeClass(
				'is-invalid'
			);
			$('form[name="new_product"] input[name="name"]').addClass(
				'is-valid'
			);
        }
        
        
        if(Number.isInteger(id))
        {
            if(id > 0)
            {
                $('form[name="upate_product"] input[name="u_id"]').removeClass(
				'is-invalid'
			);
			$('form[name="update_product"] input[name="u_id"]').addClass(
				'is-valid'
			);
            }
            
            else 
            {
                            $('form[name="update_product"] input[name="u_id"]').addClass(
				'is-invalid'
			);
			retval = true;
            }
        }
        
        else 
        {
                          $('form[name="update_product"] input[name="u_id"]').addClass(
				'is-invalid'
			);
			retval = true;
        }
        
        
        
        if(Number.isInteger(stock))
        {
            if(stock > 0)
            {
                $('form[name="upate_product"] input[name="u_stock"]').removeClass(
				'is-invalid'
			);
			$('form[name="update_product"] input[name="u_stock"]').addClass(
				'is-valid'
			);
            }
            
            else 
            {
                            $('form[name="update_product"] input[name="u_stock"]').addClass(
				'is-invalid'
			);
			retval = true;
            }
        }
        
        else 
        {
                          $('form[name="update_product"] input[name="u_stock"]').addClass(
				'is-invalid'
			);
			retval = true;
        }
        
        
        
        if(Number.isInteger(price))
        {
            if(price > 0)
            {
                $('form[name="upate_product"] input[name="u_price"]').removeClass(
				'is-invalid'
			);
			$('form[name="update_product"] input[name="u_price"]').addClass(
				'is-valid'
			);
            }
            
            else 
            {
                            $('form[name="update_product"] input[name="u_price"]').addClass(
				'is-invalid'
			);
			retval = true;
            }
        }
        
        else 
        {
                          $('form[name="update_product"] input[name="u_price"]').addClass(
				'is-invalid'
			);
			retval = true;
        }
        
        
        
        if (retval === true) {
			e.preventDefault();
		}
        
        
        
                

                
                
                
                
                
                $.ajax({
                    type: 'POST',
                    data: {id:id, name:name, stock:stock, price:price, description:description},
                    url: "../AdminUpdateProduct",
                    success: function(msg){
                        alert(msg);
                    },
                    error: function(){
                        alert("Couldn't update product");
                    }
                });    
            });
        });
    </script>
    
    
    
    
    
    
    
    
    <script type="text/javascript">
        $(document).ready(function(){
                $('form[name = "stock"]').submit(function (e) {
         
                var id1 = $('form[name="stock"] input[name="up_id"]').val();   
                
                var id = parseInt(id1) ; 
                
                var stock1 = $('form[name="stock"] input[name="up_stock"]').val(); ; 

                var stock = parseInt(stock1) ; 

                if(Number.isInteger(stock))
               {
                   if(stock > 0)
                   {
                       $('form[name="stock"] input[name="up_stock"]').removeClass(
                                       'is-invalid'
                               );
                               $('form[name="stock"] input[name="up_stock"]').addClass(
                                       'is-valid'
                               );
                   }

                   else 
                   {
                                   $('form[name="stock"] input[name="up_stock"]').addClass(
                                       'is-invalid'
                               );
                               retval = true;
                   }
               }

               else 
               {
                                 $('form[name="stock"] input[name="up_stock"]').addClass(
                                       'is-invalid'
                               );
                               retval = true;
               }



               if(Number.isInteger(id))
               {
                   if(id > 0)
                   {
                       $('form[name="stock"] input[name="up_id"]').removeClass(
                                       'is-invalid'
                               );
                               $('form[name="stock"] input[name="up_id"]').addClass(
                                       'is-valid'
                               );
                   }

                   else 
                   {
                                   $('form[name="stock"] input[name="up_id"]').addClass(
                                       'is-invalid'
                               );
                               retval = true;
                   }
               }

               else 
               {
                                 $('form[name="stock"] input[name="up_id"]').addClass(
                                       'is-invalid'
                               );
                               retval = true;
               }



                       if (retval === true) {
                               e.preventDefault();
                       }


        
            
                
                $.ajax({
                    type: 'POST',
                    data: {id:id, stock:stock},
                    url: "../AdminUpdateStock"
                    
                });
            });
        });
    </script>
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
                        <h3 class="text-dark mb-0">ADD PRODUCT</h3>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-7 col-xl-8">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 font-weight-bold">Add New Product</p>
                                </div>
                                <div class="card-body">
                                    <form name = "new_product">
                                        
                                        <div class="form-row">
                                            
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="price"><strong>Name</strong></label><input
                                                        class="form-control" type="text" placeholder="sanitizer"
                                                        name="name" id="name"></div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="stock"><strong>Stock
                                                        </strong></label><input class="form-control" type="number"
                                                              placeholder="0" name="stock" id="stock"></div>
                                            </div>
                                            
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="price"><strong>Price</strong></label><input
                                                        class="form-control" type="number" placeholder="100"
                                                        name="price" id="price"></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><label for="Description"><strong>Description</strong></label><textarea
                                                class="form-control" rows="4" placeholder="Hand Sanitizer"
                                                name="description" id="description"></textarea></div>
                                        
                                        <div class="form-group"><button class="btn btn-primary btn-sm"
                                                type="submit" id="submitProduct">Add Product</button></div>
                                    </form>
                                </div>
                            </div>
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 font-weight-bold">Update Product</p>
                                </div>
                                <div class="card-body">
                                    <form name = "update_product">
                                        
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="id"><strong>ID</strong></label><input
                                                        class="form-control" type="number" placeholder=""
                                                        name="u_id" id="u_id"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="name"><strong>Name</strong></label><input
                                                        class="form-control" type="text" placeholder=""
                                                        name="u_name" id="u_name"></div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="stock"><strong>Stock
                                                        </strong></label><input class="form-control" type="number"
                                                              placeholder="0" name="u_stock" id="u_stock"></div>
                                            </div>
                                            
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="price"><strong>Price</strong></label><input
                                                        class="form-control" type="number" placeholder="100"
                                                        name="u_price" id="u_price"></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><label for="Description"><strong>Description</strong></label><textarea
                                                class="form-control" rows="4" placeholder="Hand Sanitizer"
                                                name="u_description" id="u_description"></textarea></div>
                                        
                                        <div class="form-group"><button class="btn btn-primary btn-sm"
                                                type="submit" id="update">Update</button></div>
                                    </form>
                                </div>
                            </div>
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 font-weight-bold">Update Stock</p>
                                </div>
                                <div class="card-body">
                                    <form name = "stock">
                                        
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="id"><strong>ID</strong></label><input
                                                        class="form-control" type="number" placeholder=""
                                                        name="up_id" id="up_id"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label
                                                        for="up_stock"><strong>Stock</strong></label><input
                                                        class="form-control" type="number" placeholder=""
                                                        name="up_stock" id="up_stock"></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><button class="btn btn-primary btn-sm"
                                                type="submit" id="updateStock">Update</button></div>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
