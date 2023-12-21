<%@ page import="models.CropTypes" %>
<%@ page import="services.CropTypesServices" %>
<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Carousel 5 - LT</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/slick/slick.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/custom/font-awesome.min.css">
    <%--    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>--%>

    <style type="text/css">
        #slick .arrow_prev {
            position: absolute;
            top: 30%;
            left: 5%;
        }

        #slick .arrow_prev span {
            font-size: 15px;
            cursor: pointer;
            border-radius: 25px;
            /*background-color: #6b911b;*/
            background-color: rgba(107, 145, 27, 0.8);
            display: block;
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 52px;
            padding-right: 5px;
        }

        #slick .arrow_next {
            position: absolute;
            top: 30%;
            right: 5%;
        }

        #slick .arrow_next span {
            font-size: 15px;
            cursor: pointer;
            border-radius: 25px;
            /*background-color: #6b911b;*/
            background-color: rgba(107, 145, 27, 0.8);
            display: block;
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 52px;
            padding-left: 4px;
        }

        /* HIDE RADIO */
        [type=radio] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        input[type=radio]:hover + label > div {
            cursor: pointer;
            background-color: #e3ece1;
        }

        input[type=radio]:checked + label > div {
            background-color: #c7d9c3;
        }
    </style>

</head>

<body class="text-left">

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content">
        <div class="breadcrumb">
            <h1>Blank</h1>
            <ul class="ml-2">
                <li><a href="">Pages</a></li>
                <li>Blank</li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <div class="row">
            <div class="col-md-12">

                <p class="mb-2"><strong>Carousel 2</strong></p>

            </div>
        </div>

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form class="submit-form" action="TestServlet" method="post">

                            <!--land-id-->
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="land_id"
                                           value="">
                                </div>
                            </div>
                            <!--/land-id-->

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropType">Crop Type</label>
                                    </div>

                                    <!--carousel-->

                                    <!--section-->

                                    <section id="slick">
                                        <div class="container p-0">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--carousel-->
                                                    <div class="parent">

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

                                                            <input id="<%=CropNameWhitespaceRemoved%>" type="radio"
                                                                   name="crop_type" class="validate-field"
                                                                   value="<%=CropTypes.getName()%>"/>

                                                            <label for="<%=CropNameWhitespaceRemoved%>">
                                                                <div class="card m-1 p-1">
                                                                    <img class="card-img-top mx-auto"
                                                                         src="<%=CropTypeDefaultImageUrl%>"
                                                                         alt="<%=CropTypes.getName()%>">
                                                                    <div class="card-body p-0">
                                                                        <%--                                                                        <p id="lblCropCarousel<%=CropNameWhitespaceRemoved%>"--%>
                                                                        <p id="lblCropCarousel<%=CropCount%>"
                                                                           class="m-0 p-0 text-center small">
                                                                            <%=CropTypes.getName()%>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </label>

                                                            <%--                                                            <input type="text" value="<%=CropNameWhitespaceRemoved%>" --%>
                                                            <%--                                                                   id="lblCropCarousel<%=CropCount%>" hidden>--%>

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
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button class="btn btn-primary form-submit-button">Add New Crop</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <!-- end of main-content -->

    </div>

    <!-- ============ Body content end ============= -->

    <!-- Footer Start -->

    <!-- fotter end -->

</div>

<!-- ============ Search UI Start ============= -->

<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/slick/slick.min.js"></script>
<%--<script src="dist-assets/js/custom/main.js"></script>--%>
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

<%--<script type="text/javascript">--%>
<%--    $(document).ready(function () {--%>
<%--        // Disable button--%>
<%--        $('.form-submit-button').prop('disabled', true);--%>
<%--        // Cache fields that you want to validate--%>
<%--        var $fieldsToCheck = $('.submit-form .validate-field');--%>
<%--        // Function to ensure fields are not empty--%>
<%--        var checkFields = function () {--%>
<%--            // Get array of empty fields--%>
<%--            var emptyFields = $fieldsToCheck.map(function () {--%>
<%--                return this.value;--%>
<%--            }).get().filter(function (val) {--%>
<%--                return val.length === 0;--%>
<%--            });--%>
<%--            // Disabled prop to be toggled based on length of empty fields--%>
<%--            $('.form-submit-button').prop('disabled', !!emptyFields.length);--%>
<%--        };--%>
<%--        // Bind onInput event to all inputs you want to check--%>
<%--        $fieldsToCheck.on('input', checkFields);--%>
<%--    });--%>
<%--</script>--%>

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

<%--<script type="text/javascript">--%>

<%--    let CropCount =<%=CropCount%>;--%>

<%--    function CropCountDisplay() {--%>

<%--        let LabelValue = '';--%>
<%--        for (let i = 0; i < CropCount; i++) {--%>
<%--            // console.log("CropCount: " + i);--%>
<%--            LabelValue = document.getElementById("lblCropCarousel" + i).innerHTML;--%>
<%--            console.log((i + 1) + "," + LabelValue);--%>
<%--        }--%>

<%--    }--%>

<%--    CropCountDisplay();--%>
<%--</script>--%>

</body>
</html>