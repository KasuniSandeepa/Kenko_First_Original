
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Internal Server Error - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/font-awesome.min.css" rel="stylesheet"/>

</head>
<body style="background-color: #e3ece1;">

<!--content-->

<div class="auth-layout-wrap">
    <div class="auth-content">
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <div class="card o-hidden" style="height: 560px;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="p-4">
                                <div class="auth-logo text-center mb-4">
                                    <img src="dist-assets/images/logo.png" alt="">
                                </div>

                                <div class="text-center pt-4">
                                    <h1 class="text-60 text-danger font-weight-bold">500</h1>
                                    <p class="text-36 subheading mb-4 text-danger font-weight-bold">
                                        <span id="lblError500Title">Error!</span>
                                    </p>
                                    <p class="mb-5 text-muted text-18">
                                        <span id="lblError500Body">
                                            Sorry! There is was problem in our end.
                                            We are looking into it.
                                        </span>
                                    </p>
                                    <a class="btn btn-primary btn-block" href="Profile.jsp" id="lblError500Footer">
                                        Go Back To The Main Page
                                    </a>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-1">
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="FooterMobios.jsp" %>

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>

<script>
    const lan = getLanguage();
    console.log(lan);
    if (lan == "Sinhala") {
        ToggleLanguageSinhala();
    }
    if (lan == "Tamil") {
        ToggleLanguageTamil();
    }
    if (language == "English") {
        ToggleLanguageEnglish();
        convertLoop("English");
    }
</script>

</body>
</html>