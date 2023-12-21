<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Radio Images</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
</head>

<body class="text-left">

<!-- =============== Left side start ================-->
<%@include file="_header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content">
        <div class="breadcrumb">
            <h1>Blank</h1>
            <ul>
                <li><a href="">Pages</a></li>
                <li>Blank</li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <div class="row">
            <div class="col-md-12">

                <p><strong>Gull - Laravel + Bootstrap 4 admin template</strong></p>

            </div>
        </div>

        <!--form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">

                        <form class="submit-form" action="LandAddServlet" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="v">Land Name</label>
                                    </div>
                                    <%--                                    <div class="input-group">--%>
                                    <%--                                        <div class="input-group-prepend">--%>
                                    <%--                                                <span class="input-group-text">--%>
                                    <%--                                                    <i class="i-Pen-3"></i>--%>
                                    <%--                                                </span>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <input class="form-control validate-field" type="text" placeholder="Land Name"--%>
                                    <%--                                               id="txtLandAddLandName" value="" name="land_name"--%>
                                    <%--                                               aria-label="LandName" aria-describedby="txtLandAddLandName"--%>
                                    <%--                                               minlength="4" maxlength="40" required autofocus/>--%>
                                    <%--                                    </div>--%>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Square_Feet" type="radio" name="land_extent_measurement"
                                                   value="Square Feet" class="validate-field" checked required/>
                                            <label for="Square_Feet">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/feet-square.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandExtentMeasurementSquareFeet"
                                                           class="m-0 p-0 text-center small">Square Feet</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Square_Metres" type="radio" name="land_extent_measurement"
                                                   value="Square Metres"/>
                                            <label for="Square_Metres">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/metre-square.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandExtentMeasurementSquareMetres"
                                                           class="m-0 p-0 text-center small">Square Metres</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Perches" type="radio" name="land_extent_measurement"
                                                   value="Perches"/>
                                            <label for="Perches">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/perch.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandExtentMeasurementPerches"
                                                           class="m-0 p-0 text-center small">Perches</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Acres" type="radio" name="land_extent_measurement"
                                                   value="Acres"/>
                                            <label for="Acres">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/acre.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandExtentMeasurementAcre"
                                                           class="m-0 p-0 text-center small">Acres</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="w">Land Name</label>
                                    </div>
                                    <%--                                    <div class="input-group">--%>
                                    <%--                                        <div class="input-group-prepend">--%>
                                    <%--                                                <span class="input-group-text">--%>
                                    <%--                                                    <i class="i-Pen-3"></i>--%>
                                    <%--                                                </span>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <input class="form-control validate-field" type="text" placeholder="Land Name"--%>
                                    <%--                                               id="x" value="" name="land_name"--%>
                                    <%--                                               aria-label="LandName" aria-describedby="txtLandAddLandName"--%>
                                    <%--                                               minlength="4" maxlength="40" required autofocus/>--%>
                                    <%--                                    </div>--%>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="dry_land" type="radio" name="land_type" value="Dry Land"
                                                   checked/>
                                            <label for="dry_land">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/dry-land.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandTypeDryLand"
                                                           class="m-0 p-0 text-center small">Dry Land</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="wet_land" type="radio" name="land_type" value="Wet Land"/>
                                            <label for="wet_land">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/wet-land.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandTypeWetLand"
                                                           class="m-0 p-0 text-center small">Wet Land</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="greenhouse" type="radio" name="land_type" value="Greenhouse"/>
                                            <label for="greenhouse">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/greenhouse.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandTypeGreenhouse"
                                                           class="m-0 p-0 text-center small">Greenhouse</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="y">Land Name</label>
                                    </div>
                                    <%--                                    <div class="input-group">--%>
                                    <%--                                        <div class="input-group-prepend">--%>
                                    <%--                                                <span class="input-group-text">--%>
                                    <%--                                                    <i class="i-Pen-3"></i>--%>
                                    <%--                                                </span>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <input class="form-control validate-field" type="text" placeholder="Land Name"--%>
                                    <%--                                               id="z" value="" name="land_name"--%>
                                    <%--                                               aria-label="LandName" aria-describedby="txtLandAddLandName"--%>
                                    <%--                                               minlength="4" maxlength="40" required autofocus/>--%>
                                    <%--                                    </div>--%>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Owned" type="radio" name="land_ownership_status" value="Owned"
                                                   checked/>
                                            <label for="Owned">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/rented.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandOwnershipStatusRented"
                                                           class="m-0 p-0 text-center small">Rented</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Rented" type="radio" name="land_ownership_status"
                                                   value="Rented"/>
                                            <label for="Rented">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/owned.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandOwnershipStatusOwned"
                                                           class="m-0 p-0 text-center small">Owned</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!--/form-->

        <!-- end of main-content -->

    </div>

    <!--Footer Start-->
    <%@include file="_footer.jsp" %>
    <!--Footer end-->

</div>

<!-- ============ Search UI Start ============= -->

<!-- <div class="search-ui">
    <div class="search-header">
        <img src="../../dist-assets/images/logo.png" alt="" class="logo">
        <button class="search-close btn btn-icon bg-transparent float-right mt-2">
            <i class="i-Close-Window text-22 text-muted"></i>
        </button>
    </div>
    <input type="text" placeholder="Type here" class="search-input" autofocus>
    <div class="search-title">
        <span class="text-muted">Search results</span>
    </div>
    <div class="search-results list-horizontal">
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <a href="#">
                        <img src="../../dist-assets/images/products/headphone-1.jpg" alt="">
                    </a>
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-danger">Sale</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <img src="../../dist-assets/images/products/headphone-2.jpg" alt="">
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-primary">New</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <img src="../../dist-assets/images/products/headphone-3.jpg" alt="">
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-primary">New</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <img src="../../dist-assets/images/products/headphone-4.jpg" alt="">
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-primary">New</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    PAGINATION CONTROL
    <div class="col-md-12 mt-5 text-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination d-inline-flex">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div> -->
<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>

</body>
</html>