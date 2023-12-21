<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="models.CropTypes" %>
<%@ page import="services.CropTypesServices" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Crop Add - Kenko 1st Agri Business</title>
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
        int PkLandDetails = 0;
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));

        String LandExtentAvailable = "";
        double LandExtentAvailableNumber = 0.0;
        int LandExtentAvailableNumberInInteger = 0;
        if (request.getParameter("LandExtentAvailable") != null) {
            LandExtentAvailable = request.getParameter("LandExtentAvailable").replace("_", " ");
            LandExtentAvailableNumber = Double.parseDouble(LandExtentAvailable.split(" ")[0]);
            LandExtentAvailableNumberInInteger = (int) LandExtentAvailableNumberInInteger;
        }
//        System.out.println("LandExtentAvailable: " + LandExtentAvailable);
//        System.out.println("LandExtentAvailableNumber: " + LandExtentAvailableNumber);
//        System.out.println("LandExtentAvailableNumberInInteger: " + LandExtentAvailableNumberInInteger);
%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content">
        <div class="breadcrumb">
            <h1 id="lblCropAddBreadCrumbsCropAddHeading">Crop Add</h1>
            <ul>
                <%--                <li><a id="lblCropAddBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>--%>
                <%--                <li><a id="lblCropAddBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>--%>
                <li><a id="lblCropAddBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li><span id="lblCropAddBreadCrumbsCropAdd">Crop Add</span></li>
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
                            <div class="col-md-6 mb-3">

                                <!--form-->
                                <form id="formCropAdd" class="submit-form" action="CropAddServlet" method="post"
                                      enctype="multipart/form-data">

                                    <!--land-id-->
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="hidden" name="land_id"
                                                   value="<%=PkLandDetails%>" required>
                                        </div>
                                    </div>
                                    <!--/land-id-->

                                    <!--inner-row-->
                                    <div class="row">

                                        <div class="col-md-12 form-group">
                                            <div class="form-group">
                                                <label id="lblCropAddCropType">Crop Type</label>
                                            </div>

                                            <!--carousel-->

                                            <!--section-->
                                            <section id="slick">
                                                <div class="container p-0">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="parent">

                                                                <!--carousel-->
                                                                <%
                                                                    //--
                                                                    int CropCount = 0;
                                                                    //--
                                                                    String CropTypeDefaultImageUrl = "", CropNameWhitespaceRemoved = "";
                                                                    for (CropTypes CropTypes : new CropTypesServices().CropTypesListGet()) {
                                                                        CropTypeDefaultImageUrl = "dist-assets/images/crops/".concat(CropTypes.getDefaultImage());
                                                                        CropNameWhitespaceRemoved = CropTypes.getName().replaceAll(" ", "");
                                                                %>

                                                                <div class="col-md-4 m-1 p-0 rounded child">

                                                                    <input id="<%=CropNameWhitespaceRemoved%>"
                                                                           type="radio"
                                                                           name="crop_type" class="validate-field"
                                                                           value="<%=CropTypes.getPkCropTypes() + "_" + CropTypes.getName()%>"/>

                                                                    <label for="<%=CropNameWhitespaceRemoved%>">
                                                                        <div class="card m-1 p-1">
                                                                            <img class="card-img-top mx-auto"
                                                                                 src="<%=CropTypeDefaultImageUrl%>"
                                                                                 alt="<%=CropTypes.getName()%>">
                                                                            <div class="card-body p-0">
                                                                                <p id="lblCropCarousel<%=CropCount%>"
                                                                                   class="m-0 p-0 text-center small">
                                                                                    <%=CropTypes.getName()%>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </label>

                                                                </div>

                                                                <%
                                                                        CropCount++;
                                                                    }
                                                                %>

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

                                            <!--/carousel-->

                                        </div>
                                        <div class="col-md-6 form-group mt-2">
                                            <div class="form-group">
                                                <label id="lblCropAddCropExtentMeasurement">
                                                    Cultivated Land Area - Measurement</label>
                                            </div>

                                            <div class="d-flex justify-content-around">

                                                <div>
                                                    <input id="Square_Feet" type="radio" name="crop_extent_unit"
                                                           value="Square Feet" class="validate-field" checked required/>
                                                    <label for="Square_Feet">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/feet-square.png"
                                                                 alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropExtentMeasurementSquareFeet"
                                                                   class="m-0 p-0 text-center small">Square Feet</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div>
                                                    <input id="Square_Metres" type="radio" name="crop_extent_unit"
                                                           value="Square Metres"/>
                                                    <label for="Square_Metres">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/metre-square.png"
                                                                 alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropExtentMeasurementSquareMetres"
                                                                   class="m-0 p-0 text-center small">Square Metres</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div>
                                                    <input id="Perches" type="radio" name="crop_extent_unit"
                                                           value="Perches"/>
                                                    <label for="Perches">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/perch.png" alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropExtentMeasurementPerches"
                                                                   class="m-0 p-0 text-center small">Perches</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div>
                                                    <input id="Acres" type="radio" name="crop_extent_unit"
                                                           value="Acres"/>
                                                    <label for="Acres">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/acre.png" alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropExtentMeasurementAcres"
                                                                   class="m-0 p-0 text-center small">Acres</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div>
                                                    <input id="Plots" type="radio" name="crop_extent_unit"
                                                           value="Plots"
                                                           data-toggle="collapse" data-target="#collapse-for-plot"/>
                                                    <label for="Plots">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/plot.png" alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropExtentMeasurementPlots"
                                                                   class="m-0 p-0 text-center small">Plots</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-md-6 form-group mt-2">

                                            <!--collapse-for-land-area-number-->
                                            <div class="collapse" id="collapse-for-land-area-number">
                                                <div class="row">

                                                    <div class="col-md-12 form-group mb-0">
                                                        <div class="form-group">
                                                            <label id="lblCropAddCropExtentAmount">
                                                                Cultivated Land Area - Number</label>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                    <span class="input-group-text">
                                                                        <i class="i-Pen-3"></i>
                                                                    </span>
                                                            </div>
                                                            <input class="form-control validate-field" type="number"
                                                                   placeholder="Cultivated Land Area - Number"
                                                                   id="txtCropAddCropExtentNumber"
                                                                   name="crop_extent_number"
                                                                   aria-label="CropExtentNumber"
                                                                   aria-describedby="txtCropAddCropExtentNumber"
                                                                   min="1" max="100" value="10"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-land-area-number-->

                                            <!--collapse-for-plot-->
                                            <div class="collapse" id="collapse-for-plot">
                                                <div class="row">

                                                    <div class="col-md-12 form-group mb-0">
                                                        <div class="form-group">
                                                            <label id="lblCropAddPlotSizeMeasurement">
                                                                Plot Size - Measurements</label>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5 col-5">
                                                        <input type="number" name="plot_size_length"
                                                               id="txtCropAddPlotLength"
                                                               class="form-control validate-field" min="1" max="100"
                                                               value="4" placeholder="Length"/>

                                                    </div>

                                                    <div class="col-md-2 col-2 text-center">
                                                        <p>x</p>
                                                    </div>

                                                    <div class="col-md-5 col-5">
                                                        <input type="number" name="plot_size_breadth"
                                                               id="txtCropAddPlotBreadth"
                                                               class="form-control validate-field" min="1" max="100"
                                                               value="4" placeholder="Breadth"/>
                                                    </div>

                                                    <div class="col-md-12 col-6">
                                                        <div class="input-group mt-2">
                                                            <div class="input-group-prepend">
                                                                    <span class="input-group-text"
                                                                          id="lblCropAddPlotUnit">
                                                                        Unit:
                                                                    </span>
                                                            </div>
                                                            <select class="form-control"
                                                                    name="plot_size_measurement_unit">
                                                                <option id="cmbCropAddPlotUnitFeet"
                                                                        value="Feet" selected>Feet
                                                                </option>
                                                                <option id="cmbCropAddPlotUnitMetres"
                                                                        value="Metres">Metres
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-6">
                                                        <div class="input-group mt-2">
                                                            <div class="input-group-prepend">
                                                                    <span class="input-group-text"
                                                                          id="lblCropAddPlotCount">
                                                                        Plots:
                                                                    </span>
                                                            </div>
                                                            <input id="txtCropAddPlotCount"
                                                                   type="number" name="no_of_plots" class="form-control"
                                                                   min="1" max="100" value="2"
                                                                   placeholder="Plots"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <!--/collapse-for-plot-->

                                        </div>
                                        <div class="col-md-6 form-group">
                                            <div class="form-group">
                                                <label id="lblCropAddCropPlantedDate">Planted Date</label>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="i-Pen-3"></i>
                                                            </span>
                                                </div>
                                                <input class="form-control validate-field" type="date"
                                                       placeholder="Planted Date"
                                                       id="txtCropAddCropPlantedDate" value="" name="crop_planted_date"
                                                       aria-label="CropPlantedDate"
                                                       aria-describedby="txtCropAddCropPlantedDate" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 form-group text-right">
                                            <!-- <div class="form-group">
                                                &nbsp;
                                            </div> -->
                                            <label class="switch switch-primary mt-3 mb-2">
                                                <span id="lblCropAddMoreDetails">More Details</span>
                                                <input type="checkbox" id="myCheckbox"
                                                       onchange="CropAddMoreDetailsShowAndHide()">
                                                <span class="slider round"></span>
                                            </label>
                                        </div>

                                    </div>
                                    <!--/inner-row-->

                                    <!--inner-row-->
                                    <div class="row">
                                        <div class="col-md-6 form-group"
                                             style="display:none;" id="Nursery_Grown_Number">
                                            <div class="form-group">
                                                <label id="lblCropAddNurseryGrownNumber">
                                                    Nursery Grown Duration - Number</label>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="i-Pen-3"></i>
                                                            </span>
                                                </div>
                                                <input class="form-control" type="number"
                                                       placeholder="Nursery Grown Duration - Number"
                                                       id="txtCropAddNurseryGrownNumber" value="0"
                                                       name="crop_nursery_grown_number"
                                                       aria-label="NurseryGrownNumber"
                                                       aria-describedby="txtCropAddNurseryGrownNumber"
                                                       min="0" max="99"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 form-group"
                                             style="display:none;" id="Nursery_Grown_Measurement">
                                            <div class="form-group">
                                                <label id="lblCropAddNurseryGrownMeasurement">
                                                    Nursery Grown Duration - Measurement</label>
                                            </div>

                                            <div class="d-flex justify-content-around">

                                                <div>
                                                    <input id="Days" type="radio" name="crop_nursery_grown_unit"
                                                           value="Days" checked/>
                                                    <label for="Days">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/days.png" alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropNurseryGrownMeasurementDays"
                                                                   class="m-0 p-0 text-center small">Days</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div>
                                                    <input id="Weeks" type="radio" name="crop_nursery_grown_unit"
                                                           value="Weeks"/>
                                                    <label for="Weeks">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/weeks.png" alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropNurseryGrownMeasurementWeeks"
                                                                   class="m-0 p-0 text-center small">Weeks</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div>
                                                    <input id="Months" type="radio" name="crop_nursery_grown_unit"
                                                           value="Months"/>
                                                    <label for="Months">
                                                        <div class="card m-1 p-1">
                                                            <img class="card-img-top radio-image mx-auto"
                                                                 src="dist-assets/images/metrics/months.png" alt="#">
                                                            <div class="card-body p-0">
                                                                <p id="lblCropAddCropNurseryGrownMeasurementMonths"
                                                                   class="m-0 p-0 text-center small">Months</p>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-md-6 form-group"
                                             style="display:none;" id="Crop_Photo">
                                            <div class="form-group">
                                                <label id="lblCropAddCropPhoto">Crop's Photo</label>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="i-Camera"></i>
                                                            </span>
                                                </div>
                                                <div class="custom-file">
                                                    <input class="custom-file-input" id="imgCropAddCropPhoto"
                                                           type="file" name="crop_photo"
                                                           aria-describedby="imgCropAddCropPhoto"
                                                           onchange="ReadUrl(this)"/>
                                                    <label class="custom-file-label"
                                                           id="lblCropAddChoosePhoto"
                                                           for="lblCropAddCropPhoto">Choose photo</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 form-group"
                                             style="display:none;" id="Selected_Crop_Photo">
                                            <div class="form-group">
                                                <label id="lblCropAddCropPhotoSelected">Selected Crop's Photo</label>
                                            </div>
                                            <div class="input-group">
                                                <img class="form-control" src="#" id="photo_preview"
                                                     name="crop_photo_selected" style="width:100%; height:auto;"
                                                     aria-label="CropAddCropPhotoSelected"
                                                     aria-describedby="imgAddCropPhotoSelected">
                                            </div>
                                        </div>

                                        <!--/MoreDetails-->

                                    </div>
                                    <!--/inner-row-->

                                    <!--inner-row-->
                                    <div class="row">

                                        <div class="col-lg-12 form-group">
                                            <!-- <div class="form-group">
                                                &nbsp;
                                            </div> -->
                                            <div class="row">
                                                <div class="col-lg-6 col-md-12 mt-3 ml-auto">
                                                    <button type="submit"
                                                            class="btn btn-primary btn-block form-submit-button"
                                                            id="btnCropAddAddNewCrop">Save
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!--/inner-row-->

                                </form>
                                <!--/form-->

                            </div>
                            <!--/col-left-->

                            <!--col-right-->
                            <div class="col-md-6 d-none d-sm-block">

                                <!--inner-row-->
                                <div class="row">

                                    <div class="col-md-12 form-group">
                                        <!-- <div class="form-group">
                                            <label id="lblCropAddCropType">Crop Type</label>
                                        </div> -->

                                        <!--img-->
                                        <img class="d-block w-50 rounded p-1 mx-auto"
                                             src="dist-assets/images/crops/onion.png"
                                             alt="onion"/>
                                        <!--/img-->

                                    </div>
                                    <div class="col-md-12 form-group pl-5 pt-2 pr-5 text-center">
                                        <p>
                                            <strong>
                                                Onion
                                            </strong>
                                        </p>
                                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Libero quis beatae
                                            officia saepe perferendis voluptatum minima eveniet voluptates dolorum,
                                            temporibus nisi maxime nesciunt totam repudiandae commodi sequi dolor
                                            quibusdam.
                                        </p>
                                    </div>

                                </div>
                                <!--/inner-row-->

                            </div>
                            <!--/col-right-->

                        </div>
                        <!--/row-->

                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <%
            String Response = "None";
            if (request.getParameter("IsCropSaved") != null &&
                    request.getParameter("IsCropSaved").equals("false")) {
                //show alert
                Response = "IsCropSavedFalse";
            } else if (request.getParameter("IsLandAreaInvalid") != null &&
                    request.getParameter("IsLandAreaInvalid").equals("true")) {
                //show alert
                Response = "IsLandAreaInvalidTrue";
            }
//            System.out.println("Response: " + Response);
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsCropSavedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01BodyIsCropSavedFalse" class="mt-4 mb-4">Crop adding failed.</p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError01Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-error-->

                <!--modal-error-->
                <div class="modal fade" id="ModalError02IsLandAreaInvalidTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                                    <p id="ModalError02BodyIsLandAreaInvalidTrue" class="mt-4 mb-4">
                                        Cannot add the crop with given land area.
                                    </p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError02Footer">Okay</span>
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

        <!-- end of main-content -->

    </div>

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
    /*default display on load*/
    $('#collapse-for-land-area-number').collapse('show');
    /*display on control*/
    $('#formCropAdd input').on('change', function () {
        let value = $('input[name=crop_extent_unit]:checked', '#formCropAdd').val();
        console.log(value);
        if (value == 'Plots') {
            $('#collapse-for-land-area-number').collapse('hide');
            $('#collapse-for-plot').collapse('show');
        } else {
            $('#collapse-for-plot').collapse('hide');
            $('#collapse-for-land-area-number').collapse('show');
        }
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.parent').slick({
            slidesToShow: 4,
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
                        slidesToShow: 2
                    }
                }
            ]
        });
    });
</script>

<script type="text/javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        //notification
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsCropSavedFalse':
                // alert("Success!");
                $('#ModalError01IsCropSavedFalse').modal('show');
                break;
            case 'IsLandAreaInvalidTrue':
                // alert("Success!");
                $('#ModalError02IsLandAreaInvalidTrue').modal('show');
                break;
            default:
                break;
        }
    };
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

<script type="text/javascript">

    const language = getLanguage();
    console.log(language);

    if (language == "Sinhala") {
        ToggleLanguageSinhala();
        convertLoop("Sinhala");
    }
    if (language == "Tamil") {
        ToggleLanguageTamil();
        convertLoop("Tamil");
    }
    if (language == "English") {
        ToggleLanguageEnglish();
        convertLoop("English");
    }

    function convertLoop(language) {

        let CropCount =<%=CropCount%>;
        let CropLabel = '', TranslatedCropLabel = '';

        switch (language) {

            case "Sinhala":
                for (let i = 0; i < CropCount; i++) {
                    CropLabel = document.getElementById("lblCropCarousel" + i);
                    // console.log('Sinhala,'+(i + 1) + "," + CropLabel.innerText);
                    TranslatedCropLabel = translateCrops("Sinhala", CropLabel.innerText);
                    CropLabel.innerText = TranslatedCropLabel;
                }
                break;
            case "Tamil":
                for (let i = 0; i < CropCount; i++) {
                    CropLabel = document.getElementById("lblCropCarousel" + i);
                    // console.log('Tamil,'+(i + 1) + "," + CropLabel.innerText);
                    TranslatedCropLabel = translateCrops("Tamil", CropLabel.innerText);
                    CropLabel.innerText = TranslatedCropLabel;
                }
                break;
            case "English":
                for (let i = 0; i < CropCount; i++) {
                    CropLabel = document.getElementById("lblCropCarousel" + i);
                    // console.log('English,'+(i + 1) + "," + CropLabel.innerText);
                    TranslatedCropLabel = translateCrops("English", CropLabel.innerText);
                    CropLabel.innerText = TranslatedCropLabel;
                }
            default:
                break;
            // code block
        }
    }

</script>

<%
    }
%>

</body>
</html>