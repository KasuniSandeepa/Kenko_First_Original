<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="static services.DatabaseCheck.CropCountOfLandGet" %>
<%@ page import="static services.HttpSession.PROFILES" %>
<%@ page import="models.LandDetails" %>
<%@ page import="static services.LandDetailsServices.LandTypeImageUrlGet" %>
<%@ page import="services.LandDetailsServices" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>All Lands - Kenko 1st Agri Business</title>
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
        int LandCount = 0;

%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblLandAllBreadCrumbsLandsHeading">Lands</h1>
            <ul>
                <li><a id="lblLandAllBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><span id="lblLandAllBreadCrumbsLands">Lands</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!--all-lands-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1">
                        <h4 id="lblLandAllAllLandsHeading" class="mb-3">All Lands</h4>
                    </div>
                    <a class="btn btn-dark mb-3 m-sm-0"
                       href="LandAdd.jsp"
                       id="btnLandAllAddNewLand">Add A New Land</a>
                </div>
            </div>

            <!--land-list-->

            <%
                if (services.DatabaseCheck.LandCountOfProfilesGet(Profiles
                        .getPkProfiles()) == 0) {
                    //show land reg
            %>

            <div class="col-md-12 mb-4">
                <div class="alert alert-card alert-warning text-center">
                    <span id="lblLandAllNoLandsToShow">No lands to show</span>!&nbsp;
                    <a class="btn btn-warning" href="LandAdd.jsp"
                       id="lblLandAllAddANewLand2">Add A New Land</a>
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

                        List<LandDetails> LandDetailsList = new LandDetailsServices()
                                .LandDetailsOfProfilePaginatedGet(Profiles.getPkProfiles(), PageId, Total);

                        int ResultSize = LandDetailsList.size();
//                                System.out.println("LandDetailsList.size: " + ResultSize);

                        int Pages = 0;
                        if ((ResultSize % Total) == 0) {
                            Pages = ResultSize / Total;
                        } else {
                            Pages = (ResultSize / Total) + 1;
                        }

                        for (LandDetails LandDetails : LandDetailsList) {
                    %>

<%--                    <a href="LandDetails.jsp?PkLandDetails=<%=LandDetails.get_PkLandDetails()%>">--%>

                    <div class="col-lg-6">

                        <div class="card mb-4" style="background-color:#f1f6f0;">
                            <div class="card-body p-2">

                                <!--widget-->
                                <div class="ul-widget5 m-0 p-0">

                                    <!--widget_item-->
                                    <div class="ul-widget5__item m-0 p-0">

                                        <div class="ul-widget-s5__content m-0 p-0">
                                            <div>
                                                <img class="avatar-lg mb-sm-0 rounded mr-sm-3"
                                                     src="<%=LandTypeImageUrlGet(LandDetails.getLandType())%>"
                                                     alt="<%=LandDetails.getName()%>"/>
                                            </div>
                                            <div class="ul-widget-s5__section text-left">
                                                <h5 class="lead m-1 pl-1">
                                                    <a href="LandDetails.jsp?PkLandDetails=<%=LandDetails.getPkLandDetails()%>">
                                                        <strong>
                                                            <span class="d-inline-block text-truncate"
                                                                  style="max-width: 250px;">
                                                                <%=LandDetails.getName()%>
                                                            </span>
                                                        </strong>
                                                    </a>
                                                </h5>
                                                <p class="m-1 pl-1 text-small text-muted">
                                                    <%=LandDetails.getAddress()%>
                                                </p>
                                                <p class="text-small text-danger m-1 pl-1">
                                                    <%=CropCountOfLandGet(LandDetails.getPkLandDetails())%>
                                                    &nbsp;<span name="lblLandAllLoopCropsName">crops</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a class="btn btn-primary mt-2 mb-1 btn-block"
                                               id="lblLandAllAddNewCrop"
                                               name="lblLandAllAddNewCropName"
                                               href="CropAdd.jsp?PkLandDetails=<%=LandDetails.getPkLandDetails()%>">
                                                Add A Crop
                                            </a>
                                            <a class="btn btn-outline-secondary mr-1 mb-1 btn-block"
                                               id="lblLandAllUpdateLand"
                                               name="lblLandAllUpdateLandName"
                                               href="LandUpdate.jsp?PkLandDetails=<%=LandDetails.getPkLandDetails()%>">
                                                Edit
                                            </a>
                                            <a class="btn btn-outline-success mt-2 mb-1 btn-block"
                                               id="lblLandAllAllCrops"
                                               name="lblLandAllAllCropsName"
                                               href="LandDetails.jsp?PkLandDetails=<%=LandDetails.getPkLandDetails()%>">
                                                Crops
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
                            LandCount++;
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
                                <a class="page-link" href="LandAll.jsp?page=<%=(i+1)%>"><%=(i + 1)%>
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

    function convertLoop(language) {
        var value = "<%=LandCount%>";
        var update_land = document.getElementsByName("lblLandAllUpdateLandName");
        var all_crops = document.getElementsByName("lblLandAllAllCropsName");
        var add_a_new_crop = document.getElementsByName("lblLandAllAddNewCropName");
        var loop_crops = document.getElementsByName("lblLandAllLoopCropsName");

        switch (language) {
            case "Sinhala":
                for (var x = 0; x < value; x++) {
                    add_a_new_crop[x].innerHTML = "බෝගයක් එක් කරන්න";
                    all_crops[x].innerHTML = "භෝග";
                    update_land[x].innerHTML = "යාවත්කාලීන කරන්න";
                    loop_crops[x].innerHTML = "භෝග";
                }
                break;
            case "Tamil":
                for (var x = 0; x < value; x++) {
                    add_a_new_crop[x].innerHTML = "பயிர் சேர்க்கவும்";
                    all_crops[x].innerHTML = "பயிர்கள்";
                    update_land[x].innerHTML = "தொகு";
                    loop_crops[x].innerHTML = "பயிர்கள்";
                }
                break;
            case "English":
                for (var x = 0; x < value; x++) {
                    add_a_new_crop[x].innerHTML = "Add A Crop";
                    all_crops[x].innerHTML = "Crops";
                    update_land[x].innerHTML = "Edit";
                    loop_crops[x].innerHTML = "Crops";
                }
                break;
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