<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Crops" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="services.CropsServices" %>
<%@ page import="services.CropTypesServices" %>
<%@ page import="models.CropTypes" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Crop Update - Kenko 1st Agri Business</title>
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
        int PkCrops = 0, PkLandDetails = 0;
        PkCrops = Integer.parseInt(request.getParameter("PkCrops"));
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));
        Crops Crops = new CropsServices().CropsGet(PkCrops);

        String NumberString = Crops.getCultivatedLandArea().split("_")[0];
        String CropGrownMethod = "None";
        int CropExtentNumber = 0, Length = 0, Breadth = 0, NoOfPlots = 0;
        try {
            CropExtentNumber = Integer.parseInt(NumberString);
            CropGrownMethod = "Area";
        } catch (Exception e) {
            Length = Integer.parseInt(NumberString.split("x")[0]);
            Breadth = Integer.parseInt(NumberString.split("x")[1]);
            NoOfPlots = Integer.parseInt(NumberString.split("x")[2]);
            CropGrownMethod = "Plots";
        }
        String CropExtentUnit = Crops.getCultivatedLandArea().split("_")[1];
        String CropPlantedDate = Crops.getPlantedDate();
        int NurseryGrownNumber = Integer.parseInt(Crops.getNurseryTime().split("_")[0]);
        String NurseryGrownUnit = Crops.getNurseryTime().split("_")[1];

%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblCropUpdateBreadCrumbsCropUpdateHeading">Crop Update</h1>
            <ul class="ml-2">
                <%--                <li><a id="lblCropUpdateBreadCrumbsProfile" href="x.jsp">x</a></li>--%>
                <%--                <li><a id="lblCropUpdateBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>--%>
                <li><a id="lblCropUpdateBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li>
                    <a id="lblCropUpdateBreadCrumbsCropDetails"
                       href="CropDetails.jsp?PkCrops=<%=PkCrops%>&PkLandDetails=<%=PkLandDetails%>">
                        Crop Details
                    </a>
                </li>
                <li id="lblCropUpdateBreadCrumbsUpdate">Crop Update</li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form id="formCropUpdate" class="submit-form" action="CropUpdateServlet" method="post"
                              enctype="multipart/form-data">

                            <!--land-crop-id-->
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="crop_id"
                                           value="<%=PkCrops%>" required>
                                    <input type="hidden" name="land_id"
                                           value="<%=PkLandDetails%>" required>
                                </div>
                            </div>
                            <!--/land-crop-id-->

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropType">Crop Type</label>
                                    </div>
                                    <%--<div class="input-group">--%>

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
                                                                    <%
                                                                        if (CropTypes.getPkCropTypes()==CropTypes.getPkCropTypes()) {
                                                                    %>
                                                                   checked
                                                                    <%
                                                                        }
                                                                    %>
                                                                   name="crop_type" class="validate-field"
                                                                   value="<%=CropTypes.get_PkCropTypes() + "_" + CropTypes.get_Name()%>"/>

                                                            <label for="<%=CropNameWhitespaceRemoved%>">
                                                                <div class="card m-1 p-1">
                                                                    <img class="card-img-top mx-auto"
                                                                         src="<%=CropTypeDefaultImageUrl%>"
                                                                         alt="<%=CropTypes.get_Name()%>">
                                                                    <div class="card-body p-0">
                                                                        <p id="lblCropCarousel<%=CropCount%>"
                                                                           class="m-0 p-0 text-center small">
                                                                            <%=CropTypes.get_Name()%>
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

                                    <%--</div>--%>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropExtentMeasurement">
                                            Cultivated Land Area - Unit</label>
                                    </div>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Square_Feet" type="radio" name="crop_extent_unit"

                                                    <%
                                                        if (CropGrownMethod.equals("Area") &&
                                                                CropExtentUnit.equals("Square Feet")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Square Feet" class="validate-field"/>
                                            <label for="Square_Feet">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/feet-square.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropExtentMeasurementSquareFeet"
                                                           class="m-0 p-0 text-center small">Square Feet</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Square_Metres" type="radio" name="crop_extent_unit"

                                                    <%
                                                        if (CropGrownMethod.equals("Area") &&
                                                                CropExtentUnit.equals("Square Metres")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Square Metres"/>
                                            <label for="Square_Metres">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/metre-square.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropExtentMeasurementSquareMetres"
                                                           class="m-0 p-0 text-center small">Square Metres</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Perches" type="radio" name="crop_extent_unit"

                                                    <%
                                                        if (CropGrownMethod.equals("Area") &&
                                                                CropExtentUnit.equals("Perches")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Perches"/>
                                            <label for="Perches">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/perch.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropExtentMeasurementPerches"
                                                           class="m-0 p-0 text-center small">Perches</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Acres" type="radio" name="crop_extent_unit"

                                                    <%
                                                        if (CropGrownMethod.equals("Area") &&
                                                                CropExtentUnit.equals("Acres")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Acres"/>
                                            <label for="Acres">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/acre.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropExtentMeasurementAcres"
                                                           class="m-0 p-0 text-center small">Acres</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Plots" type="radio" name="crop_extent_unit"
                                                   value="Plots"

                                                    <%
                                                        if (CropGrownMethod.equals("Plots")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   data-toggle="collapse" data-target="#collapse-for-plot"/>
                                            <label for="Plots">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/plot.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropExtentMeasurementPlots"
                                                           class="m-0 p-0 text-center small">Plots</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group mt-2">

                                    <!--collapse-for-land-area-number-->
                                    <div class="collapse" id="collapse-for-land-area-number">
                                        <div class="row">

                                            <div class="col-md-12 form-group mb-0">
                                                <div class="form-group">
                                                    <label id="lblCropAddCropExtentAmount">
                                                        Cultivated Land Area - Number</label>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-5">
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

                                                            <%
                                                                if (Length > 0) {
                                                            %>
                                                           value="<%=Length%>"
                                                            <%
                                                            } else {
                                                            %>
                                                           value="<%=CropExtentNumber%>"
                                                            <%
                                                                }
                                                            %>

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
                                                    <label id="lblCropUpdatePlotSizeMeasurement">
                                                        Plot Size - Measurements</label>
                                                </div>
                                            </div>

                                            <div class="col-md-5 col-5">
                                                <input type="number" name="plot_size_length"
                                                       id="txtCropUpdatePlotLength"

                                                        <%
                                                            if (Length > 0) {
                                                        %>
                                                       value="<%=Length%>"
                                                        <%
                                                        } else {
                                                        %>
                                                       value="4"
                                                        <%
                                                            }
                                                        %>

                                                       class="form-control validate-field" min="1" max="100"
                                                       placeholder="Length"/>

                                            </div>

                                            <div class="col-md-2 col-2 text-center">
                                                <p>x</p>
                                            </div>

                                            <div class="col-md-5 col-5">
                                                <input type="number" name="plot_size_breadth"
                                                       id="txtCropUpdatePlotBreadth"

                                                        <%
                                                            if (Breadth > 0) {
                                                        %>
                                                       value="<%=Breadth%>"
                                                        <%
                                                        } else {
                                                        %>
                                                       value="4"
                                                        <%
                                                            }
                                                        %>

                                                       class="form-control validate-field" min="1" max="100"
                                                       placeholder="Breadth"/>
                                            </div>

                                            <div class="col-md-6 col-6">
                                                <div class="input-group mt-2">
                                                    <div class="input-group-prepend">
                                                                    <span class="input-group-text"
                                                                          id="lblCropUpdatePlotUnit">
                                                                        Units:
                                                                    </span>
                                                    </div>
                                                    <select class="form-control"
                                                            name="plot_size_measurement_unit">
                                                        <option id="cmbCropUpdatePlotUnitFeet"

                                                                <%
                                                                    if (CropGrownMethod.equals("Plots") &&
                                                                            CropExtentUnit.equals("Feet")) {
                                                                %>
                                                                selected
                                                                <%
                                                                } else {
                                                                %>
                                                                selected
                                                                <%
                                                                    }
                                                                %>

                                                                value="Feet">Feet
                                                        </option>
                                                        <option id="cmbCropUpdatePlotUnitMetres"

                                                                <%
                                                                    if (CropGrownMethod.equals("Plots") &&
                                                                            CropExtentUnit.equals("Metres")) {
                                                                %>
                                                                selected
                                                                <%
                                                                    }
                                                                %>

                                                                value="Metres">Metres
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-6">
                                                <div class="input-group mt-2">
                                                    <div class="input-group-prepend">
                                                                    <span class="input-group-text"
                                                                          id="lblCropUpdatePlotCount">
                                                                        Plots:
                                                                    </span>
                                                    </div>
                                                    <input type="number" name="no_of_plots" class="form-control"
                                                           id="txtCropUpdatePlotCount"

                                                            <%
                                                                if (NoOfPlots > 0) {
                                                            %>
                                                           value="<%=NoOfPlots%>"
                                                            <%
                                                            } else {
                                                            %>
                                                           value="2"
                                                            <%
                                                                }
                                                            %>

                                                           min="1" max="100"
                                                           placeholder="Plots"/>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!--/collapse-for-plot-->

                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropPlantedDate">Planted Date</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="date"
                                               placeholder="Planted Date"
                                               id="txtCropUpdateCropPlantedDate" value="<%=CropPlantedDate%>"
                                               name="crop_planted_date"
                                               aria-label="CropPlantedDate"
                                               aria-describedby="txtCropAddCropPlantedDate" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group" id="Nursery_Grown_Number">
                                    <div class="form-group">
                                        <label id="lblCropUpdateNurseryGrownNumber">Nursery Grown - Number</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="number"
                                               placeholder="Nursery Grown - Number"
                                               id="txtCropUpdateNurseryGrownNumber" value="<%=NurseryGrownNumber%>"
                                               name="crop_nursery_grown_number"
                                               aria-label="NurseryGrownNumber"
                                               aria-describedby="txtCropAddNurseryGrownNumber"
                                               min="0" max="99"/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group" id="Nursery_Grown_Measurement">
                                    <div class="form-group">
                                        <label id="lblCropUpdateNurseryGrownMeasurement">
                                            Nursery Grown - Measurement</label>
                                    </div>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Days" type="radio" name="crop_nursery_grown_unit"

                                                    <%
                                                        if (NurseryGrownUnit.equals("Days")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Days"/>
                                            <label for="Days">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/days.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropNurseryGrownMeasurementDays"
                                                           class="m-0 p-0 text-center small">Days</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Weeks" type="radio" name="crop_nursery_grown_unit"

                                                    <%
                                                        if (NurseryGrownUnit.equals("Weeks")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Weeks"/>
                                            <label for="Weeks">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/weeks.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropNurseryGrownMeasurementWeeks"
                                                           class="m-0 p-0 text-center small">Weeks</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Months" type="radio" name="crop_nursery_grown_unit"

                                                    <%
                                                        if (NurseryGrownUnit.equals("Months")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Months"/>
                                            <label for="Months">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/months.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblCropUpdateCropNurseryGrownMeasurementMonths"
                                                           class="m-0 p-0 text-center small">Months</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group" id="Crop_Photo">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropPhoto">Crop's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgCropUpdateCropPhoto"
                                                   type="file" name="crop_photo"
                                                   aria-describedby="imgCropUpdateCropPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblCropUpdateChoosePhoto"
                                                   for="lblCropUpdateCropPhoto">Choose photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group" id="Selected_Crop_Photo">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropPhotoSelected">Selected Crop's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="crop_photo_selected" style="width:100%; height:auto;"
                                             aria-label="CropAddCropPhotoSelected"
                                             aria-describedby="imgAddCropPhotoSelected">
                                    </div>
                                </div>

                                <%--</div>--%>
                                <!--/MoreDetails-->

                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block form-submit-button"
                                            id="btnCropUpdateUpdateCrop">Update
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <%
            String Response = "None";
            if (request.getParameter("IsCropUpdated") != null &&
                    request.getParameter("IsCropUpdated").equals("true")) {
                //show alert
                Response = "IsCropUpdatedTrue";
            } else if (request.getParameter("IsLandAreaInvalid") != null &&
                    request.getParameter("IsLandAreaInvalid").equals("true")) {
                //show alert
                Response = "IsLandAreaInvalidTrue";
            } else if (request.getParameter("IsCropUpdated") != null &&
                    request.getParameter("IsCropUpdated").equals("false")) {
                //show alert
                Response = "IsCropUpdatedFalse";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsCropUpdatedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01BodyIsCropUpdatedFalse" class="mt-4 mb-4">Crop updating
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

                <!--modal-success-->
                <div class="modal fade" id="ModalSuccess01IsCropUpdatedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess02Title">Success!</h2>
                                    <p id="ModalSuccess02BodyIsCropUpdatedTrue" class="mt-4 mb-4">Crop updated.</p>
                                    <button class="btn btn-lg btn-success" type="button" data-dismiss="modal">
                                        <span id="ModalSuccess02Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-success-->

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

        <!-- ============ Body content end ============= -->

        <!--Footer Start-->
        <%@include file="FooterKenkoFirst.jsp" %>
        <!--Footer end-->

    </div>
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
    /*default display on load*/
    // $('#collapse-for-land-area-number').collapse('show');
    /*display on control*/
    $('#formCropUpdate input').on('change', function () {
        let value = $('input[name=crop_extent_unit]:checked', '#formCropUpdate').val();
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
            case 'IsCropUpdatedFalse':
                // alert("Success!");
                $('#ModalError01IsCropUpdatedFalse').modal('show');
                break;
            case 'IsLandAreaInvalidTrue':
                // alert("Success!");
                $('#ModalError02IsLandAreaInvalidTrue').modal('show');
                break;
            case 'IsCropUpdatedTrue':
                // alert("Info!");
                $('#ModalSuccess01IsCropUpdatedTrue').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<script type="text/javascript">
    let CropGrownMethod = '<%=CropGrownMethod%>';
    window.onload = function () {
        console.log(CropGrownMethod);
        if (CropGrownMethod == 'Plots') {
            $('#collapse-for-land-area-number').collapse('hide');
            $('#collapse-for-plot').collapse('show');
        } else {
            $('#collapse-for-plot').collapse('hide');
            $('#collapse-for-land-area-number').collapse('show');
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

<script type="text/javascript">
    const language = getLanguage();
    // console.log(language)

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