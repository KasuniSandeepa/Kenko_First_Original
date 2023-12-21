<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="utils.Strings" %>
<%@ page import="static services.DatabaseCheck.StatusCountOfCropGet" %>
<%@ page import="static services.LandAreaServices.LandAreaInPlotsReformattedGet" %>
<%@ page import="static services.ProgressesServices.*" %>
<%@ page import="services.CropTypesServices" %>
<%@ page import="models.*" %>
<%@ page import="services.ProgressesServices" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Crop Details - Kenko 1st Agri Business</title>
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
        int PkProfiles = Profiles.getPkProfiles(), PkCrops = 0, PkLandDetails = 0;
        PkCrops = Integer.parseInt(request.getParameter("PkCrops"));
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));
        //--
        int j = 0;

%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblCropDetailsBreadCrumbsCropDetailsHeading">Crop Details</h1>
            <ul class="ml-2">
                <%--                <li><a id="lblCropDetailsBreadCrumbsProfile" href="x.jsp">x</a></li>--%>
                <%--                <li><a id="lbCropDetailsBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>--%>
                <li><a id="lblCropDetailsBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li><span id="lblCropDetailsCropDetails">Crop Details</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- summary -->
        <div class="row">
            <!-- ICON BG-->
            <div class="col-lg-4 col-md-6 d-none d-sm-block">
                <div class="card card-icon-bg bg-success text-white o-hidden mb-4">
                    <div class="card-body text-center"><i class="i-Drop text-white"></i>
                        <div class="content align-items-center">
                            <p class="lead text-24 mb-2">
                                <%=StatusCountOfCropGet(PkCrops)%>
                            </p>
                            <p id="pCropDetailsActivities" class="mt-2 mb-0">Progresses</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /summary -->

        <!--crop-details-update-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="breadcrumb">
                    <ul>
                        <li class="pl-0">
                            <%=new CropTypesServices().CropTypesNameGet(PkCrops)%>
                            <%--<%=services.DatabaseCheck.LandNameGet(PkLandDetails)%>--%>
                        </li>
                        <li>
                            <a id="lblCropDetailsUpdateCropDetails" class="small"
                               href="CropUpdate.jsp?PkCrops=<%=PkCrops%>&PkLandDetails=<%=PkLandDetails%>">
                                <u>Update Crop Details</u>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <!--/crop-details-update-->

        <!--all-status-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1">
                        <span id="lblCropDetailsAllStatusHeading">All Progresses</span>
                    </div>
                    <a id="lblCropDetailsAddNewStatus" class="btn btn-dark m-sm-0"
                       href="ProgressAdd.jsp?PkCrops=<%=PkCrops%>&PkLandDetails=<%=PkLandDetails%>&PkProfiles=<%=PkProfiles%>">
                        Add A New Progress
                    </a>
                </div>
            </div>

            <%
                if (StatusCountOfCropGet(PkCrops) == 0) {
                    //show status reg
            %>

            <div class="col-md-12 mb-4">
                <div class="alert alert-card alert-warning text-center">
                    <span id="lblCropDetailsNoStatusesToShow">No progresses to show</span>!&nbsp;
                    <a id="lblCropDetailsAddNewStatus2" class="btn btn-warning"
                       href="ProgressAdd.jsp?PkCrops=<%=PkCrops%>&PkLandDetails=<%=PkLandDetails%>&PkProfiles=<%=PkProfiles%>">
                        Add A New Progress</a>
                </div>
            </div>

            <%
            } else {
                //show current status
            %>

            <!--status-list-->
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

                        List<Progresses> ProgressesList = new ProgressesServices()
                                .ProgressesListOfCropPaginatedGet(PkCrops, PageId, Total);

                        int ResultSize = ProgressesList.size();

                        int Pages = 0;
                        if ((ResultSize % Total) == 0) {
                            Pages = ResultSize / Total;
                        } else {
                            Pages = (ResultSize / Total) + 1;
                        }

                        for (Progresses Progresses : ProgressesList) {

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

                                                <img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"
                                                     src="<%=ProgressImageUrlGet(Progresses.getProgressTypes().getName())%>"
                                                     alt="<%=Progresses.getProgressTypes().getName()%>"/>

                                            </div>
                                            <div class="ul-widget-s5__section text-left">
                                                <h5 class="lead text-primary m-1">
                                                    <strong id="lblProgressTypeId<%=j%>"><%=Progresses.getProgressTypes().getName()%>
                                                    </strong>

                                                </h5>
                                                <p id="lblProgressTypeDescId<%=j%>" class="text-small text-muted m-1">
                                                    <%
                                                        String ProgressQuantityVerified = "";
                                                        if (Progresses.getQuantity().contains("x")) {
                                                            String[] NewValues = LandAreaInPlotsReformattedGet(Progresses
                                                                            .getQuantity());
                                                            ProgressQuantityVerified = NewValues[0] + NewValues[1] +
                                                                    NewValues[2] + NewValues[3];
                                                        } else if(Progresses.getQuantity()
                                                                .equals(Progresses.getCrops().getCultivatedLandArea())) {
                                                            ProgressQuantityVerified = "All";
                                                        } else {
                                                        ProgressQuantityVerified = Strings
                                                                .UnderscoresReplace(Progresses.getQuantity());
                                                    }
                                                    %>
                                                    <%=ProgressQuantityVerified%>
                                                    <input type="text" value="<%=ProgressQuantityVerified%>" id="lblQuantityId<%=j%>" hidden>

                                                    <%
                                                        String ProgressType = "";
                                                        if (Progresses.getProgressTypes().getName()
                                                                .equalsIgnoreCase("Applied Fertilizer")) {
                                                            ProgressType = " of " + Progresses.getFertilizerTypes().getName();
                                                        } else if (Progresses.getProgressTypes().getName()
                                                                .equalsIgnoreCase("Pest Controlled")) {
                                                            ProgressType = " of " + Progresses.getPesticideTypes().getName();
                                                        }
//                                                        System.out.println("CategoryType: " + CategoryType);
                                                    %>
                                                    <%=ProgressType%>

                                                </p>
                                                <input type="text" value="<%=ProgressQuantityVerified%>"
                                                       id="lblQuantityId<%=j%>" hidden>
                                                <% j++;%>
                                                <p class="text-small text-danger m-1">
                                                    on <%=Progresses.getUpdatedDateTime()%>
                                                </p>

                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <span>&nbsp;</span>
                                        </div>
                                    </div>
                                    <!--/widget_item-->

                                </div>
                                <!--/widget-->

                            </div>
                        </div>

                    </div>

                    <%
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
                                   href="CropDetails.jsp?PkCrops=<%=PkCrops%>&PkLandDetails=<%=PkLandDetails%>&PkProfiles=<%=PkProfiles%>&Page=<%=(i+1)%>">
                                    <%=(i + 1)%>
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
            <!--/status-list-->

            <%
                }
            %>

        </div>
        <!--/all-status-->

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
            if (request.getParameter("IsStatusSaved") != null &&
                    request.getParameter("IsStatusSaved").equals("true")) {
                //show alert
                Response = "IsStatusSavedTrue";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-success-->
                <div class="modal fade" id="ModalSuccess01IsStatusSavedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess01Title">Success!</h2>
                                    <p id="ModalSuccess01BodyIsStatusSavedTrue" class="mt-4 mb-4">Progress added.</p>
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

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsStatusSavedTrue':
                // alert("Success!");
                $('#ModalSuccess01IsStatusSavedTrue').modal('show');
                break;
            default:
        }
    }
</script>

<script language="javascript">
    const language = getLanguage();
    console.log(language)
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

    function convertLoop(lan) {

        var value = "<%=j%>";

        for (var x = 0; x < value; x++) {

            console.log("Value  nnnn" + x);

            var progress_Type = document.getElementById("lblProgressTypeId"+x);

            var progress = translateProgressTypes(lan, progress_Type.innerText);
            progress_Type.innerText = progress;

            var progress_Type_desc = document.getElementById("lblProgressTypeDescId"+x);

            var progress_quantity = document.getElementById("lblQuantityId"+x);
            var quantity = progress_quantity.value;

            var translatedText = translateProgressDesc(lan, progress_Type_desc.innerText, quantity);
            console.log("Translated Text"+translatedText);
            progress_Type_desc.innerText = translatedText;
        }

    }

</script>

<%
    }
%>

</body>
</html>