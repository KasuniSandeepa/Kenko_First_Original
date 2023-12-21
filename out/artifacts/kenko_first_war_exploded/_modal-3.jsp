<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Modal Test Level 3</title>
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
    </style>

</head>

<body class="text-left">

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
                        <form id="formCropAdd" action="TestServlet" method="post" enctype="multipart/form-data">

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
                                                                   id="onion" required/>
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
                                        &nbsp;
                                    </div>
                                    <a id="btnCropAddAddNewCrop" class="btn btn-primary btn-block"
                                       data-toggle="modal" data-target="#ConfirmationModal">
                                        <span class="text-white">Save</span>
                                    </a>
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

                <%--<button type="button" class="btn btn-info ripple"--%>
                <%--data-toggle="modal" data-target="#ConfirmationModal">--%>
                <%--Confirmation modal--%>
                <%--</button>--%>

                <div class="modal fade" data-backdrop="static" data-keyboard="false" id="ConfirmationModal">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                                                <span class="text-center"><i
                                                        class="text-info display-3 i-Information"></i></span>
                                    <h2 class="mt-3 mb-3" id="modalInfoTitle">Proceed?</h2>
                                    <p id="modalInfoBody" class="mt-4 mb-4">Your item will be saved.</p>

                                    <a class="btn btn-lg btn-info mr-5" data-dismiss="modal" href="#"
                                       id="modalInfoFooterYes">Yes</a>
                                    <a class="btn btn-lg btn-outline-warning" style="display:inline-block;"
                                       data-dismiss="modal" href="#" id="modalInfoFooterNo">No</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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

<script>
    $('.child').click(function () {
        $(this)
            .css('background-color', '#e3ece1')
            .siblings()
            .css('background-color', '#ffffff');
        console.log(this.id);
        $("#crop_type").val(this.id);
    });
</script>

<%--<script language="javascript">--%>
<%--$('#modalInfoFooterYes').click(function () {--%>
<%--$('#formCropAdd').submit();--%>
<%--console.log('Crop Add Form Submitted');--%>
<%--});--%>
<%--</script>--%>

<script language="javascript">
    let submitButton = $('#btnCropAddAddNewCrop');

    window.onload = function () {
        $(submitButton).click(function (e) {
            e.preventDefault();
        });
    };

    // $("#formCropAdd input.required").change(function () {
    //     let valid = true;
    //     $.each($("#formCropAdd input.required"), function (index, value) {
    //         if (!$(value).val()) {
    //             valid = false;
    //         }
    //     });
    //     if (valid) {
    //         $(submitButton).click(function () {
    //             return false;
    //         });
    //         console.log('valid=false');
    //     } else {
    //         $(submitButton).unbind('click');
    //         console.log('valid=false');
    //     }
    // });

    $('#modalInfoFooterYes').click(function () {
        $('#formCropAdd').submit();
        console.log('Crop Add Form Submitted');
    });

</script>

<%--<script>--%>
<%--window.onload = function () {--%>
<%--$('#myModalSuccess').modal('show');--%>
<%--}--%>
<%--</script>--%>

</body>
</html>