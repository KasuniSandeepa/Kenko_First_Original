<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="services.DatabaseCheck" %>
<%@ page import="static services.DatabaseCheck.StatusCountOfCropGet" %>
<%@ page import="java.util.*" %>
<%@ page import="services.CropsServices" %>
<%@ page import="models.*" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>All Crops - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
</head>

<body class="text-left">

<%
    if (request.getSession().getAttribute(PROFILES) == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profiles Profiles = (Profiles) request.getSession().getAttribute(PROFILES);
        int PkProfiles = Profiles.getPkProfiles();
        //--
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
            <h1 id="lblCropAllBreadCrumbsCropsHeading">Crops</h1>
            <ul>
                <li><a id="lblCropAllBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><span id="lblCropAllBreadCrumbsCrops">Crops</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!--all-crops-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1">
                        <h4 id="lblCropAllAllCropsHeading" class="mb-3">All Crops</h4>
                    </div>
                    <%
                        if (new DatabaseCheck().LandCountOfProfilesGet(PkProfiles) == 0) {
                            //show land reg
                    %>
                    <a class="btn btn-dark mb-3 m-sm-0"
                       href="LandAdd.jsp" id="btnCropAllAddNewCrop">Add A New Crop</a>
                    <%
                    } else {
                        //show land all
                    %>
                    <a class="btn btn-dark mb-3 m-sm-0"
                       href="LandAll.jsp" id="btnCropAllAddNewCrop">Add A New Crop</a>
                    <%
                        }
                    %>
                </div>
            </div>

            <%--<a class="btn btn-info mb-3 m-sm-0 btn-sm"--%>
            <%--href="LandAdd.jsp">Add A New Crop</a>--%>

            <%
                if (new DatabaseCheck().CropCountOfProfilesGet(PkProfiles) == 0) {
                    //show land reg
            %>

            <div class="col-md-12 mb-4">
                <div class="alert alert-card alert-warning text-center">
                    <span id="lblCropAllNoCropsToShow">No crops to show</span>!&nbsp;
                    <a class="btn btn-warning" href="LandAdd.jsp"
                       id="btnCropAllAddNewCrop2">Add A New Crop</a>
                </div>
            </div>

            <%
            } else {
                //show current crops
            %>

            <!--crop-list-->
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

                        List<models.Crops> CropsList = new CropsServices()
                                .CropsOfProfilesPaginatedGet(PkProfiles, PageId, Total);

                        int ResultSize = CropsList.size();

                        int Pages = 0;
                        if ((ResultSize % Total) == 0) {
                            Pages = ResultSize / Total;
                        } else {
                            Pages = (ResultSize / Total) + 1;
                        }

                        ArrayList<String> CropNames = new ArrayList<>();
                        String ImageUrl ="";

                        for (Crops Crops : CropsList) {
                    %>

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
                                                     src="<%=ImageUrl%>"
                                                     alt="<%=Crops.getCropTypes().getName()%>"/>

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
                                                <p class="text-small text-muted m-1">
                                                    <a href="LandDetails.jsp?PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>">
                                                        <%=Crops.getLandDetails().getName()%>
                                                    </a>
                                                </p>
                                                <p class="text-small text-danger m-1">
                                                    <%=StatusCountOfCropGet(Crops.getPkCrops())%>
                                                    &nbsp;<span name="lblCropAllLoopProgressesName">progresses</span>
                                                </p>
                                            </div>

                                        </div>
                                        <div class="text-center">
                                            <a class="btn btn-primary mt-2 mb-1 btn-block"
                                               id="lblCropAllAddANewStatusCrop"
                                               name="lblCropAllAddANewStatusName"
                                               href="ProgressAdd.jsp?PkCrops=<%=Crops.getPkCrops()%>&PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>&PkProfiles=<%=PkProfiles%>">
                                                Add A Progress
                                            </a>
                                            <a class="btn btn-outline-secondary mr-1 mb-1 btn-block"
                                               id="lblCropAllUpdateCrop"
                                               name="lblCropAllUpdateCropName"
                                               href="CropUpdate.jsp?PkCrops=<%=Crops.getPkCrops()%>&PkLandDetails=<%=Crops.getLandDetails().getPkLandDetails()%>">
                                                Edit
                                            </a>
                                            <a class="btn btn-outline-success mt-2 mb-1 btn-block"
                                               id="lblCropAllAllStatus"
                                               name="lblCropAllAllStatusName"
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
                            <li class="page-item disabled"><a class="page-link" href="#">Pages</a></li>

                            <%
                                //--to show number of pages
                                for (int i = 0; i < Pages; i++) {
                            %>

                            <li class="page-item">
                                <a class="page-link" href="CropAll.jsp?Page=<%=(i+1)%>"><%=(i + 1)%>
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
            <!--/crop-list-->

            <%
                }
            %>

        </div>
        <!--/all-crops-->

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
<script src="dist-assets/js/custom/switch_language.js"></script>

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

        let value = "<%=CropCount%>";

        let update_crop = document.getElementsByName("lblCropAllUpdateCropName");
        let all_statuses = document.getElementsByName("lblCropAllAllStatusName");
        let add_new_status = document.getElementsByName("lblCropAllAddANewStatusName");
        let loop_progresses = document.getElementsByName("lblCropAllLoopProgressesName");

        switch (language) {

            case "Sinhala":
                for (let x = 0; x < value; x++) {
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
                for (let x = 0; x < value; x++) {
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