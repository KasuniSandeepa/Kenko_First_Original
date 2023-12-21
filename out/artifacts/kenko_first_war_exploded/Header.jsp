<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Profiles" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/font-awesome.min.css" rel="stylesheet"/>

    <style type="text/css">
        /*ul .navigation-left li {*/
        /*    margin-bottom: 5px;*/
        /*}*/
        ul .navigation-left li a hover {
            cursor: pointer;
            /*background-color: #6b911b;*/
        }
    </style>

</head>
<body>

<!-- =============== Left side start ================-->

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profiles") == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profiles ProfilesInHeader = (Profiles) request.getSession().getAttribute(PROFILES);
%>

<div class="app-admin-wrap layout-sidebar-large">
    <div class="main-header" style="background-color:#8eb388;">
<%--        <div class="logo d-none d-sm-block">--%>
            <div class="logo">
            <a href="Profile.jsp">
                <img class="logo" src="dist-assets/images/logo.png" alt="#">
            </a>
        </div>
        <div class="menu-toggle">
            <i class="i-Align-Justify-All text-muted header-icon" style="background-color:#e3ece1;"></i>
        </div>

        <%--<div class="d-flex align-items-center">--%>
        <%--<div class="search-bar">--%>
        <%--<input type="text" placeholder="Search">--%>
        <%--<i class="search-icon text-muted i-Magnifi-Glass1"></i>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div style="margin: auto"></div>
        <div class="header-part-right">
            <!-- Full screen toggle -->
            <i class="i-Full-Screen header-icon d-none d-sm-inline-block"
               data-fullscreen style="background-color:#e3ece1;"></i>
            <div>
                <a href="#"
                   onclick="ToggleLanguageEnglish(); convertLoop('English'); TranslateCropLabel('English');
                   <%--onclick="ToggleLanguageEnglish(); convertLoop('English');--%>
                   SetDropDownLanguage('English'); SetDropDownLanguageInUpdate('English'); SetDropDownLanguageGnDivison('English');">
                    <i class="header-icon"
                       style="background-color:#e3ece1;"><span id="lblHeaderLanguageSwitchEnglish" class="small">E</span></i>
                </a>
            </div>

            <div>
                <a href="#"
                   onclick="ToggleLanguageSinhala(); convertLoop('Sinhala'); TranslateCropLabel('Sinhala');
                   <%--onclick="ToggleLanguageSinhala(); convertLoop('Sinhala');--%>
                   SetDropDownLanguage('Sinhala'); SetDropDownLanguageInUpdate('Sinhala'); SetDropDownLanguageGnDivison('Sinhala');">
                    <i class="header-icon"
                       style="background-color:#e3ece1;"><span id="lblHeaderLanguageSwitchSinhala" class="small">සි</span></i>
                </a>
            </div>

            <div>
                <a href="#"
                   onclick="ToggleLanguageTamil(); convertLoop('Tamil'); TranslateCropLabel('Tamil');
                   <%--onclick="ToggleLanguageTamil(); convertLoop('Tamil');--%>
                   SetDropDownLanguage('Tamil'); SetDropDownLanguageInUpdate('Tamil'); SetDropDownLanguageGnDivison('Tamil');">
                    <i class="header-icon"
                       style="background-color:#e3ece1;"><span id="lblHeaderLanguageSwitchTamil" class="small">த</span></i>
                </a>
            </div>

            <!-- User avatar dropdown -->
            <div class="dropdown">
                <div class="user col align-self-end">

                    <%
                        if (ProfilesInHeader.getPhotoUrl().contains("/")) {
                            //profile img
                    %>
                    <img src="<%=ProfilesInHeader.getPhotoUrl()%>" id="userDropdown"
                         alt="<%=ProfilesInHeader.getName()%>"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%--<img src="<%=Profiles.getPhotoUrl()%>"--%>
                    <%--alt="<%=Profiles.getName()%>"/>--%>
                    <%
                    } else {
                        if (ProfilesInHeader.getGender().equals("Female")) {
                            //female img
                    %>
                    <img src="dist-assets/images/faces/4.jpg" id="userDropdown" alt="image_female"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%--<img src="dist-assets/images/faces/4.jpg" alt=""/>--%>
                    <%
                    } else if (ProfilesInHeader.getGender().equals("Male")) {
                        //male img
                    %>

                    <img src="dist-assets/images/faces/2.jpg" id="userDropdown" alt="image_male"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%
                            }
                        }
                    %>

                    <%--<img src="dist-assets/images/faces/2.jpg" id="userDropdown" alt="image"--%>
                    <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="Profile.jsp">
                            <i class="i-Lock-User mr-1"></i><%=ProfilesInHeader.getName().split("_")[0]%>
                        </a>
                        <a class="dropdown-item" href="ProfileUpdate.jsp">
                            <i class="i-Gear mr-1"></i>
                            <span id="lblHeaderAccountDetails">Details</span>
                        </a>
                        <a class="dropdown-item" href="SignOutServlet">
                            <i class="i-Power-2 mr-1"></i>
                            <span id="lblHeaderSignOut">Sign out</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="side-content-wrap">
        <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
            <ul class="navigation-left mainlist" style="background-color: #e3ece1;">
                <li class="nav-item">
                    <a class="nav-item-hold" href="Profile.jsp">
                        <img class="nav-icon " src="dist-assets/images/custom/home.svg"
                             alt="Home"/>
                        <span class="nav-text" id="lblHeaderHome">Home</span>
                    </a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item">
                    <a class="nav-item-hold" href="LandAll.jsp">
                        <img class="nav-icon" src="dist-assets/images/custom/map.svg"
                             alt="Lands"/>
                        <span class="nav-text" id="lblHeaderLands">Lands</span>
                    </a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item">
                    <a class="nav-item-hold" href="CropAll.jsp">
                        <img class="nav-icon" src="dist-assets/images/custom/plant.svg"
                             alt="Crops"/>
                        <span class="nav-text" id="lblHeaderCrops">Crops</span>
                    </a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item">
                    <a class="nav-item-hold" href="#">
                        <img class="nav-icon" src="dist-assets/images/custom/crops.svg"
                             alt="History"/>
                        <span class="nav-text" id="lblHeaderHistory">History</span>
                    </a>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <div class="sidebar-overlay"></div>
    </div>

</div>

<!-- =============== Left side End ================-->

<!--============ Body content start =============-->
<!--============ Body content end =============-->

<!--Footer Start-->
<!--fotter end-->

<!-- ============ Search UI Start ============= -->
<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
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

    const lan = getLanguage();
    console.log('lan: '+lan);

    if (lan == "Sinhala") {
        ToggleLanguageSinhala();
        convertLoop("Sinhala");
        TranslateCropLabel("Sinhala");
    }
    if (lan == "Tamil") {
        ToggleLanguageTamil();
        convertLoop("Tamil");
        TranslateCropLabel("Tamil");
    }
    if (lan == "English") {
        ToggleLanguageEnglish();
        convertLoop("English");
        TranslateCropLabel("English");
    }

    function convertLoop(language) {
    /*to avoid 'function undefined' error*/
    }

    function TranslateCropLabel(language) {
        /*to avoid 'function undefined' error*/
    }

</script>

<%
    }
%>

</body>
</html>