<%@ page import="models.LandDetails" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="services.LandDetailsServices" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Land Update - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
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
        LandDetails LandDetails = new LandDetailsServices().LandDetailsGet(PkLandDetails);
        String LandExtentMeasurement = LandDetails.getLandExtent().split("_")[1];
        String LandType = LandDetails.getLandType();
        String OwnershipState = LandDetails.getOwnershipState();

%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <%
        //        String LandExtentAmount = "";
//        String LandExtentMeasurement = "";

        if (request.getParameter("IsLandNameExistsInDatabase") != null &&
                request.getParameter("IsLandNameExistsInDatabase").equals("true")) {
            //get values for auto-fill
//            LandExtentAmount = request.getParameter("LandExtentAmount");
//            LandExtentMeasurement = request.getParameter("LandExtentMeasurement");
            //show alert - done @ the bottom of the page
        }
    %>

    <div class="main-content">
        <div class="breadcrumb">
            <h1 id="lblLandUpdateBreadCrumbsLandUpdateHeading">Land Update</h1>
            <ul class="ml-2">
                <%--                <li><a id="lblLandUpdateBreadCrumbsProfile" href="x.jsp">x</a></li>--%>
                <%--                <li><a id="lblLandUpdateBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>--%>
                <li><a id="lblLandUpdateBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li><span id="lblLandUpdateBreadCrumbsLandUpdate">Land Update</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form class="submit-form" action="LandUpdateServlet" method="post"
                              enctype="multipart/form-data">

                            <!--land-id-->
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="land_id"
                                           value="<%=PkLandDetails%>" required>
                                </div>
                            </div>
                            <!--/land-id-->

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandName">Land Name</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="text" placeholder="Land Name"
                                               id="txtLandUpdateLandName"
                                               value="<%=LandDetails.getName()%>" name="land_name"
                                               aria-label="LandName"
                                               aria-describedby="txtLandUpdateLandName"
                                               minlength="4" maxlength="30" required autofocus/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandExtentAmount">Land Extent Amount</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="number"
                                               placeholder="Land Extent Amount"
                                               id="txtLandUpdateLandExtentAmount"
                                               value="<%=LandDetails.getLandExtent().split("_")[0]%>"
                                               name="land_extent_amount"
                                               aria-label="LandExtentAmount"
                                               aria-describedby="txtLandUpdateLandExtentAmount"
                                               min="1" max="1000" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandExtentMeasurement">Land Extent Measurement</label>
                                    </div>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Square_Feet" type="radio" name="land_extent_measurement"

                                                    <%
                                                        if (LandExtentMeasurement.equals("Square Feet")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Square Feet" class="validate-field" required/>
                                            <label for="Square_Feet">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/metrics/feet-square.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandUpdateLandExtentMeasurementSquareFeet"
                                                           class="m-0 p-0 text-center small">Square Feet</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Square_Metres" type="radio" name="land_extent_measurement"

                                                    <%
                                                        if (LandExtentMeasurement.equals("Square Metres")) {
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
                                                        <p id="lblLandUpdateLandExtentMeasurementSquareMetres"
                                                           class="m-0 p-0 text-center small">Square Metres</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Perches" type="radio" name="land_extent_measurement"

                                                    <%
                                                        if (LandExtentMeasurement.equals("Perches")) {
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
                                                        <p id="lblLandUpdateLandExtentMeasurementPerches"
                                                           class="m-0 p-0 text-center small">Perches</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Acres" type="radio" name="land_extent_measurement"

                                                    <%
                                                        if (LandExtentMeasurement.equals("Acres")) {
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
                                                        <p id="lblLandUpdateLandExtentMeasurementAcres"
                                                           class="m-0 p-0 text-center small">Acres</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandAddress">Land Address</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="text"
                                               placeholder="Land Address"
                                               id="txtLandUpdateLandAddress"
                                               value="<%=LandDetails.getAddress()%>" name="land_Address"
                                               aria-label="LandAddress"
                                               aria-describedby="txtLandUpdateLandAddress"
                                               minlength="4" maxlength="300"/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandType">Land Type</label>
                                    </div>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="dry_land" type="radio" name="land_type"

                                                    <%
                                                        if (LandType.equals("Dry Land")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Dry Land" />
                                            <label for="dry_land">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/dry-land.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandUpdateLandTypeDryLand"
                                                           class="m-0 p-0 text-center small">Dry Land</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="wet_land" type="radio" name="land_type"

                                                    <%
                                                        if (LandType.equals("Wet Land")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Wet Land"/>
                                            <label for="wet_land">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/wet-land.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandUpdateLandTypeWetLand"
                                                           class="m-0 p-0 text-center small">Wet Land</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="greenhouse" type="radio" name="land_type"

                                                    <%
                                                        if (LandType.equals("Greenhouse")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Greenhouse"/>
                                            <label for="greenhouse">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/greenhouse.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandUpdateLandTypeGreenhouse"
                                                           class="m-0 p-0 text-center small">Greenhouse</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateOwnershipState">Ownership State</label>
                                    </div>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Owned" type="radio" name="land_ownership_status"

                                                    <%
                                                        if (OwnershipState.equals("Owned")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>
                                                   value="Owned" />
                                            <label for="Owned">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/rented.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandUpdateLandOwnershipStatusOwned"
                                                           class="m-0 p-0 text-center small">Owned</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                        <div>
                                            <input id="Rented" type="radio" name="land_ownership_status"

                                                    <%
                                                        if (OwnershipState.equals("Rented")) {
                                                    %>
                                                   checked
                                                    <%
                                                        }
                                                    %>

                                                   value="Rented"/>
                                            <label for="Rented">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/owned.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandUpdateLandOwnershipStatusRented"
                                                           class="m-0 p-0 text-center small">Rented</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateProvince">Province</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control validate-field"
                                                id="cmbLandUpdateProvince" name="land_province"
                                                aria-label="Province"
                                                aria-describedby="cmbLandUpdateProvince"
                                                onchange="SetDistrictsUpdate(); SetProvinces(1); SetGNDivisions();"
                                                required>

                                            <option value="<%=LandDetails.getProvince()%>" selected hidden>
                                                <%=LandDetails.getProvince()%>
                                            </option>

                                            <%--<option value="Select Province" disabled selected hidden>Select Province--%>
                                            <%--</option>--%>
                                            <%--<option value="Western">Western</option>--%>
                                            <%--<option value="Central">Central</option>--%>
                                            <%--<option value="Southern">Southern</option>--%>
                                            <%--<option value="Uva">Uva</option>--%>
                                            <%--<option value="Sabaragamuwa">Sabaragamuwa</option>--%>
                                            <%--<option value="North Western ">North Western</option>--%>
                                            <%--<option value="North Central"> North Central</option>--%>
                                            <%--<option value="Northern">Northern</option>--%>
                                            <%--<option value="Eastern">Eastern</option>--%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateDistrict">District</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control validate-field"
                                                id="cmbLandUpdateDistrict" name="land_district"
                                                aria-label="District"
                                                aria-describedby="cmbLandUpdateDistrict"
                                                onchange="SetGNDivisions();"
                                                required>

                                            <option value="<%=LandDetails.getDistrict()%>" disabled selected hidden>
                                                <%=LandDetails.getDistrict()%>
                                            </option>

                                            <%--<option value="Select District" disabled selected hidden>Select District--%>
                                            <%--</option>--%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateGNDivision">GN Division</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control validate-field"
                                                id="cmbLandAddGNDivision" name="land_gn_area"
                                                aria-label="GNDivision"
                                                aria-describedby="cmbLandUpdateGNDivision"
                                                required>

                                            <option value="Select GN Division" disabled selected hidden>
                                                <%=LandDetails.getGNArea()%>
                                            </option>

                                            <%--<option value="Select GN Division" disabled selected hidden>Select GN--%>
                                            <%--Division--%>
                                            <%--</option>--%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandPhoto">Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgLandUpdateLandPhoto"
                                                   type="file" name="land_photo"
                                                   aria-describedby="imgLandUpdateLandPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblLandUpdateLandChoosePhoto"
                                                   for="lblLandUpdateLandPhoto">Choose Photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandPhotoSaved">Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="land_photo_saved" style="width:100%; height:auto;"
                                             aria-label="LandUpdateLandPhotoSaved"
                                             aria-describedby="imgUpdateLandPhotoSaved">
                                    </div>
                                </div>
                                <!-- <div class="col-md-4 form-group">&nbsp;</div> -->
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnLandUpdateUpdateLand"
                                            class="btn btn-primary btn-block mt-2 form-submit-button">Update
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
            if (request.getParameter("IsLandNameExistsInDatabase") != null &&
                    request.getParameter("IsLandNameExistsInDatabase").equals("true")) {
                //show alert
                Response = "IsLandNameExistsInDatabaseTrue";
            } else if (request.getParameter("IsLandUpdated") != null &&
                    request.getParameter("IsLandUpdated").equals("false")) {
                //show alert
                Response = "IsLandUpdatedFalse";
            } else if (request.getParameter("IsLandUpdated") != null &&
                    request.getParameter("IsLandUpdated").equals("true")) {
                //show alert
                Response = "IsLandUpdatedTrue";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsLandNameExistsInDatabaseTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01BodyIsLandNameExistsInDatabaseTrue"
                                       class="mt-4 mb-4">Given land name is already present, try again.</p>
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
                <div class="modal fade" id="ModalError02IsLandUpdatedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                                    <p id="ModalError02BodyIsLandUpdatedFalse"
                                       class="mt-4 mb-4">Land updating failed.</p>
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
                <div class="modal fade" id="ModalSuccess01IsLandUpdatedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess01Title">Success!</h2>
                                    <p id="ModalSuccess01BodyIsLandUpdatedTrue" class="mt-4 mb-4">Land updated.</p>
                                    <button class="btn btn-lg btn-success" type="button" data-dismiss="modal">
                                        <span id="ModalSuccess01Footer">Okay</span>
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
<script src="dist-assets/js/custom/distric_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/gn_division_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>
<script src="dist-assets/js/custom/district_dropdown_update_automate.js"></script>

<script>
    const language = getLanguage();
    console.log(language)
    if (language == "Sinhala") {
        ToggleLanguageSinhala();
        SetDropDownLanguageInUpdate("Sinhala");
        SetDropDownLanguageGnDivison("Sinhala");
    }
    if (language == "Tamil") {
        ToggleLanguageTamil();
        SetDropDownLanguageInUpdate("Tamil");
        SetDropDownLanguageGnDivison("Tamil");
    }
    if (language == "English") {
        ToggleLanguageEnglish();
        SetDropDownLanguageInUpdate("English");
        SetDropDownLanguageGnDivison("English");
    }

    window.onload = SetDistrictsUpdate();
    var j = 0;
    window.onload = SetProvinces(1);

    /*needs to be declared due to initialising in Header.jsp*/
    function convertLoop(language) {
    }
</script>

<script type="text/javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsLandNameExistsInDatabaseTrue':
                // alert("Success!");
                $('#ModalError01IsLandNameExistsInDatabaseTrue').modal('show');
                break;
            case 'IsLandUpdatedFalse':
                // alert("Info!");
                $('#ModalError02IsLandUpdatedFalse').modal('show');
                break;
            case 'IsLandUpdatedTrue':
                // alert("Warning!");
                $('#ModalSuccess01IsLandUpdatedTrue').modal('show');
                break;
            default:
                break;
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
    }
%>

</body>
</html>