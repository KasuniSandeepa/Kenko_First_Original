<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="static services.HttpSession.PROFILES" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Land Add - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
    <link href="dist-assets/select2/css/select2.min.css" rel="stylesheet" />
</head>

<body class="text-left">

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute(PROFILES) == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profiles Profiles = (Profiles) request.getSession().getAttribute(PROFILES);
//        String IpAddress = String.valueOf(request.getSession().getAttribute(IP_ADDRESS));
//        System.out.println("IpAddress: " + IpAddress);

//        GeoLocation GeoLocation = new GeoLocation();
//        GeoLocation.LocationGet("112.134.92.56");
//        String District = GeoLocation.DistrictGet();
//        String City = GeoLocation.CityGet();
//        System.out.println(District);
//        System.out.println(City);

%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <%
        String LandExtentAmount = "";
        String LandExtentMeasurement = "";

        if (request.getParameter("IsLandNameExistsInDatabase") != null &&
                request.getParameter("IsLandNameExistsInDatabase").equals("true")) {
            //get values for auto-fill
            LandExtentAmount = request.getParameter("LandExtentAmount");
            LandExtentMeasurement = request.getParameter("LandExtentMeasurement");
            //show alert - done @ the bottom of the page
        }
    %>

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblLandAddLandAdd">Land Add</h1>
            <ul class="ml-2">
                <li><a id="lblLandAddBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><a id="lblLandAddBreadCrumbsAllLands" href="LandAll.jsp">All Lands</a></li>
                <li><span id="lblLandAddBreadCrumbsAddLands">Land Add</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form class="submit-form" action="LandAddServlet" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="farmer_id"
                                           value="<%=Profiles.getPkProfiles()%>" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandAddLandName">Land Name</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="text" placeholder="Land Name"
                                               id="txtLandAddLandName" value="" name="land_name"
                                               aria-label="LandName" aria-describedby="txtLandAddLandName"
                                               minlength="4" maxlength="40" required autofocus/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandAddLandExtentAmount">Land Extent Amount</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control validate-field" type="number"
                                               placeholder="Land Extent Amount"
                                               id="txtLandAddLandExtentAmount"
                                                <%
                                                    if (!LandExtentAmount.equals("")) {
                                                %>
                                               value="<%=LandExtentAmount%>"
                                                <%
                                                } else {
                                                %>
                                               value="100"
                                                <%
                                                    }
                                                %>
                                               name="land_extent_amount"
                                               aria-label="LandExtentAmount"
                                               aria-describedby="txtLandAddLandExtentAmount"
                                               min="1" max="1000" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandAddLandExtentMeasurement">Land Extent Measurement</label>
                                    </div>

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
                                                            <p id="lblLandAddLandExtentMeasurementAcres"
                                                               class="m-0 p-0 text-center small">Acres</p>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>

                                        </div>

                                </div>
                                <div class="col-md-4 form-group">
<%--                                    <div class="form-group">--%>
<%--                                        &nbsp;--%>
<%--                                    </div>--%>
                                    <label class="switch switch-primary mr-3 pr-5">
                                        <span id="lblLandAddMoreDetails">More Details</span>
                                        <input type="checkbox" id="myCheckbox"
                                               onchange="LandAddMoreDetailsShowAndHide()">
                                        <span class="slider round"></span>
                                    </label>
                                </div>

                                <!--MoreDetails-->
                                <%--<div id="divLandAddMoreDetailsHolder" style="display:none">--%>

                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Land_Address">
                                    <div class="form-group">
                                        <label id="lblLandAddLandAddress">Land Address</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Land Address"
                                               id="txtLandAddLandAddress" value="<%=Profiles.getAddress()%>"
                                               name="land_address"
                                               aria-label="LandAddress" aria-describedby="txtLandAddLandAddress"
                                               minlength="4" maxlength="200"/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Land_Type">
                                    <div class="form-group">
                                        <label id="lblLandAddLandType">Land Type</label>
                                    </div>

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
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Ownership_State">
                                    <div class="form-group">
                                        <label id="lblLandAddOwnershipState">Ownership State</label>
                                    </div>

                                    <div class="d-flex justify-content-around">

                                        <div>
                                            <input id="Owned" type="radio" name="land_ownership_status" value="Owned"
                                                   checked/>
                                            <label for="Owned">
                                                <div class="card m-1 p-1">
                                                    <img class="card-img-top radio-image mx-auto"
                                                         src="dist-assets/images/custom/rented.png" alt="#">
                                                    <div class="card-body p-0">
                                                        <p id="lblLandAddLandOwnershipStatusOwned"
                                                           class="m-0 p-0 text-center small">Owned</p>
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
                                                        <p id="lblLandAddLandOwnershipStatusRented"
                                                           class="m-0 p-0 text-center small">Rented</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Province">
                                    <div class="form-group">
                                        <label id="lblLandAddProvince">Province</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddProvince" name="land_province"
                                                aria-label="Province" aria-describedby="cmbLandAddProvince"
                                                onchange="SetDistricts();SetGNDivisions();">

                                            <option id="provinceDropDownOptionLandAddWestern" value="Western">Western</option>
                                            <option id="provinceDropDownOptionLandAddCentral" value="Central">Central</option>
                                            <option id="provinceDropDownOptionLandAddSouthern" value="Southern">Southern</option>
                                            <option id="provinceDropDownOptionLandAddUva" value="Uva">Uva</option>
                                            <option id="provinceDropDownOptionLandAddSabaragamuwa" value="Sabaragamuwa">Sabaragamuwa</option>
                                            <option id="provinceDropDownOptionLandAddNorthWestern" value="North Western" selected>North Western</option>
                                            <option id="provinceDropDownOptionLandAddNorthCentral" value="North Central">North Central</option>
                                            <option id="provinceDropDownOptionLandAddNorthern" value="Northern">Northern</option>
                                            <option id="provinceDropDownOptionLandAddEastern" value="Eastern">Eastern</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="District">
                                    <div class="form-group">
                                        <label id="lblLandAddDistrict">District</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddDistrict" name="land_district"
                                                aria-label="District"
                                                aria-describedby="cmbLandAddDistrict"
                                                onchange="SetGNDivisions()"
                                                data-live-search="true">

                                            <%--<option value="Select District" disabled selected hidden>--%>
                                            <%--Select District--%>
                                            <%--</option>--%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Gn_Division">
                                    <div class="form-group">
                                        <label id="lblLandAddGNDivision">GN Division</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddGNDivision" name="land_gn_area"
                                                aria-label="GNDivision"
                                                aria-describedby="cmbLandAddGNDivision">

                                            <%--<option value="Select GN Division" disabled selected hidden>Select GN--%>
                                            <%--Division--%>
                                            <%--</option>--%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Land_Photo">
                                    <div class="form-group">
                                        <label id="lblLandAddLandPhoto">Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgLandAddLandPhoto"
                                                   type="file" name="land_photo"
                                                   aria-describedby="imgLandAddLandPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblLandAddLandChoosePhoto"
                                                   for="lblLandAddLandPhoto">Choose photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Selected_Land_Photo">
                                    <div class="form-group">
                                        <label id="lblLandAddLandPhotoSelected">Selected Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="land_photo_selected" style="width:100%; height:auto;"
                                             aria-label="LandAddLandPhotoSelected"
                                             aria-describedby="imgAddLandPhotoSelected">
                                    </div>
                                </div>

                                <%--</div>--%>
                                <!--/MoreDetails-->

                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnLandAddAddNewLand"
                                            class="btn btn-primary btn-block mt-2 form-submit-button">Save
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
            if (request.getParameter("IsLandNameExists") != null &&
                    request.getParameter("IsLandNameExists").equals("true")) {
                //show alert
                Response = "IsLandNameExistsTrue";
            } else if (request.getParameter("IsLandSaved") != null &&
                    request.getParameter("IsLandSaved").equals("false")) {
                //show alert
                Response = "IsLandSavedFalse";
            }
//            System.out.println("Response: " + Response);
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
                <div class="modal fade" id="ModalError02IsLandSavedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                                    <p id="ModalError02BodyIsLandSavedFalse" class="mt-4 mb-4">Land saving failed.</p>
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
<script src="dist-assets/js/plugins/popper.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
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
<%--<script src="dist-assets/js/custom/district_dropdown_update_automate.js"></script>--%>

<script src="dist-assets/select2/js/select2.full.min.js"></script>
<script src="dist-assets/select2/js/select2.min.js"></script>

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
    console.log(language)
    if (language == "Sinhala") {
        ToggleLanguageSinhala();
        SetDropDownLanguage("Sinhala");
        SetDropDownLanguageGnDivison("Sinhala");
    }
    if (language == "Tamil") {
        ToggleLanguageTamil();
        SetDropDownLanguage("Tamil")
        SetDropDownLanguageGnDivison("Tamil");
    }
    if (language == "English") {
        ToggleLanguageEnglish();
        SetDropDownLanguage("English");
        SetDropDownLanguageGnDivison("English");
    }
    window.onload = SetDistricts();

    /*needs to be declared due to initialising in Header.jsp*/
    function convertLoop(language) {
    }
</script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsLandNameExistsTrue':
                // alert("Success!");
                $('#ModalError01IsLandNameExistsInDatabaseTrue').modal('show');
                break;
            case 'IsLandSavedFalse':
                // alert("Info!");
                $('#ModalError02IsLandSavedFalse').modal('show');
                break;
            default:
                break;
        }
    }

    // $(document).ready(function() {
    //
    //     // Initialize select2
    //     $("#cmbLandAddProvince").select2();
    //     $("#cmbLandAddGNDivision").select2();
    //
    // });

    // Read selected option
    // $('#but_read').click(function(){
    //     var username = $('#selUser option:selected').text();
    //     var userid = $('#selUser').val();
    //
    //     $('#result').html("id : " + userid + ", name : " + username);
    //
    // });

</script>

<%
    }
%>

</body>
</html>