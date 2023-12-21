<%@ page import="java.util.List" %>
<%@ page import="static services.DatabaseCheck.StatusCountOfCropGet" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="services.DatabaseTableLists" %>
<%@ page import="utils.Strings" %>
<%@ page import="static services.ProgressesServices.LandAreaInPlotsReformattedGet" %>
<%@ page import="services.CropTypesServices" %>
<%@ page import="services.CropsServices" %>
<%@ page import="models.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="services.LandDetailsServices" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Land Details - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>

<body class="text-left">

<%
    if (request.getSession().getAttribute(PROFILES) == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profiles Profiles = (Profiles) request.getSession().getAttribute(PROFILES);
        int PkProfiles = Profiles.getPkProfiles(), PkLandDetails = 0;
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));

        int CropCount = 0;

%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblLandDetailsBreadCrumbsLandDetailsHeading">Land Details</h1>
            <%--            <ul class="ml-2">--%>
            <%--                <li><a id="lblLandDetailsBreadCrumbsProfile" href="x.jsp">x</a></li>--%>
            <%--                <li><a id="lblLandDetailsBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>--%>
            <%--                <li><span id="lblLandDetailsBreadCrumbsLandDetails">Land Details</span></li>--%>
            <%--            </ul>--%>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- summary -->
        <div class="row">
            <!-- ICON BG-->
            <div class="col-lg-4 col-md-6 d-none d-sm-block">
                <div class="card card-icon-bg bg-success text-white o-hidden mb-4">
                    <div class="card-body text-center"><i class="i-Tree-3 text-white"></i>
                        <div class="content align-items-center">
                            <p class="lead text-24 mb-2">0</p>
                            <p id="pLandDetailsCultivation" class="mt-2 mb-0">Cultivations</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 d-none d-sm-block">
                <div class="card card-icon-bg bg-success text-white o-hidden mb-4">
                    <div class="card-body text-center"><i class="i-Paint-Brush text-white"></i>
                        <div class="content align-items-center">
                            <p class="lead text-24 mb-2">0</p>
                            <p id="pLandDetailsActivities" class="mt-2 mb-0">Activities</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /summary -->

        <!--land-details-update-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="breadcrumb">
                    <ul>
                        <li class="pl-0">
                            <%=new LandDetailsServices().LandDetailsGet(PkLandDetails).getName()%>
                        </li>
                        <li>
                            <a id="lblLandDetailsUpdateLandDetails" class="small"
                               href="LandUpdate.jsp?PkLandDetails=<%=PkLandDetails%>">
                                <u>Update Land Details</u>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <!--/land-details-update-->

        <!--all-lands-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1">
                        <span id="lblLandDetailsAllCrops">All Crops</span>
                    </div>
                    <a class="btn btn-dark m-sm-0"
                       id="lblLandDetailsAddNewCrop"
                       href="CropAdd.jsp?PkLandDetails=<%=PkLandDetails%>">Add A New Crop
                    </a>
                </div>
            </div>

            <!--land-list-->

            <%
                if (services.DatabaseCheck.CropCountOfLandGet(PkLandDetails) == 0) {
                    //show land reg
            %>

            <div class="col-md-12 mb-4">
                <div class="alert alert-card alert-warning text-center">
                    <span id="lblLandDetailsNoCropsToShow">No crops to show</span>!&nbsp;
                    <a class="btn btn-warning"
                       href="CropAdd.jsp?PkLandDetails=<%=PkLandDetails%>"
                       id="lblLandDetailsAddNewCrop2">
                        Add A New Crop
                    </a>
                </div>
            </div>

            <%
            } else {
                //show current lands
            %>

            <!--land-list-->
            <div class="col-md-12">

                <!--inner_row-->
                <div class="row">

                    <%
                        String PageIdParameter = request.getParameter("Page");
                        if (PageIdParameter == null) {
                            PageIdParameter = "1";
                        }
                        int PageId = Integer.parseInt(PageIdParameter);
                        int Total = 10;
                        if (PageId == 1) {
                        } else {
                            PageId = PageId - 1;
                            PageId = PageId * Total + 1;
                        }

                        List<Crops> CropsList = new CropsServices()
                                .CropsOfLandDetailsPaginatedGet(PkLandDetails, PageId, Total);

                        int ResultSize = services.DatabaseCheck.CropCountOfLandGet(PkLandDetails);

                        int Pages = 0;
                        if ((ResultSize % Total) == 0) {
                            Pages = ResultSize / Total;
                        } else {
                            Pages = (ResultSize / Total) + 1;
                        }

                        ArrayList<String> CropNames = new ArrayList<>();
                        String ImageUrl = "";

                        for (Crops Crops : CropsList) {

                    %>

                    <%--                    <a href="CropDetails.jsp?PkCrops=<%=CropDetails.get_CropId()%>&PkLandDetails=<%=CropDetails.get_LandId()%>">--%>

                    <div class="col-lg-6">

                        <div class="card mb-4" style="background-color:#f1f6f0;">
                            <div class="card-body p-2">

                                <!--widget-->
                                <div class="ul-widget5 m-0 p-0">

                                    <!--widget_item-->
                                    <div class="ul-widget5__item m-0 p-0">

                                        <div class="ul-widget-s5__content m-0 p-0">
                                            <div>

                                                <%
                                                    ImageUrl = "dist-assets/images/crops/".concat(Crops.getCropTypes()
                                                            .getDefaultImage());
                                                %>

                                                <img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"
                                                     src="<%=ImageUrl%>" alt="<%=Crops.getCropTypes().getName()%>"/>

                                            </div>
                                            <div class="ul-widget-s5__section text-left">
                                                <h5 class="lead m-1">
                                                    <a href="CropDetails.jsp?PkCrops=<%=Crops.getPkCrops()%>&PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>">
                                                        <%CropNames.add(Crops.getCropTypes().getName());%>
                                                        <strong name="cropName" id="cropName<%=CropCount%>">
                                                            <%=Crops.getCropTypes().getName()%>
                                                        </strong>
                                                    </a>
                                                </h5>
                                                <p class="m-1 pl-1 text-small text-muted">
                                                    <%--                                                    <%=Strings.UnderscoresReplace(Crops.getCultivatedLandArea())%>--%>

                                                    <%
                                                        String ProgressQuantityVerified = "";
                                                        if (Crops.getCultivatedLandArea().contains("x")) {
                                                            String[] NewValues =
                                                                    LandAreaInPlotsReformattedGet(Crops
                                                                            .getCultivatedLandArea());
                                                            ProgressQuantityVerified = NewValues[0] + NewValues[1] +
                                                                    NewValues[2] + NewValues[3];
                                                        } else {
                                                            ProgressQuantityVerified = Strings.UnderscoresReplace(Crops
                                                                    .getCultivatedLandArea());
                                                        }
                                                    %>
                                                    <%=ProgressQuantityVerified%>


                                                </p>
                                                <p class="text-small text-danger m-1">
                                                    <%=StatusCountOfCropGet(Crops.getPkCrops())%>
                                                    &nbsp;<span name="lblLandDetailsLoopProgressName">progresses</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a class="btn btn-primary mt-2 mb-1 btn-block"
                                               id="lblLandDetailsAddNewProgress"
                                               name="lblLandDetailsAddNewProgressName"
                                               href="ProgressAdd.jsp?PkCrops=<%=Crops.getPkCrops()%>&PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>&PkProfiles=<%=PkProfiles%>">
                                                Add A Progress
                                            </a>
                                            <a class="btn btn-outline-secondary mr-1 mb-1 btn-block"
                                               id="lblLandDetailsUpdateCrop"
                                               name="lblLandDetailsUpdateCropName"
                                               href="CropUpdate.jsp?PkCrops=<%=Crops.getPkCrops()%>&PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>">
                                                Edit
                                            </a>
                                            <a class="btn btn-outline-success mt-2 mb-1 btn-block"
                                               id="lblLandDetailsAllProgresses"
                                               name="lblLandDetailsAllProgressesName"
                                               href="CropDetails.jsp?PkCrops=<%=Crops.getPkCrops()%>&PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>">
                                                Progresses
                                            </a>
                                        </div>
                                    </div>
                                    <!--/widget_item-->

                                </div>
                                <!--/widget-->

                            </div>
                        </div>

                    </div>

                    <%--                    </a>--%>

                    <%
                            CropCount++;
                        }
                    %>

                </div>
                <!--/inner_row-->

                <%
                    if (Pages > 1) {
                %>

                <!--inner_row-->
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#">Pages</a></li>

                            <%
                                //--to show number of pages
                                for (int i = 0; i < Pages; i++) {
                            %>

                            <li class="page-item">
                                <a class="page-link"
                                   href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>&Page=<%=(i+1)%>"><%=(i + 1)%>
                                </a>
                            </li>

                            <%
                                }
                            %>

                        </ul>
                    </div>
                </div>
                <!--/inner_row-->

                <%
                    }
                %>

            </div>
            <!--/land-list-->

            <%
                }
            %>

        </div>
        <!--/all-lands-->

        <!-- land-details-cards-->
        <!-- <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Data-Upload"></i>
                                <p class="text-muted mt-2 mb-2">Today&apos;s Upload</p>
                                <p class="lead text-22 m-0">21</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Add-User"></i>
                                <p class="text-muted mt-2 mb-2">New Users</p>
                                <p class="lead text-22 m-0">21</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Money-2"></i>
                                <p class="text-muted mt-2 mb-2">Total sales</p>
                                <p class="lead text-22 m-0">4021</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Data-Upload"></i>
                                <p class="text-muted mt-2 mb-2">Today&apos;s Upload</p>
                                <p class="lead text-22 m-0">21</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Add-User"></i>
                                <p class="text-muted mt-2 mb-2">New Users</p>
                                <p class="lead text-22 m-0">21</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Money-2"></i>
                                <p class="text-muted mt-2 mb-2">Total sales</p>
                                <p class="lead text-22 m-0">4021</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Data-Upload"></i>
                                <p class="text-muted mt-2 mb-2">Today&apos;s Upload</p>
                                <p class="lead text-22 m-0">21</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Add-User"></i>
                                <p class="text-muted mt-2 mb-2">New Users</p>
                                <p class="lead text-22 m-0">21</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center"><i class="i-Money-2"></i>
                                <p class="text-muted mt-2 mb-2">Total sales</p>
                                <p class="lead text-22 m-0">4021</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- /land-details-cards-->

        <!-- end of main-content -->

        <!--modal-display-->

        <%
            String Response = "None";
            if (request.getParameter("IsCropSaved") != null &&
                    request.getParameter("IsCropSaved").equals("true")) {
                //show alert
                Response = "IsCropSavedTrue";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-success-->
                <div class="modal fade" id="ModalSuccess01IsCropSavedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess01Title">Success!</h2>
                                    <p id="ModalSuccess01BodyIsCropSavedTrue" class="mt-4 mb-4">Crop added.</p>
                                    <button class="btn btn-lg btn-success" type="button" data-dismiss="modal">
                                        <span id="ModalSuccess01Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-success-->

            </div>

        </div>
        <!--/row-->

        <!--/modal-display-->

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
<script src="dist-assets/js/custom/switch_language.js"></script>

<script type="text/javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsCropSavedTrue':
                // alert("Success!");
                $('#ModalSuccess01IsCropSavedTrue').modal('show');
                break;
            default:
        }
    }
</script>

<script type="text/javascript">
    const language = getLanguage();

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

        var value = "<%=CropCount%>";

        var update_crop = document.getElementsByName("lblLandDetailsUpdateCropName");
        var all_statuses = document.getElementsByName("lblLandDetailsAllProgressesName");
        var add_new_status = document.getElementsByName("lblLandDetailsAddNewProgressName");
        var loop_progresses = document.getElementsByName("lblLandDetailsLoopProgressName");

        switch (language) {

            case "Sinhala":
                for (var x = 0; x < value; x++) {
                    update_crop[x].innerHTML = "යාවත්කාලීන කරන්න";
                    all_statuses[x].innerHTML = "ප්‍රගතින්";
                    add_new_status[x].innerHTML = "ප්‍රගතියක් එක් කරන්න";
                    loop_progresses[x].innerHTML = "ප්‍රගතින්";
                    let crop_name = document.getElementById("cropName" + x);
                    let name = translateCrops("Sinhala", crop_name.innerText);
                    crop_name.innerText = name;
                }
                break;
            case "Tamil":
                for (var x = 0; x < value; x++) {
                    update_crop[x].innerHTML = "தொகு";
                    all_statuses[x].innerHTML = "முன்னேறுகிறது";
                    add_new_status[x].innerHTML = "முன்னேற்றத்தைச் சேர்க்கவும்";
                    loop_progresses[x].innerHTML = "முன்னேறுகிறது";
                    let crop_name = document.getElementById("cropName" + x);
                    let name = translateCrops("Tamil", crop_name.innerText);
                    crop_name.innerText = name;
                }
                break;
            case "English":
                for (var x = 0; x < value; x++) {
                    update_crop[x].innerHTML = "Edit";
                    all_statuses[x].innerHTML = "Progresses";
                    add_new_status[x].innerHTML = "Add A Progress";
                    loop_progresses[x].innerHTML = "progresses";
                    let crop_name = document.getElementById("cropName" + x);
                    let name = translateCrops("English", crop_name.innerText);
                    crop_name.innerText = name;
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