<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Modal Test Level 4</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
    <link href="dist-assets/slick/slick.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/custom/font-awesome.min.css">

    <style type="text/css">
        #slick .arrow_prev {
            position: absolute;
            top: 36%;
            left: 5%;
        }

        #slick .arrow_prev span {
            font-size: 20px;
            cursor: pointer;
            border-radius: 5px;
            border: solid 2px #6b911b;
            background-color: rgba(245, 245, 245, 0.5);
            display: block;
            width: 50px;
            height: 50px;
            text-align: center;
            line-height: 65px;
        }

        #slick .arrow_next {
            position: absolute;
            top: 36%;
            right: 5%;
        }

        #slick .arrow_next span {
            font-size: 20px;
            cursor: pointer;
            border-radius: 5px;
            border: solid 2px #6b911b;
            background-color: rgba(245, 245, 245, 0.5);
            display: block;
            width: 50px;
            height: 50px;
            text-align: center;
            line-height: 65px;
        }

        input[type=radio]:hover + label {
            cursor: pointer;
            background-color: #e3ece1;
            border: solid 2px #6b911b;
            border-radius: 5px;
        }

        input[type=radio]:checked + label {
            background-color: #e3ece1;
            border: solid 2px #6b911b;
            border-radius: 5px;
        }

        /* HIDE RADIO */
        [type=radio] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .link-disabled {
            pointer-events: none;
        }

        .link-enabled {
            pointer-events: auto;
        }

    </style>

</head>

<body class="text-left"
<%--onload="EnableAndDisableFormSubmitLink();"--%>
>

<!-- =============== Left side start ================-->
<%--<%@include file="_header.jsp" %>--%>
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

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">

                        <form class="submit-form" action="TestServlet" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropType">Crop Type</label>
                                    </div>

                                    <!--carousel-->

                                    <!--section-->
                                    <section id="slick">
                                        <div class="container p-0">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--carousel-->
                                                    <div class="parent">
                                                        <div class="col-md-4 m-1 p-0 rounded child border">
                                                            <input type="radio" name="crop_type" value="Onion"
                                                                   id="onion" class="validate-field" required/>
                                                            <label class="mb-0" for="onion">
                                                                <img class="d-block w-100 rounded p-1"
                                                                     src="dist-assets/images/crops/onion.png"
                                                                     alt="onion"/>
                                                            </label>
                                                            <div class="carousel-caption p-0">
                                                                <div class="p-1 rounded opaque">
                                                                    <p class="m-0 p-0 text-dark small">Onion</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 m-1 p-0 rounded child border">
                                                            <input type="radio" name="crop_type" value="Banana"
                                                                   id="banana"/>
                                                            <label class="mb-0" for="banana">
                                                                <img class="d-block w-100 rounded p-1"
                                                                     src="dist-assets/images/crops/banana.png"
                                                                     alt="banana"/>
                                                            </label>
                                                            <div class="carousel-caption p-0">
                                                                <div class="p-1 rounded opaque">
                                                                    <p class="m-0 p-0 text-dark small">Banana</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 m-1 p-0 rounded child border">
                                                            <input type="radio" name="crop_type" value="Beans"
                                                                   id="beans"/>
                                                            <label class="mb-0" for="beans">
                                                                <img class="d-block w-100 rounded p-1"
                                                                     src="dist-assets/images/crops/peas.png"
                                                                     alt="beans"/>
                                                            </label>
                                                            <div class="carousel-caption p-0">
                                                                <div class="p-1 rounded opaque">
                                                                    <p class="m-0 p-0 text-dark small">Beans</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 m-1 p-0 rounded child border">
                                                            <input type="radio" name="crop_type" value="Papaya"
                                                                   id="papaya"/>
                                                            <label class="mb-0" for="papaya">
                                                                <img class="d-block w-100 rounded p-1"
                                                                     src="dist-assets/images/crops/papaya.png"
                                                                     alt="papaya"/>
                                                            </label>
                                                            <div class="carousel-caption p-0">
                                                                <div class="p-1 rounded opaque">
                                                                    <p class="m-0 p-0 text-dark small">Papaya</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 m-1 p-0 rounded child border">
                                                            <input type="radio" name="crop_type" value="Tomato"
                                                                   id="tomato"/>
                                                            <label class="mb-0" for="tomato">
                                                                <img class="d-block w-100 rounded p-1"
                                                                     src="dist-assets/images/crops/tomato.png"
                                                                     alt="tomato"/>
                                                            </label>
                                                            <div class="carousel-caption p-0">
                                                                <div class="p-1 rounded opaque">
                                                                    <p class="m-0 p-0 text-dark small">Tomato</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 m-1 p-0 rounded child border">
                                                            <input type="radio" name="crop_type" value="Leeks"
                                                                   id="leeks"/>
                                                            <label class="mb-0" for="leeks">
                                                                <img class="d-block w-100 rounded p-1"
                                                                     src="dist-assets/images/crops/leaks.png"
                                                                     alt="leeks"/>
                                                            </label>
                                                            <div class="carousel-caption p-0">
                                                                <div class="p-1 rounded opaque">
                                                                    <p class="m-0 p-0 text-dark small">Leeks</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/carousel-->
                                                    <!--/controls-->
                                                    <div class="arrow_prev">
                                                        <span>
                                                            <i class="fa fa-chevron-left fa-2x text-primary"></i>
                                                        </span>
                                                    </div>
                                                    <div class="arrow_next">
                                                        <span>
                                                            <i class="fa fa-chevron-right fa-2x text-primary"></i>
                                                        </span>
                                                    </div>
                                                    <!--/controls-->
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!--/section-->

                                    <%--</div>--%>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropExtentAmount">Cultivated Land Area - Number</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="number"
                                               placeholder="Planted Land Area - Number"
                                               id="txtCropAddCropExtentNumber" value="10"
                                               name="crop_extent_number"
                                               aria-label="CropExtentNumber"
                                               aria-describedby="txtCropAddCropExtentNumber"
                                               min="1"
                                        <%--<%--%>
                                        <%--if (LandExtentAvailableNumber > 0.0) {--%>
                                        <%--%>--%>
                                        <%--max="1000"--%>
                                        <%--<%--%>
                                        <%--} else {--%>
                                        <%--%>--%>
                                        <%--max="<%=LandExtentAvailableNumberInInteger%>"--%>
                                        <%--<%--%>
                                        <%--}--%>
                                        <%--%>--%>
                                               required/>
                                        <%--<div class="valid-feedback">--%>
                                        <%--Looks good!--%>
                                        <%--</div>--%>
                                        <%--<div class="invalid-feedback">--%>
                                        <%--Please choose a number.--%>
                                        <%--</div>--%>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropExtentMeasurement">
                                            Cultivated Land Area - Unit</label>
                                    </div>
                                    <div class="input-group mt-2 mb-3">

                                        <%--<div class="input-group-prepend">--%>
                                        <%--<span class="input-group-text">--%>
                                        <%--<i class="i-Pen-3"></i>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<select class="form-control"--%>
                                        <%--id="cmbCropAddCropExtentMeasurement"--%>
                                        <%--name="crop_extent_unit"--%>
                                        <%--aria-label="CropExtentMeasurement"--%>
                                        <%--aria-describedby="cmbCropAddCropExtentMeasurement"--%>
                                        <%--required>--%>
                                        <%--<option value="Plots">Plots</option>--%>
                                        <%--<option value="Square Metres">Square Metres</option>--%>
                                        <%--<option value="Square Feet">Square Feet</option>--%>
                                        <%--<option value="Perches">Perches</option>--%>
                                        <%--<option value="Acres">Acres</option>--%>
                                        <%--</select>--%>

                                        <div class="btn-group" role="group">
                                            <%--<label class="radio radio-primary">--%>
                                            <%--<input type="radio" name="radio3" value="Plots"/>--%>
                                            <%--<span>Plots</span>--%>
                                            <%--<span class="checkmark"></span>--%>
                                            <%--</label>--%>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_extent_unit" value="Square Feet"
                                                       class="validate-field" required/>
                                                <%--<div class="valid-feedback">--%>
                                                <%--Looks good!--%>
                                                <%--</div>--%>
                                                <%--<div class="invalid-feedback">--%>
                                                <%--Please choose a unit.--%>
                                                <%--</div>--%>
                                                <span id="lblCropAddCropExtentUnitSquareFeet">Square Feet</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary ml-2">
                                                <input type="radio" name="crop_extent_unit" value="Square Metres"/>
                                                <span id="lblCropAddCropExtentUnitSquareMetres">Square Metres</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary ml-2">
                                                <input type="radio" name="crop_extent_unit" value="Perches"/>
                                                <span id="lblCropAddCropExtentUnitPerches">Perches</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary ml-2">
                                                <input type="radio" name="crop_extent_unit" value="Acres"/>
                                                <span id="lblCropAddCropExtentUnitAcres">Acres</span>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropPlantedDate">Planted Date</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="date" placeholder="Planted Date"
                                               id="txtCropAddCropPlantedDate" value="" name="crop_planted_date"
                                               aria-label="CropPlantedDate"
                                               aria-describedby="txtCropAddCropPlantedDate" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <%--<button type="submit" class="btn btn-primary btn-block form-submit-button"--%>
                                            <%--id="btnCropAddAddNewCrop"--%>
                                    <%--data-toggle="modal" data-target="#LoaderModal">Save</button>--%>
                                    <button type="submit" class="btn btn-primary btn-block form-submit-button"
                                            id="btnCropAddAddNewCrop">Save</button>
                                    <%--<a id="btnCropAddAddNewCrop" class="btn btn-primary btn-block"
                                       data-toggle="modal" data-target="#ConfirmationModal" disabled="true">
                                        <span class="text-white">Save</span>
                                    </a>--%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <div class="row">
            <div class="col-md-12">

                <%--<button type="button" class="btn btn-secondary ripple"--%>
                <%--data-toggle="modal" data-target="#LoaderModal">--%>
                <%--Loader modal--%>
                <%--</button>--%>

                <!--modal-info-->
                <div class="modal fade" data-backdrop="static" data-keyboard="false" id="ModalInfoLoader">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                                    <span class="text-center"><i
                                            class="text-secondary display-3 i-Information"></i></span>
                                    <h2 class="mt-3 mb-3" id="ModalInfoLoaderTitle">Processing</h2>
                                    <p id="ModalInfoLoaderBody" class="mt-4 mb-4">Please wait.</p>

                                    <div class="spinner spinner-secondary mr-3"></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-info-->

            </div>
        </div>

        <!-- end of main-content -->

    </div>

    <!-- ============ Body content end ============= -->

    <!--Footer Start-->
    <%--<%@include file="_footer.jsp" %>--%>
    <!--Footer end-->

</div>

<!-- ============ Search UI Start ============= -->

<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<%--<script src="dist-assets/js/scripts/form.validation.script.min.js"></script>--%>
<script src="dist-assets/js/custom/main.js"></script>
<script src="dist-assets/js/custom/distric_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/gn_division_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>
<script src="dist-assets/slick/slick.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.parent').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            prevArrow: '.arrow_prev',
            nextArrow: '.arrow_next'
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        // Disable button
        $('.form-submit-button').prop('disabled', true);
        // Cache fields that you want to validate
        var $fieldsToCheck = $('.submit-form .validate-field');
        // Function to ensure fields are not empty
        var checkFields = function() {
            // Get array of empty fields
            var emptyFields = $fieldsToCheck.map(function() {
                return this.value;
            }).get().filter(function(val) {
                return val.length === 0;
            });
            // Disabled prop to be toggled based on length of empty fields
            $('.form-submit-button').prop('disabled', !!emptyFields.length);
        };
        // Bind onInput event to all inputs you want to check
        $fieldsToCheck.on('input', checkFields);
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('.submit-form').submit(function () {
            $('#ModalInfoLoader').modal('show');
            console.log('form submitted');
        });
    });
</script>

</body>
</html>