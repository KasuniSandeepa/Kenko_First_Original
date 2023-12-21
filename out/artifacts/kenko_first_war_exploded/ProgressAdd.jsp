<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="models.Crops" %>
<%@ page import="services.CropsServices" %>
<%@ page import="models.CropTypes" %>
<%@ page import="services.CropsServices" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Progress Add - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/slick/slick.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/custom/font-awesome.min.css">
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
</head>

<body class="text-left">

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute(PROFILES) == null) {
        response.sendRedirect("index.jsp");
    } else {
//        Profiles Profiles = (Profiles) request.getSession().getAttribute("Profiles");

        int PkProfiles = 0, PkLandDetails = 0, PkCrops = 0;
        PkCrops = Integer.parseInt(request.getParameter("PkCrops"));
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));
        PkProfiles = Integer.parseInt(request.getParameter("PkProfiles"));

%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblStatusAddBreadCrumbsStatusAddHeading">Progress Add</h1>
            <ul>
                <%--                <li><a id="lblStatusAddBreadCrumbsProfile" href="x.jsp">x</a></li>--%>
                <%--                <li><a id="lblStatusAddBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>--%>
                <li><a id="lblStatusAddBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li><a id="lblStatusAddBreadCrumbsCropDetails"
                       href="CropDetails.jsp?PkCrops=<%=PkCrops%>">Crop Details</a></li>
                <li><span id="lblStatusAddBreadCrumbsStatusAdd">Progress Add</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">

                        <!--row-->
                        <div class="row">
                            <!--col-left-->
                            <div class="col-lg-3 col-md-6 col-sm-6">

                                <div class="form-group">
                                    <label id="lblProgressAddAddAProgressFor">
                                        Add A Progress For</label>
                                </div>

                                <div class="mx-auto">

                                    <%
                                        Crops Crops = new CropsServices().CropsGet(PkCrops);
                                        String ImageUrl = "dist-assets/images/crops/".concat(Crops.getCropTypes().getDefaultImage());
                                    %>

                                    <div class="row mb-2">
                                        <div class="col-lg-7 col-md-4 col-3 mx-auto">
                                            <img class="img-fluid mb-2" src="<%=ImageUrl%>"
                                                 alt="<%=Crops.getCropTypes().getName()%>"/>
                                        </div>
                                        <div class="col-lg-7 col-md-8 col-9 mx-auto d-flex align-items-center d-flex justify-content-center">
                                            <p id="lblProgressAddCropName" class="text-primary">
                                                <%=Crops.getCropTypes().getName()%>
                                            </p>
                                        </div>
                                    </div>

                                </div>

                                <div class="flex-grow-1"></div>

                            </div>
                            <!--/col-left-->

                            <!--col-right-->
                            <div class="col-lg-9 col-md-12">

                                <!--form-->
                                <form id="formStatusAdd" class="submit-form" action="ProgressAddServlet" method="post">

                                    <!--crop-id-->
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="hidden" name="crop_id"
                                                   value="<%=PkCrops%>" required>
                                            <input type="hidden" name="land_id"
                                                   value="<%=PkLandDetails%>" required>
                                            <input type="hidden" name="farmer_id"
                                                   value="<%=PkProfiles%>" required>
                                        </div>
                                    </div>
                                    <!--/crop-id-->

                                    <!--inner-row-->
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="form-group">
                                                <label id="lblStatusAddStatusType">
                                                    Progress Type</label>
                                            </div>
                                            <!--                                                    <div class="btn-group"> -->

                                            <!--section-->
                                            <section id="slick">
                                                <div class="container p-0">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <!--carousel-->
                                                            <div class="parent">
                                                                <div class="col-md-4 m-1 p-0 rounded child">

                                                                    <input type="radio" name="status_type"
                                                                           value="Weeded" checked
                                                                           id="Weeded"
                                                                           data-toggle="collapse"
                                                                           data-target="#collapse-for-weed"
                                                                           class="validate-field"/>
                                                                    <label for="Weeded">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="d-block w-100 rounded p-1"
                                                                                 src="dist-assets/images/farm/rake-2.png"
                                                                                 alt="Weeded"/>
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressCarouselWeeded"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Weeded</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>
                                                                <div class="col-md-4 m-1 p-0 rounded child">

                                                                    <input type="radio" name="status_type"
                                                                           value="Watered"
                                                                           id="Watered"
                                                                           data-toggle="collapse"
                                                                           data-target="#collapse-for-water"/>
                                                                    <label for="Watered">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="d-block w-100 rounded p-1"
                                                                                 src="dist-assets/images/farm/watering-can.png"
                                                                                 alt="Watered"/>
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressCarouselWatered"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Watered</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>
                                                                <div class="col-md-4 m-1 p-0 rounded child">

                                                                    <input type="radio" name="status_type"
                                                                           value="Applied Fertilizer"
                                                                           id="Applied_Fertilizer"
                                                                           data-toggle="collapse"
                                                                           data-target="#collapse-for-fertilizer"/>
                                                                    <label for="Applied_Fertilizer">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="d-block w-100 rounded p-1"
                                                                                 src="dist-assets/images/farm/sack.png"
                                                                                 alt="Applied_Fertilizer"/>
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressCarouselAppliedFertilizer"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Applied Fertilizer</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>
                                                                <div class="col-md-4 m-1 p-0 rounded child">

                                                                    <input type="radio" name="status_type"
                                                                           value="Damaged"
                                                                           id="Damaged"
                                                                           data-toggle="collapse"
                                                                           data-target="#collapse-for-damage"/>
                                                                    <label for="Damaged">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="d-block w-100 rounded p-1"
                                                                                 src="dist-assets/images/farm/tree.png"
                                                                                 alt="Damaged"/>
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressCarouselDamaged"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Damaged</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>
                                                                <div class="col-md-4 m-1 p-0 rounded child">

                                                                    <input type="radio" name="status_type"
                                                                           value="Harvested"
                                                                           id="Harvested"
                                                                           data-toggle="collapse"
                                                                           data-target="#collapse-for-harvested-method"/>
                                                                    <label for="Harvested">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="d-block w-100 rounded p-1"
                                                                                 src="dist-assets/images/farm/bucket.png"
                                                                                 alt="Harvested"/>
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressCarouselHarvested"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Harvested</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>
                                                                <div class="col-md-4 m-1 child p-0 rounded">

                                                                    <input type="radio" name="status_type"
                                                                           value="Pest Controlled"
                                                                           id="Pest_Controlled"
                                                                           data-toggle="collapse"
                                                                           data-target="#collapse-for-pest"/>
                                                                    <label for="Pest_Controlled">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="d-block w-100 rounded p-1"
                                                                                 src="dist-assets/images/custom/pest.png"
                                                                                 alt="Weeded"/>
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressCarouselPestControlled"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Pest Controlled</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>
                                                            </div>
                                                            <!--/carousel-->
                                                            <!--/controls-->
                                                            <div class="arrow_prev">
                                                                        <span>
                                                                            <i class="fa fa-chevron-left fa-2x text-white"></i>
                                                                        </span>
                                                            </div>
                                                            <div class="arrow_next">
                                                                        <span>
                                                                            <i class="fa fa-chevron-right fa-2x text-white"></i>
                                                                        </span>
                                                            </div>
                                                            <!--/controls-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                            <!--/section-->

                                            <!--                                                     </div> -->
                                        </div>

                                        <!--collapsables-->
                                        <div class="col-md-12 form-group mt-2">

                                            <!--collapse-for-weed-->
                                            <div class="collapse" id="collapse-for-weed">

                                                <div class="row">
                                                    <div class="col-md-12 form-group">

                                                        <div class="form-group">
                                                            <label id="lblStatusAddWeededMeasurement">
                                                                Weeded Measurement</label>
                                                        </div>

                                                        <div id="UncountableUnits_1">

                                                            <div class="d-flex justify-content-around">

                                                                <div>
                                                                    <input id="Portion" type="radio"
                                                                           name="weeded_measurement" value="Portion"
                                                                           checked/>
                                                                    <label for="Portion">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/metrics/10p.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddWeededMeasurementPortion"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Portion</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Quarter" type="radio"
                                                                           name="weeded_measurement" value="Quarter"/>
                                                                    <label for="Quarter">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/metrics/25p.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddWeededMeasurementQuarter"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Quarter</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Half" type="radio"
                                                                           name="weeded_measurement" value="Half"/>
                                                                    <label for="Half">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/metrics/50p.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddWeededMeasurementHalf"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Half</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Three_Quarters" type="radio"
                                                                           name="weeded_measurement"
                                                                           value="Three_Quarters"/>
                                                                    <label for="Three_Quarters">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/metrics/75p.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddWeededMeasurementThreeQuarters"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Three Quarters</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="All" type="radio"
                                                                           name="weeded_measurement" value="All"/>
                                                                    <label for="All">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/metrics/100p.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddWeededMeasurementAll"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    All</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-weed-->

                                            <!--collapse-for-water-->
                                            <div class="collapse" id="collapse-for-water">

                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <!-- <div class="form-group">
                                                            <label id="lblStatusAddAddedMeasurement">Watered Measurement</label>
                                                        </div> -->

                                                        <div class="row">

                                                            <div class="col-md-6 col-6">
                                                                <div class="form-group">
                                                                    <label id="lblStatusAddWateredAmount">
                                                                        Watered - Amount</label>
                                                                </div>
                                                                <div class="input-group mt-3">
                                                                    <input type="number" name="watered_amount"
                                                                           id="txtStatusAddWateredAmount"
                                                                           class="form-control"
                                                                           min="1" max="1000" value="100"
                                                                           placeholder="Watered - Amount"/>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6 col-6">
                                                                <div class="form-group">
                                                                    <label id="lblStatusAddWateredMeasurement">
                                                                        Watered - Measurement</label>
                                                                </div>

                                                                <div class="d-flex justify-content-around">

                                                                    <div>
                                                                        <input id="Milli_Litres" type="radio"
                                                                               name="watered_measurement"
                                                                               value="Milli Litres" checked/>
                                                                        <label for="Milli_Litres">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/milli-litre.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddWateredMeasurementMilliLitres"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Milli Litres</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                    <div>
                                                                        <input id="Litres" type="radio"
                                                                               name="watered_measurement"
                                                                               value="Litres"/>
                                                                        <label for="Litres">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/litre.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddWateredMeasurementLitres"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Litres</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-water-->

                                            <!--collapse-for-fertilizer-->
                                            <div class="collapse" id="collapse-for-fertilizer">

                                                <div class="row">
                                                    <div class="col-md-12 form-group">
                                                        <div class="form-group">
                                                            <label id="lblStatusAddAppliedFertilizerType">
                                                                Applied Fertilizer - Type</label>
                                                        </div>

                                                        <div class="col-md-12 col-12 mt-2">

                                                            <div class="d-flex justify-content-around">

                                                                <div>
                                                                    <input id="Organic_Fertilizer" type="radio"
                                                                           name="fertilizer_type"
                                                                           value="Organic Fertilizer" checked/>
                                                                    <label for="Organic_Fertilizer">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/manure-organic.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddFertilizerTypeOrganicFertilizer"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Organic Fertilizer</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Animal_Manure" type="radio"
                                                                           name="fertilizer_type"
                                                                           value="Animal Manure"/>
                                                                    <label for="Animal_Manure">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/manure-animal.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddFertilizerTypeAnimalManure"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Animal Manure</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Green_Manure" type="radio"
                                                                           name="fertilizer_type" value="Green Manure"/>
                                                                    <label for="Green_Manure">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/manure-green.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddFertilizerTypeGreenManure"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Green Manure</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Compost" type="radio"
                                                                           name="fertilizer_type" value="Compost"/>
                                                                    <label for="Compost">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/manure-compost.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddFertilizerTypeCompost"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Compost</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Other_Fertilizer" type="radio"
                                                                           name="fertilizer_type"
                                                                           value="Other Fertilizer"/>
                                                                    <label for="Other_Fertilizer">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/manure-other.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddFertilizerTypeOtherFertilizer"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Other Fertilizer</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Liquid_Fertilizer" type="radio"
                                                                           name="fertilizer_type"
                                                                           value="Liquid Fertilizer"/>
                                                                    <label for="Liquid_Fertilizer">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/farm/indoor-plants.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddFertilizerTypeLiquidFertilizer"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Liquid Fertilizer</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                            </div>

                                                        </div>

                                                        <div class="row mt-2">

                                                            <div class="col-md-6 col-6">
                                                                <div class="form-group">
                                                                    <label id="lblStatusAddFertilizerAppliedAmount">
                                                                        Applied - Amount</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <input type="number" name="fertilizer_amount"
                                                                           id="txtStatusAddFertilizerAppliedAmount"
                                                                           class="form-control" min="1"
                                                                           max="1000" value="50"
                                                                           placeholder="Plot Breadth"/>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6 col-6">

                                                                <!--collapse-solid-fertilizer-->
                                                                <div class="collapse"
                                                                     id="collapse-for-solid-fertilizer">

                                                                    <div class="row">

                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label id="lblStatusAddFertilizerAppliedMeasurement">
                                                                                    Applied - Measurement</label>
                                                                            </div>

                                                                            <div class="d-flex justify-content-around">

                                                                                <div>
                                                                                    <input id="Fertilizer_Grams"
                                                                                           type="radio"
                                                                                           name="solid_fertilizer_measurement"
                                                                                           value="Grams" checked/>
                                                                                    <label for="Fertilizer_Grams">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/gram.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddSolidFertilizerMeasurementGrams"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Grams</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                                <div>
                                                                                    <input id="Fertilizer_Kilo_Grams"
                                                                                           type="radio"
                                                                                           name="solid_fertilizer_measurement"
                                                                                           value="Kilo Grams"/>
                                                                                    <label for="Fertilizer_Kilo_Grams">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/kilo-gram.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddSolidFertilizerMeasurementKiloGrams"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Kilo Grams</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                </div>
                                                                <!--/collapse-solid-fertilizer-->

                                                                <!--collapse-liquid-fertilizer-->
                                                                <div class="collapse"
                                                                     id="collapse-for-liquid-fertilizer">

                                                                    <div class="row">

                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label id="lblStatusAddFertilizerAppliedMeasurement2">
                                                                                    Applied - Measurement</label>
                                                                            </div>

                                                                            <div class="d-flex justify-content-around">

                                                                                <div>
                                                                                    <input id="Fertilizer_Milli_Litres"
                                                                                           type="radio"
                                                                                           name="liquid_fertilizer_measurement"
                                                                                           value="Milli Litres"
                                                                                           checked/>
                                                                                    <label for="Fertilizer_Milli_Litres">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/milli-litre.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddLiquidFertilizerMeasurementMilliLitres"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Milli Litres</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                                <div>
                                                                                    <input id="Fertilizer_Litres"
                                                                                           type="radio"
                                                                                           name="liquid_fertilizer_measurement"
                                                                                           value="Litres"/>
                                                                                    <label for="Fertilizer_Litres">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/litre.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddLiquidFertilizerMeasurementLitres"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Litres</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                </div>
                                                                <!--/collapse-liquid-fertilizer-->

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-fertilizer-->

                                            <!--collapse-for-damage-->
                                            <div class="collapse" id="collapse-for-damage">

                                                <div class="row">
                                                    <div class="col-md-12 form-group">

                                                        <div class="row">

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label id="lblStatusAddDamagedMeasurement">
                                                                        Damaged - Measurement</label>
                                                                </div>

                                                                <div class="d-flex justify-content-around">

                                                                    <div>
                                                                        <input id="Square_Feet" type="radio"
                                                                               name="damaged_measurement"
                                                                               value="Square Feet" checked/>
                                                                        <label for="Square_Feet">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/feet-square.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddDamagedMeasurementSquareFeet"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Square Feet</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                    <div>
                                                                        <input id="Square_Metres" type="radio"
                                                                               name="damaged_measurement"
                                                                               value="Square Metres"/>
                                                                        <label for="Square_Metres">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/metre-square.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddDamagedMeasurementSquareMetres"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Square Metres</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                    <div>
                                                                        <input id="Perches" type="radio"
                                                                               name="damaged_measurement"
                                                                               value="Perches"/>
                                                                        <label for="Perches">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/perch.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddDamagedMeasurementPerches"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Perches</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                    <div>
                                                                        <input id="Acres" type="radio"
                                                                               name="damaged_measurement"
                                                                               value="Acres"/>
                                                                        <label for="Acres">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/acre.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddDamagedMeasurementAcres"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Acres</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                    <div>
                                                                        <input id="Plots" type="radio"
                                                                               name="damaged_measurement"
                                                                        <%--                                                                               data-toggle="collapse"--%>
                                                                        <%--                                                                               data-target="#collapse-for-damaged-plot"--%>
                                                                               value="Plots"/>
                                                                        <label for="Plots">
                                                                            <div class="card m-1 p-1">
                                                                                <img class="card-img-top radio-image mx-auto"
                                                                                     src="dist-assets/images/metrics/plot.png"
                                                                                     alt="#">
                                                                                <div class="card-body p-0">
                                                                                    <p id="lblProgressAddDamagedMeasurementPlots"
                                                                                       class="m-0 p-0 text-center small">
                                                                                        Plots</p>
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                            <div class="col-md-6">
                                                                <!--collapse-for-damaged-amount-number-->
                                                                <%--                                                                <div class="collapse"--%>
                                                                <%--                                                                     id="collapse-for-damaged-amount-number">--%>
                                                                <div class="row">

                                                                    <div class="col-md-12 mb-2">
                                                                        <div class="form-group">
                                                                            <label id="lblStatusAddDamagedAmount">
                                                                                Damaged - Amount</label>
                                                                        </div>
                                                                        <div class="input-group">
                                                                            <input type="number"
                                                                                   id="txtStatusAddDamagedAmount"
                                                                                   name="damaged_amount"
                                                                                   class="form-control"
                                                                                   min="1" max="100" value="1"
                                                                                   placeholder="Damaged - Amount"/>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <%--                                                                </div>--%>
                                                                <!--collapse-for-damaged-amount-number-->

                                                                <!--collapse-for-damaged-plot-->
                                                                <%--                                                                <div class="collapse" id="collapse-for-damaged-plot">--%>
                                                                <%--                                                                    <div class="row">--%>

                                                                <%--                                                                        <div class="col-md-12 mt-2">--%>
                                                                <%--                                                                            <div class="form-group">--%>
                                                                <%--                                                                                <label id="lblStatusAddDamagedPlotSizeMeasurement">--%>
                                                                <%--                                                                                    Plot Size - Measurement</label>--%>
                                                                <%--                                                                            </div>--%>
                                                                <%--                                                                        </div>--%>

                                                                <%--                                                                        <div class="col-md-5 col-5">--%>
                                                                <%--                                                                            <input type="number"--%>
                                                                <%--                                                                                   id="txtStatusAddDamagedPlotSizeLength"--%>
                                                                <%--                                                                                   name="damaged_plot_size_length"--%>
                                                                <%--                                                                                   class="form-control"--%>
                                                                <%--                                                                                   min="1" max="100" value="4"--%>
                                                                <%--                                                                                   placeholder="Plot Length"/>--%>

                                                                <%--                                                                        </div>--%>

                                                                <%--                                                                        <div class="col-md-2 col-2 text-center">--%>
                                                                <%--                                                                            <p>x</p>--%>
                                                                <%--                                                                        </div>--%>

                                                                <%--                                                                        <div class="col-md-5 col-5">--%>
                                                                <%--                                                                            <input type="number"--%>
                                                                <%--                                                                                   id="txtStatusAddDamagedPlotSizeBreadth"--%>
                                                                <%--                                                                                   name="damaged_plot_size_breadth"--%>
                                                                <%--                                                                                   class="form-control"--%>
                                                                <%--                                                                                   min="1" max="100" value="4"--%>
                                                                <%--                                                                                   placeholder="Plot Breadth"/>--%>
                                                                <%--                                                                        </div>--%>

                                                                <%--                                                                        <div class="col-md-6 col-6">--%>
                                                                <%--                                                                            <div class="input-group mt-2">--%>
                                                                <%--                                                                                <div class="input-group-prepend">--%>
                                                                <%--                                                                <span class="input-group-text"--%>
                                                                <%--                                                                      id="lblStatusAddDamagedPlotSizeUnits">--%>
                                                                <%--                                                                    Units:--%>
                                                                <%--                                                                </span>--%>
                                                                <%--                                                                                </div>--%>
                                                                <%--                                                                                <select class="form-control"--%>
                                                                <%--                                                                                        name="damaged_plot_size_measurement">--%>
                                                                <%--                                                                                    <option--%>
                                                                <%--                                                                                            id="lblStatusAddDamagedPlotSizeUnitsFeet"--%>
                                                                <%--                                                                                            value="Feet" selected>Feet--%>
                                                                <%--                                                                                    </option>--%>
                                                                <%--                                                                                    <option--%>
                                                                <%--                                                                                            id="lblStatusAddDamagedPlotSizeUnitsMetres"--%>
                                                                <%--                                                                                            value="Metres">Metres--%>
                                                                <%--                                                                                    </option>--%>
                                                                <%--                                                                                </select>--%>
                                                                <%--                                                                            </div>--%>
                                                                <%--                                                                        </div>--%>

                                                                <%--                                                                        <div class="col-md-6 col-6">--%>
                                                                <%--                                                                            <div class="input-group mt-2">--%>
                                                                <%--                                                                                <div class="input-group-prepend">--%>
                                                                <%--                                                                <span class="input-group-text"--%>
                                                                <%--                                                                      id="lblStatusAddDamagedPlotSizePlots">--%>
                                                                <%--                                                                    Plots:--%>
                                                                <%--                                                                </span>--%>
                                                                <%--                                                                                </div>--%>
                                                                <%--                                                                                <input type="number"--%>
                                                                <%--                                                                                       id="txtStatusAddDamagedNoOfPlots"--%>
                                                                <%--                                                                                       name="damaged_no_of_plots"--%>
                                                                <%--                                                                                       class="form-control"--%>
                                                                <%--                                                                                       min="1" max="100" value="2"--%>
                                                                <%--                                                                                       placeholder="Plot Breadth"/>--%>
                                                                <%--                                                                            </div>--%>
                                                                <%--                                                                        </div>--%>

                                                                <%--                                                                    </div>--%>
                                                                <%--                                                                </div>--%>
                                                                <!--/collapse-for-damaged-plot-->

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-damage-->

                                            <!--collapse-for-harvested-method-->
                                            <div class="collapse" id="collapse-for-harvested-method">

                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="form-group">
                                                            <label id="lblStatusAddHarvestedMethod">
                                                                Harvested - Method</label>
                                                        </div>

                                                        <div class="d-flex justify-content-around">

                                                            <div>
                                                                <input id="Harvested_All" type="radio"
                                                                       name="harvested_method" value="All" checked/>
                                                                <label for="Harvested_All">
                                                                    <div class="card m-1 p-1">
                                                                        <img class="card-img-top radio-image mx-auto"
                                                                             src="dist-assets/images/metrics/100p.png"
                                                                             alt="#">
                                                                        <div class="card-body p-0">
                                                                            <p id="lblProgressAddHarvestedMethodAll"
                                                                               class="m-0 p-0 text-center small">All</p>
                                                                        </div>
                                                                    </div>
                                                                </label>
                                                            </div>

                                                            <div>
                                                                <input id="Harvested_Portion" type="radio"
                                                                       name="harvested_method" value="Portion"
                                                                       data-toggle="collapse"
                                                                       data-target="#collapse-for-portioned-harvest"/>
                                                                <label for="Harvested_Portion">
                                                                    <div class="card m-1 p-1">
                                                                        <img class="card-img-top radio-image mx-auto"
                                                                             src="dist-assets/images/metrics/0p-99p.png"
                                                                             alt="#">
                                                                        <div class="card-body p-0">
                                                                            <p id="lblProgressAddHarvestedMethodPortion"
                                                                               class="m-0 p-0 text-center small">
                                                                                Portion</p>
                                                                        </div>
                                                                    </div>
                                                                </label>
                                                            </div>

                                                        </div>

                                                        <!--collapse-for-portioned-harvest-->
                                                        <div class="collapse" id="collapse-for-portioned-harvest">

                                                            <div class="row mt-2">
                                                                <div class="col-md-12 form-group">

                                                                    <div class="row">

                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label id="lblStatusAddHarvestedMeasurement">
                                                                                    Harvested - Measurement</label>
                                                                            </div>

                                                                            <div class="d-flex justify-content-around">

                                                                                <div>
                                                                                    <input id="Harvested_Square_Feet"
                                                                                           type="radio"
                                                                                           name="harvested_measurement"
                                                                                           value="Square Feet"
                                                                                           checked/>
                                                                                    <label for="Harvested_Square_Feet">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/feet-square.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddHarvestedMeasurementSquareFeet"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Square Feet</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                                <div>
                                                                                    <input id="Harvested_Square_Metres"
                                                                                           type="radio"
                                                                                           name="harvested_measurement"
                                                                                           value="Square Metres"/>
                                                                                    <label for="Harvested_Square_Metres">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/metre-square.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddHarvestedMeasurementSquareMetres"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Square Metres</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                                <div>
                                                                                    <input id="Harvested_Perches"
                                                                                           type="radio"
                                                                                           name="harvested_measurement"
                                                                                           value="Perches"/>
                                                                                    <label for="Harvested_Perches">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/perch.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddHarvestedMeasurementPerches"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Perches</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                                <div>
                                                                                    <input id="Harvested_Acres"
                                                                                           type="radio"
                                                                                           name="harvested_measurement"
                                                                                           value="Acres"/>
                                                                                    <label for="Harvested_Acres">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/acre.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddHarvestedMeasurementAcres"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Acres</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                                <div>
                                                                                    <input id="Harvested_Plots"
                                                                                           type="radio"
                                                                                           name="harvested_measurement"
                                                                                           value="Plots"
                                                                                    <%--                                                                                           data-toggle="collapse"--%>
                                                                                    <%--                                                                                           data-target="#collapse-for-harvested-plot"--%>
                                                                                    />
                                                                                    <label for="Harvested_Plots">
                                                                                        <div class="card m-1 p-1">
                                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                                 src="dist-assets/images/metrics/plot.png"
                                                                                                 alt="#">
                                                                                            <div class="card-body p-0">
                                                                                                <p id="lblProgressAddHarvestedMeasurementPlots"
                                                                                                   class="m-0 p-0 text-center small">
                                                                                                    Plots</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                </div>

                                                                            </div>

                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <!--collapse-for-harvested-amount-number-->
                                                                            <%--                                                                            <div class="collapse"--%>
                                                                            <%--                                                                                 id="collapse-for-harvested-amount-number">--%>
                                                                            <div class="row">

                                                                                <div class="col-md-12 mb-2">
                                                                                    <div class="form-group">
                                                                                        <label id="lblStatusAddHarvestedAmount">
                                                                                            Harvested -
                                                                                            Amount</label>
                                                                                    </div>
                                                                                    <div class="input-group mt-3">
                                                                                        <input type="number"
                                                                                               id="txtStatusAddHarvestedAmount"
                                                                                               name="harvested_amount"
                                                                                               class="form-control"
                                                                                               min="1" max="100"
                                                                                               value="1"
                                                                                               placeholder="Harvested Amount"/>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <%--                                                                            </div>--%>
                                                                            <!--collapse-for-harvested-amount-number-->

                                                                            <!--collapse-for-harvested-plot-->
                                                                            <%--                                                                            <div class="collapse"--%>
                                                                            <%--                                                                                 id="collapse-for-harvested-plot">--%>
                                                                            <%--                                                                                <div class="row">--%>

                                                                            <%--                                                                                    <div class="col-md-12 form-group mt-2">--%>
                                                                            <%--                                                                                        <div class="form-group">--%>
                                                                            <%--                                                                                            <label id="lblStatusAddHarvestedPlotSizeMeasurement">--%>
                                                                            <%--                                                                                                Plot Size ---%>
                                                                            <%--                                                                                                Measurement</label>--%>
                                                                            <%--                                                                                        </div>--%>
                                                                            <%--                                                                                    </div>--%>

                                                                            <%--                                                                                    <div class="col-md-5 col-5">--%>
                                                                            <%--                                                                                        <input type="number"--%>
                                                                            <%--                                                                                               id="txtStatusAddHarvestedPlotSizeLength"--%>
                                                                            <%--                                                                                               name="harvested_plot_size_length"--%>
                                                                            <%--                                                                                               class="form-control"--%>
                                                                            <%--                                                                                               min="1" max="100"--%>
                                                                            <%--                                                                                               value="4"--%>
                                                                            <%--                                                                                               placeholder="Plot Length"/>--%>
                                                                            <%--                                                                                    </div>--%>

                                                                            <%--                                                                                    <div class="col-md-2 col-2 text-center">--%>
                                                                            <%--                                                                                        <p>x</p>--%>
                                                                            <%--                                                                                    </div>--%>

                                                                            <%--                                                                                    <div class="col-md-5 col-5">--%>
                                                                            <%--                                                                                        <input type="number"--%>
                                                                            <%--                                                                                               id="txtStatusAddHarvestedPlotSizeBreadth"--%>
                                                                            <%--                                                                                               name="harvested_plot_size_breadth"--%>
                                                                            <%--                                                                                               class="form-control"--%>
                                                                            <%--                                                                                               min="1" max="100"--%>
                                                                            <%--                                                                                               value="4"--%>
                                                                            <%--                                                                                               placeholder="Plot Breadth"/>--%>
                                                                            <%--                                                                                    </div>--%>

                                                                            <%--                                                                                    <div class="col-md-6 col-6">--%>
                                                                            <%--                                                                                        <div class="input-group mt-2">--%>
                                                                            <%--                                                                                            <div class="input-group-prepend">--%>
                                                                            <%--<span class="input-group-text"--%>
                                                                            <%--      id="lblStatusAddHarvestedPlotSizeUnits">--%>
                                                                            <%--Units:--%>
                                                                            <%--</span>--%>
                                                                            <%--                                                                                            </div>--%>
                                                                            <%--                                                                                            <select class="form-control"--%>
                                                                            <%--                                                                                                    name="harvested_plot_size_measurement">--%>
                                                                            <%--                                                                                                <option--%>
                                                                            <%--                                                                                                        id="lblStatusAddHarvestedPlotSizeUnitsFeet"--%>
                                                                            <%--                                                                                                        value="Feet"--%>
                                                                            <%--                                                                                                        selected>Feet--%>
                                                                            <%--                                                                                                </option>--%>
                                                                            <%--                                                                                                <option--%>
                                                                            <%--                                                                                                        id="lblStatusAddHarvestedPlotSizeUnitsMetres"--%>
                                                                            <%--                                                                                                        value="Metres">--%>
                                                                            <%--                                                                                                    Metres--%>
                                                                            <%--                                                                                                </option>--%>
                                                                            <%--                                                                                            </select>--%>
                                                                            <%--                                                                                        </div>--%>
                                                                            <%--                                                                                    </div>--%>

                                                                            <%--                                                                                    <div class="col-md-6 col-6">--%>
                                                                            <%--                                                                                        <div class="input-group mt-2">--%>
                                                                            <%--                                                                                            <div class="input-group-prepend">--%>
                                                                            <%--<span class="input-group-text"--%>
                                                                            <%--      id="lblStatusAddHarvestedPlotSizePlots">--%>
                                                                            <%--Plots:--%>
                                                                            <%--</span>--%>
                                                                            <%--                                                                                            </div>--%>
                                                                            <%--                                                                                            <input type="number"--%>
                                                                            <%--                                                                                                   id="txtStatusAddHarvestedNoOfPlots"--%>
                                                                            <%--                                                                                                   name="harvested_no_of_plots"--%>
                                                                            <%--                                                                                                   class="form-control"--%>
                                                                            <%--                                                                                                   min="1" max="100"--%>
                                                                            <%--                                                                                                   value="2"--%>
                                                                            <%--                                                                                                   placeholder="Plot Breadth"/>--%>
                                                                            <%--                                                                                        </div>--%>
                                                                            <%--                                                                                    </div>--%>

                                                                            <%--                                                                                </div>--%>
                                                                            <%--                                                                            </div>--%>
                                                                            <!--/collapse-for-harvested-plot-->

                                                                        </div>

                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>
                                                        <!--collapse-for-portioned-harvest-->

                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-harvested-method-->

                                            <!--collapse-for-pest-->
                                            <div class="collapse" id="collapse-for-pest">

                                                <div class="row">
                                                    <div class="col-md-12 form-group">
                                                        <div class="form-group">
                                                            <label id="lblStatusAddUsedPestControlMethod">
                                                                Used Pest Control Method</label>
                                                        </div>

                                                        <div class="col-md-12 col-12">

                                                            <div class="d-flex justify-content-around">

                                                                <div>
                                                                    <input id="Physically_Removed" type="radio"
                                                                           name="pest_control_method"
                                                                           value="Square Feet"
                                                                           checked/>
                                                                    <label for="Physically_Removed">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/physical-pest.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddPestControlMethodPhysicallyRemoved"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Physically Removed</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Removed_Crop" type="radio"
                                                                           name="pest_control_method"
                                                                           value="Square Metres"/>
                                                                    <label for="Removed_Crop">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/physical-crop.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddPestControlMethodRemovedCrop"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Removed Crop</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Organic_Pesticide" type="radio"
                                                                           name="pest_control_method"
                                                                           value="Organic Pesticide"/>
                                                                    <label for="Organic_Pesticide">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/custom/pesticide-green.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddPestControlMethodOrganicPesticide"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Organic Pesticide</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                                <div>
                                                                    <input id="Chemical_Pesticide" type="radio"
                                                                           name="pest_control_method"
                                                                           value="Chemical Pesticide"/>
                                                                    <label for="Chemical_Pesticide">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top radio-image mx-auto"
                                                                                 src="dist-assets/images/farm/pesticide.png"
                                                                                 alt="#">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblProgressAddPestControlMethodChemicalPesticide"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    Chemical Pesticide</p>
                                                                            </div>
                                                                        </div>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <!--collapse-for-pesticide-amount-->
                                                        <div class="collapse" id="collapse-for-pesticide-amount">

                                                            <div class="row mt-2">

                                                                <div class="col-md-6 col-6">
                                                                    <div class="form-group">
                                                                        <label id="lblStatusAddUsedPesticideAmount">
                                                                            Used Pesticide - Amount</label>
                                                                    </div>
                                                                    <div class="input-group">
                                                                        <input type="number" name="pesticide_amount"
                                                                               id="txtStatusAddUsedPesticideAmount"
                                                                               class="form-control"
                                                                               min="1" max="1000" value="25"
                                                                               placeholder="Pesticide Amount"/>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6 col-6">
                                                                    <div class="form-group">
                                                                        <label id="lblStatusAddUsedPesticideMeasurement">
                                                                            Used Pesticide - Measurement</label>
                                                                    </div>

                                                                    <div class="d-flex justify-content-around">

                                                                        <div>
                                                                            <input id="Pesticide_Milli_Litres"
                                                                                   type="radio"
                                                                                   name="pesticide_measurement"
                                                                                   value="Milli Litres" checked/>
                                                                            <label for="Pesticide_Milli_Litres">
                                                                                <div class="card m-1 p-1">
                                                                                    <img class="card-img-top radio-image mx-auto"
                                                                                         src="dist-assets/images/metrics/milli-litre.png"
                                                                                         alt="#">
                                                                                    <div class="card-body p-0">
                                                                                        <p id="lblProgressAddPesticideMeasurementMilliLitres"
                                                                                           class="m-0 p-0 text-center small">
                                                                                            Milli Litres</p>
                                                                                    </div>
                                                                                </div>
                                                                            </label>
                                                                        </div>

                                                                        <div>
                                                                            <input id="Pesticide_Litres" type="radio"
                                                                                   name="pesticide_measurement"
                                                                                   value="Litres"/>
                                                                            <label for="Pesticide_Litres">
                                                                                <div class="card m-1 p-1">
                                                                                    <img class="card-img-top radio-image mx-auto"
                                                                                         src="dist-assets/images/metrics/litre.png"
                                                                                         alt="#">
                                                                                    <div class="card-body p-0">
                                                                                        <p id="lblProgressAddPesticideMeasurementLitres"
                                                                                           class="m-0 p-0 text-center small">
                                                                                            Litres</p>
                                                                                    </div>
                                                                                </div>
                                                                            </label>
                                                                        </div>

                                                                    </div>

                                                                </div>

                                                            </div>

                                                        </div>
                                                        <!--/collapse-for-pesticide-amount-->

                                                    </div>

                                                </div>

                                            </div>
                                            <!--/collapse-for-pest-->

                                        </div>
                                        <!--/collapsables-->

                                        <div class="col-md-6 form-group">
                                            <div class="form-group">
                                                <label id="lblStatusAddAddedDate">Added Date</label>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
<span class="input-group-text">
<i class="i-Pen-3"></i>
</span>
                                                </div>
                                                <input class="form-control validate-field" type="date"
                                                       placeholder="Added Date"
                                                       id="txtStatusAddAddedDate" value="" name="status_added_date"
                                                       aria-label="StatusAddedDate"
                                                       aria-describedby="txtStatusAddedDate" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <div class="form-group">
                                                &nbsp;
                                            </div>
                                            <button type="submit"
                                                    class="btn btn-primary btn-block form-submit-button"
                                                    id="btnCropAddAddNewCrop">Save
                                            </button>
                                        </div>
                                    </div>
                                    <!--/inner-row-->

                                </form>
                                <!--/form-->

                            </div>
                            <!--/col-right-->

                        </div>
                        <!--row-->

                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <%
            String Response = "None";
            if (request.getParameter("IsStatusSaved") != null &&
                    request.getParameter("IsStatusSaved").equals("false")) {
//show alert
                Response = "IstStatusSavedFalse";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsStatusSavedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
<span class="text-center">
<i class="text-danger display-3 i-Close"></i>
</span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01BodyIsSatusSavedFalse" class="mt-4 mb-4">Progress saving
                                        failed.</p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError01Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-error-->

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
        <!--/row-->

    </div>

    <!-- end of main-content -->

    <!-- ============ Body content end ============= -->

    <!--Footer Start-->
    <%@include file="FooterKenkoFirst.jsp" %>
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
<script src="dist-assets/slick/slick.min.js"></script>
<%--to avaoid js > console errors--%>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_western.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_central.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_north_western.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_eastern.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_southern.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_northern.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_north_central.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_sabaragamuwa.js"></script>
<script src="dist-assets/js/custom/gn_divisions/gn_divisions_uva.js"></script>
<script src="dist-assets/js/custom/distric_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/gn_division_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>

<script type="text/javascript">
    //default
    $('#collapse-for-weed').collapse('show');
    //select
    $("input[name='status_type']:radio").change(function () {
        let value = $(this).val();
        console.log(value);
        if (value != 'Weeded') {
            $('#collapse-for-weed').collapse('hide');
        }
        if (value != 'Watered') {
            $('#collapse-for-water').collapse('hide');
        }
        if (value != 'Applied Fertilizer') {
            $('#collapse-for-fertilizer').collapse('hide');
        }
        if (value != 'Damaged') {
            $('#collapse-for-damage').collapse('hide');
        }
        if (value != 'Harvested') {
            $('#collapse-for-harvested-method').collapse('hide');
        }
        if (value != 'Pest Controlled') {
            $('#collapse-for-pest').collapse('hide');
        }
    });
</script>

<script type="text/javascript">
    /*default display on load*/
    $('#collapse-for-solid-fertilizer').collapse('show');
    /*display on control*/
    $('#formStatusAdd input').on('change', function () {
        let value = $('input[name=fertilizer_type]:checked', '#formStatusAdd').val();
        console.log(value);
        if (value == 'Liquid Fertilizer') {
            $('#collapse-for-solid-fertilizer').collapse('hide');
            $('#collapse-for-liquid-fertilizer').collapse('show');
        } else {
            $('#collapse-for-liquid-fertilizer').collapse('hide');
            $('#collapse-for-solid-fertilizer').collapse('show');
        }
    });
</script>

<%--<script type="text/javascript">--%>
<%--    /*default display on load*/--%>
<%--    $('#collapse-for-damaged-plot').collapse('show');--%>
<%--    /*display on control*/--%>
<%--    $('#formStatusAdd input').on('change', function () {--%>
<%--        let value = $('input[name=damaged_measurement]:checked', '#formStatusAdd').val();--%>
<%--        console.log(value);--%>
<%--        if (value == 'Plots') {--%>
<%--            $('#collapse-for-damaged-amount-number').collapse('hide');--%>
<%--            $('#collapse-for-damaged-plot').collapse('show');--%>
<%--        } else {--%>
<%--            $('#collapse-for-damaged-plot').collapse('hide');--%>
<%--            $('#collapse-for-damaged-amount-number').collapse('show');--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

<%--<script type="text/javascript">--%>
<%--    /*default display on load*/--%>
<%--    $('#collapse-for-harvested-amount-number').collapse('show');--%>
<%--    /*display on control*/--%>
<%--    $('#formStatusAdd input').on('change', function () {--%>
<%--        let value = $('input[name=harvested_measurement]:checked', '#formStatusAdd').val();--%>
<%--        console.log(value);--%>
<%--        if (value == 'Plots') {--%>
<%--            $('#collapse-for-harvested-amount-number').collapse('hide');--%>
<%--            $('#collapse-for-harvested-plot').collapse('show');--%>
<%--        } else {--%>
<%--            $('#collapse-for-harvested-plot').collapse('hide');--%>
<%--            $('#collapse-for-harvested-amount-number').collapse('show');--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

<script type="text/javascript">
    $('#formStatusAdd input').on('change', function () {
        let value = $('input[name=harvested_method]:checked', '#formStatusAdd').val();
        console.log(value);
        if (value != 'Portion') {
            $('#collapse-for-portioned-harvest').collapse('hide');
        }
    });
</script>

<script type="text/javascript">
    $('#formStatusAdd input').on('change', function () {
        let value = $('input[name=pest_control_method]:checked', '#formStatusAdd').val();
        console.log(value);
        if (value == 'Organic Pesticide' || value == 'Chemical Pesticide') {
            $('#collapse-for-pesticide-amount').collapse('show');
        } else {
            $('#collapse-for-pesticide-amount').collapse('hide');
        }
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.parent').slick({
            slidesToShow: 6,
            slidesToScroll: 2,
            /*dots: true,
            infinite: true,
            cssEase: 'linear',*/
            prevArrow: '.arrow_prev',
            nextArrow: '.arrow_next',
            responsive: [
                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 3
                    }
                }
            ]
        });
    });
</script>

<script type="text/javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsStatusSavedFalse':
// alert("Success!");
                $('#ModalError01IsStatusSavedFalse').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<script type="text/javascript">

    const language = getLanguage();
    console.log(language);

    if (language == "Sinhala") {
        ToggleLanguageSinhala();
        TranslateCropLabel("Sinhala");
    }
    if (language == "Tamil") {
        ToggleLanguageTamil();
        TranslateCropLabel("Tamil");
    }
    if (language == "English") {
        ToggleLanguageEnglish();
        TranslateCropLabel("English");
    }

    function TranslateCropLabel(language) {

        let CropLabel = '', TranslatedCropLabel = '';

        switch (language) {
            case "Sinhala":
                CropLabel = document.getElementById("lblProgressAddCropName");
                console.log('Sinhala, ' + CropLabel.innerText);
                TranslatedCropLabel = translateCrops("Sinhala", CropLabel.innerText);
                console.log('TranslatedCropLabel: ' + TranslatedCropLabel);
                CropLabel.innerText = TranslatedCropLabel;
                break;
            case "Tamil":
                CropLabel = document.getElementById("lblProgressAddCropName");
                console.log('Tamil, ' + CropLabel.innerText);
                TranslatedCropLabel = translateCrops("Tamil", CropLabel.innerText);
                console.log('TranslatedCropLabel: ' + TranslatedCropLabel);
                CropLabel.innerHTML = TranslatedCropLabel;
            case "English":
                CropLabel = document.getElementById("lblProgressAddCropName");
                // console.log('English, ' + CropLabel.innerText);
                TranslatedCropLabel = translateCrops("English", CropLabel.innerText);
                console.log('TranslatedCropLabel: ' + TranslatedCropLabel);
                CropLabel.innerHTML = TranslatedCropLabel;
            default:
                break;
            // code block
        }

    }

</script>

<script type="text/javascript">
    $(document).ready(function () {
// Disable button
        $('.form-submit-button').prop('disabled', true);
// Cache fields that you want to validate
        var $fieldsToCheck = $('.submit-form .validate-field');
// Function to ensure fields are not empty
        var checkFields = function () {
// Get array of empty fields
            var emptyFields = $fieldsToCheck.map(function () {
                return this.value;
            }).get().filter(function (val) {
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
    $(document).ready(function () {
        $('.submit-form').submit(function () {
            $('#ModalInfoLoader').modal('show');
            console.log('form submitted');
        });
    });
</script>

<%
    String CropCultivatedLandArea = Crops.getCultivatedLandArea();
    System.out.println(Crops.getCropTypes().getName() + ": " + CropCultivatedLandArea);
    int Length = 0, Breadth = 0, NoOfPlots = 0;
%>

<%--<script type="text/javascript">--%>
<%--    function ProgressMaxAmountsAutoSet() {--%>
<%--        let Length =<%=Length%>, Breadth =<%=Breadth%>, NoOfPlots =<%=NoOfPlots%>, Total = 0;--%>
<%--        console.log(Length + ', ' + Breadth + ', ' + NoOfPlots);--%>
<%--        let DamagedAmount = document.getElementById('damaged_amount');--%>
<%--        let HarvestedAmount = document.getElementById('harvested_amount');--%>
<%--        DamagedAmount.max = Length;--%>
<%--    }--%>
<%--    ProgressMaxAmountsAutoSet();--%>
<%--</script>--%>

<%
    }
%>

</body>
</html>