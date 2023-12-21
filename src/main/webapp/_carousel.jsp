<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Carousel</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>

    <style type="text/css">
        .carousel_wrap .carousel-control-prev-icon {
            width: 40px;
            height: 40px;
            background-image:
                    url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23c593d8' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");
        }
        .carousel_wrap .carousel-control-next-icon {
            width: 40px;
            height: 40px;
            background-image:
                    url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23c593d8' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
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

        <div class="row">
            <div class="col-md-12">

                <div class="card-body">
                    <div class="carousel_wrap">
                        <div class="carousel slide" id="carouselExampleCaption" data-interval="false" data-ride="carousel">
                            <div class="carousel-inner row w-50 mx-auto" role="listbox">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="dist-assets/images/crops/carrot.png" alt="First slide" />
                                        <div class="carousel-caption">
                                            <h3 class="h3-responsive">Carrot</h3>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="dist-assets/images/crops/tomato.png" alt="Third slide" />
                                        <div class="carousel-caption">
                                            <h3 class="h3-responsive">Tomato</h3>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="dist-assets/images/crops/peas.png" alt="Second slide" />
                                        <div class="carousel-caption">
                                            <h3 class="h3-responsive">Beans</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleCaption" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only text-dark">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleCaption" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only text-dark">Next</span>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%--<!--form-->--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-12">--%>
                <%--<div class="card mb-4">--%>
                    <%--<div class="card-body">--%>

                        <%--<div class="row slider">--%>
                            <%--<div class="col-md-4">--%>
                                <%--<div class="card border-0 p-1">--%>
                                    <%--<a href="#" title="image 1">--%>
                                        <%--<img class="d-block w-100" src="dist-assets/images/crops/onion.png">--%>
                                        <%--<div class="carousel-caption p-0">--%>
                                            <%--<div class="p-1 rounded opaque">--%>
                                                <%--<p class="m-0 p-0 text-dark small">onion</p>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<div class="card border-0 p-1">--%>
                                    <%--<a href="#" title="image 1">--%>
                                        <%--<img class="d-block w-100" src="dist-assets/images/crops/banana.png">--%>
                                        <%--<div class="carousel-caption p-0">--%>
                                            <%--<div class="p-1 rounded opaque">--%>
                                                <%--<p class="m-0 p-0 text-dark small">banana</p>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<div class="card border-0 p-1">--%>
                                    <%--<a href="#" title="image 1">--%>
                                        <%--<img class="d-block w-100" src="dist-assets/images/crops/peas.png">--%>
                                        <%--<div class="carousel-caption p-0">--%>
                                            <%--<div class="p-1 rounded opaque">--%>
                                                <%--<p class="m-0 p-0 text-dark small">beans</p>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<div class="card border-0 p-1">--%>
                                    <%--<a href="#" title="image 1">--%>
                                        <%--<img class="d-block w-100" src="dist-assets/images/crops/papaya.png">--%>
                                        <%--<div class="carousel-caption p-0">--%>
                                            <%--<div class="p-1 rounded opaque">--%>
                                                <%--<p class="m-0 p-0 text-dark small">papaya</p>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<div class="card border-0 p-1">--%>
                                    <%--<a href="#" title="image 1">--%>
                                        <%--<img class="d-block w-100" src="dist-assets/images/crops/tomato.png">--%>
                                        <%--<div class="carousel-caption p-0">--%>
                                            <%--<div class="p-1 rounded opaque">--%>
                                                <%--<p class="m-0 p-0 text-dark small">tomato</p>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<div class="card border-0 p-1">--%>
                                    <%--<a href="#" title="image 1">--%>
                                        <%--<img class="d-block w-100" src="dist-assets/images/crops/leaks.png">--%>
                                        <%--<div class="carousel-caption p-0">--%>
                                            <%--<div class="p-1 rounded opaque">--%>
                                                <%--<p class="m-0 p-0 text-dark small">leeks</p>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="row mt-1">--%>
                            <%--<div class="col-md-12 text-center">--%>
                <%--<span class="arrow_prev mr-5">--%>
                    <%--<i class="fa fa-chevron-left fa-2x text-primary"></i>--%>
                <%--</span>--%>
                                <%--<span class="arrow_next ml-5">--%>
                    <%--<i class="fa fa-chevron-right fa-2x text-primary"></i>--%>
                <%--</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!--/form-->--%>

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

<script src="dist-assets/slick/slick.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.slider').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            prevArrow: '.arrow_prev',
            nextArrow: '.arrow_next'
        });
    });
</script>

</body>
</html>