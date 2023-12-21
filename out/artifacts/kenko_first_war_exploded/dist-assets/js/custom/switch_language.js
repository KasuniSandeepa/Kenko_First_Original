function setLanguage(lan) {
    if (lan == "Sinhala") {
        localStorage.setItem('language', "Sinhala")
        console.log(localStorage.getItem('language'));
    } else if (lan == "English") {
        localStorage.setItem('language', "English")
        console.log(localStorage.getItem('language'));
    } else if (lan == "Tamil") {
        localStorage.setItem('language', "Tamil")
        console.log(localStorage.getItem('language'));
    }
}

function getLanguage() {

    return localStorage.getItem('language')
}

function ToggleLanguageSinhala() {
    console.log("ToggleLanguageSinhala")
    setLanguage("Sinhala");
    switchToSinhala();
}

function ToggleLanguageEnglish() {
    setLanguage("English");
    switchToEnglish();
}

function ToggleLanguageTamil() {
    setLanguage("Tamil");
    switchToTamil();
}

function switchToSinhala() {

    convertContentIntoSinhalaAndEnglish(ForgotPasswordMobileNumberRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(signInForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordNewPasswordRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(SignUpMobileNumberRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(SignUpOtpRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ProfileAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordOtpRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(Profile, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ProfileUpdateForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandDetails, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandUpdateForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropDetails, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropUpdateForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(StatusAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(Header, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandAll, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropAll, "Sinhala");
    convertContentIntoSinhalaAndEnglish(Error404, "Sinhala");
    convertContentIntoSinhalaAndEnglish(Error500, "Sinhala");
}

function switchToEnglish() {

    convertContentIntoSinhalaAndEnglish(signInForm, "English");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordMobileNumberRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordNewPasswordRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(SignUpMobileNumberRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(SignUpOtpRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(ProfileAddForm, "English");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordOtpRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(Profile, "English");
    convertContentIntoSinhalaAndEnglish(ProfileUpdateForm, "English");
    convertContentIntoSinhalaAndEnglish(LandAddForm, "English");
    convertContentIntoSinhalaAndEnglish(LandDetails, "English");
    convertContentIntoSinhalaAndEnglish(LandUpdateForm, "English");
    convertContentIntoSinhalaAndEnglish(CropAddForm, "English");
    convertContentIntoSinhalaAndEnglish(CropDetails, "English");
    convertContentIntoSinhalaAndEnglish(CropUpdateForm, "English");
    convertContentIntoSinhalaAndEnglish(StatusAddForm, "English");
    convertContentIntoSinhalaAndEnglish(Header, "English");
    convertContentIntoSinhalaAndEnglish(LandAll, "English");
    convertContentIntoSinhalaAndEnglish(CropAll, "English");
    convertContentIntoSinhalaAndEnglish(Error404, "English");
    convertContentIntoSinhalaAndEnglish(Error500, "English");
}

function switchToTamil() {

    convertContentIntoSinhalaAndEnglish(signInForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordMobileNumberRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordNewPasswordRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(SignUpMobileNumberRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(SignUpOtpRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ProfileAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordOtpRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(Profile, "Tamil");
    convertContentIntoSinhalaAndEnglish(ProfileUpdateForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandDetails, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandUpdateForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropDetails, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropUpdateForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(StatusAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(Header, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandAll, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropAll, "Tamil");
    convertContentIntoSinhalaAndEnglish(Error404, "Tamil");
    convertContentIntoSinhalaAndEnglish(Error500, "Tamil");

}


function convertContentIntoSinhalaAndEnglish(contentArray, language) {
    var languageIndex = 0;
    //languageIndex = (language === "English" ? "1" : "2");

    switch (language) {
        case "English":
            languageIndex = 1;
            break;
        case "Sinhala":
            languageIndex = 2;
            break;
        case "Tamil":
            languageIndex = 3;
            break;
        default:
        // code block
    }
    for (var i = 0; i < contentArray.length; i++) {
        if (document.getElementById(contentArray[i][0]) == null) {

        } else {
            document.getElementById(contentArray[i][0]).innerHTML = contentArray[i][languageIndex];
            document.getElementById(contentArray[i][0]).placeholder = contentArray[i][languageIndex];
            // document.getElementsByName(contentArray[i][0])[0].innerHTML = contentArray[i][languageIndex];

        }

    }
}

let signInForm = [
    ["checkSignInRememberMe", " Remember Me ", "  මතක තබා ගන්න", "நினைவில் வை"],
    ["lblSputum", "Sign In", "පුරන්න", "உள்நுழை"],
    ["lblSignInPassword", "Password", "මුරපදය", "கடவுச்சொல்"],
    ["lblSignInMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["btnSignInSignIn", "Sign In ", "පුරන්න", "உள்நுழை"],
    ["btnSignIpSignUp", "Sign Up ", "ලියාපදිංචි වන්න", "பதிவுபெறு"],
    ["lblSignInForgotPassword", "Forgot Password? ", "මුරපදය අමතක වුණා ද?", "கடவுச்சொல்லை மறந்துவிட்டீரா"],
    ["lblSputumAddress", "View As A Guest ", "අමුත්තෙකු ලෙස බලන්න", "விருந்தினராகக் காண்க"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsUserDisabledTrue", "User disabled.", "පරිශීලක අක්‍රීය කර ඇත.", "பயனர் முடக்கப்பட்டுள்ளது."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyIsUserFoundFalse", "Invalid username or password.", "අවලංගු පරිශීලක නාමයක් හෝ මුරපදයක්.", "தவறான பயனர்பெயர் அல்லது கடவுச்சொல்."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"],

    ["ModalError03Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError03BodyIsUserTypeInvalidTrue", "Invalid user type. Only farmers can sign in.", "අවලංගු පරිශීලක වර්ගයකි. ඇතුළු විය හැක්කේ ගොවීන්ට පමණි.", "தவறான பயனர் வகை. விவசாயிகள் மட்டுமே நுழைய முடியும்."],
    ["ModalError03Footer", "Okay", "හරි", "சரி"],

    ["ModalSuccess01Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess01BodyIsUserSignedUpTrue", "User added, sign in here.", "පරිශීලක එකතු කරන ලදි, මෙහි පුරනය වන්න.", "பயனர் சேர்க்கப்பட்டது, இங்கே உள்நுழை."],
    ["ModalSuccess01Footer", "Okay", "හරි", "சரி"],

    ["ModalSuccess02Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess02BodyIsPasswordUpdatedTrue", "Password updated, sign in here.", "මුරපදය යාවත්කාලීන කරන ලදි, මෙහි පුරනය වන්න.", "கடவுச்சொல் புதுப்பிக்கப்பட்டது, இங்கே உள்நுழை."],
    ["ModalSuccess02Footer", "Okay", "හරි", "சரி"]
];

let ForgotPasswordMobileNumberRegisterForm = [
    //headings
    ["lblForgotPasswordForgotPassword", "Forgot Password", "මුරපදය අමතක වුණා ද", "கடவுச்சொல்லை மறந்துவிட்டீரா"],

    //labels
    ["lblForgotPasswordMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["txtForgotPasswordMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],

    //buttons
    ["btnForgotPasswordNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnForgotPasswordSignIn", "Sign In", "පුරන්න", "உள்நுழை"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyOtpSentStatusInvalid", "Given mobile number is not found in the system.", "ලබා දී ඇති ජංගම දුරකථන අංකය පද්ධතිය තුළ නොමැත.", "கொடுக்கப்பட்ட மொபைல் எண் கணினியில் இல்லை."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyOtpSentStatusFalse", "OTP code sending failed, try again.", "OTP කේත යැවීම අසාර්ථක විය, නැවත උත්සාහ කරන්න.", "OTP குறியீடு அனுப்புவது தோல்வியுற்றது, மீண்டும் முயற்சிக்க."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"]
];

let ForgotPasswordNewPasswordRegisterForm = [
    //headings
    ["lblForgotPasswordNewPasswordForgotPassword", "Forgot Password", "මුරපදය අමතක වුණා ද", "கடவுச்சொல்லை மறந்துவிட்டீரா"],

    //labels , inputfields
    ["lblForgotPasswordNewPassword", "New Password", "නව මුරපදය", "புதிய கடவுச்சொல்"],
    ["txtForgotPasswordNewPassword", "New Password", "නව මුරපදය", "புதிய கடவுச்சொல்"],
    ["lblForgotPasswordNewPasswordConfirm", "New Password Confirm", "නව මුරපදය තහවුරු කරන්න", "புதிய கடவுச்சொல் உறுதிப்படுத்த"],
    ["txtForgotPasswordNewPasswordConfirm", "New Password Confirm", "නව මුරපදය තහවුරු කරන්න", "புதிய கடவுச்சொல் உறுதிப்படுத்த"],

    //buttons
    ["btnForgotPasswordNewPasswordUpdate", "Update New Password", "නව මුරපදය යාවත්කාලීන කරන්න", "புதிய கடவுச்சொல்லைப் புதுப்பிக்க"],
    ["btnForgotPasswordNewPasswordSignIn", "Sign In", "පුරන්න", "உள்நுழை"]
];

let ForgotPasswordOtpRegisterForm = [
    //headings
    ["lblForgotPasswordOneTimePasswordForgotPassword", "Forgot Password", "මුරපදය අමතක වුණා ද", "கடவுச்சொல்லை மறந்துவிட்டீரா"],

    //labels , inputfields
    ["lblForgotPasswordOneTimePassword", "One Time Password", "එක් වරක් මුරපදය", "ஒரு முறை கடவுச்சொல்"],
    ["txtForgotPasswordOneTimePassword", "One Time Password", "එක් වරක් මුරපදය", "ஒரு முறை கடவுச்சொல்"],

    //buttons
    ["btnForgotPasswordOneTimePasswordNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnForgotPasswordOneTimePasswordSignIn", "Sign In", "පුරන්න", "உள்நுழை"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsOtpVerifiedFalse", "Incorrect OTP code, try again.", "OTP කේතය වැරදියි, නැවත උත්සාහ කරන්න.", "தவறான OTP குறியீடு, மீண்டும் முயற்சிக்க."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"]
];

let SignUpMobileNumberRegisterForm = [
    //headings
    ["lblSignUpMobileNumberSignUp", "Sign Up ", "ලියාපදිංචි වන්න", "பதிவுபெறு"],

    //labels , inputfields
    ["lblSignUpMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["txtSignUpMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],

    //buttons
    ["btnSignUpNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnSignUpSignIn", "Sign In", "පුරන්න", "உள்நுழை"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyOtpSentStatusPresent", "Contact number already present, try again.", "දුරකථන අංකය දැනටමත් තිබේ, නැවත උත්සාහ කරන්න.", "தொலைபேசி எண் ஏற்கனவே உள்ளது, மீண்டும் முயற்சிக்க."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyOtpSentStatusFalse", "OTP code sending failed, try again.", "OTP කේත යැවීම අසාර්ථක විය, නැවත උත්සාහ කරන්න.", "OTP குறியீடு அனுப்புவது தோல்வியுற்றது, மீண்டும் முயற்சிக்க."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"]
];

let SignUpOtpRegisterForm = [
    //headings
    ["lblSignUpOTPRegisterSignUp", "Sign Up", "ලියාපදිංචි වන්න", "பதிவுபெறு"],

    //labels , inputfields
    ["lblSignUpOneTimePassword", "One Time Password", "එක් වරක් මුරපදය", "ஒரு முறை கடவுச்சொல்"],
    ["txtSignUpOneTimePassword", "One Time Password", "එක් වරක් මුරපදය", "ஒரு முறை கடவுச்சொல்"],
    ["txtSignUpMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],

    //buttons
    ["btnSignUpOTPNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnSignUpOTPSignIn", "Sign In", "පුරන්න", "உள்நுழை"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsOtpVerifiedFalse", "Incorrect OTP code, try again.", "OTP කේතය වැරදියි, නැවත උත්සාහ කරන්න.", "தவறான OTP குறியீடு, மீண்டும் முயற்சிக்க."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"]
];

let ProfileAddForm = [
    //headings
    ["lblSignUp", "Sign Up ", "ලියාපදිංචි වන්න", "பதிவுபெறு"],

    //labels , input-fields
    ["txtSignUpFirstName", "First Name", "මුල් නම", "முதல் பெயர்"],
    ["txtSignUpLastName", "Last Name", "අවසන් නම", "கடைசி பெயர்"],
    ["txtSignUpNic", "NIC", "ජාතික හැඳුනුම්පත", "என்.ஐ.சி."],
    ["txtSignUpPassword", "Password", "මුරපදය", "கடவுச்சொல்"],
    ["txtSignUpPasswordConfirm", "Password Confirm", "මුරපදය තහවුරු කරන්න", "புதிய கடவுச்சொல் உறுதிப்படுத்த"],
    ["checkAgreeToTerms", "I Agree To Terms And Conditions", " මම කොන්දේසි වලට එකඟ වෙමි", "நான் விதிமுறைகளையும் நிபந்தனைகளையும் ஒப்புக்கொள்கிறேன்"],

    //buttons
    ["btnSignUpSignUp", "Sign Up ", "ලියාපදිංචි වන්න", "பதிவுபெறு"],
    ["btnSignUpSignIn", "Sign In", "පුරන්න", "உள்நுழை"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyNicPresentTrue", "Your NIC number already present.", "ජාතික හැඳුනුම්පත් අංකය දැනටමත් තිබේ.", "உங்கள் NIC எண் ஏற்கனவே உள்ளது."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyNicValidFalse", "Invalid NIC number, try again.", "අවලංගු ජාතික හැඳුනුම්පත් අංකයක්, නැවත උත්සාහ කරන්න.", "தவறான என்ஐசி எண், மீண்டும் முயற்சிக்க."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"]
];

let Profile = [
    ["pProfileLands", "Lands", "ඉඩම්", "நிலங்களும்"],
    ["pProfileCrops", "Crops", "බෝග", "பயிர்கள்"],
    ["pProfileDays", "Days", "දින", "நாட்களில்"],

    //headings
    ["lblProfileAllLands", "All Lands", "සියලුම ඉඩම්", "அனைத்து நிலங்களும்"],
    ["lblProfileProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],

    //Links
    ["lblProfileAddANewLand", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்க"],
    ["lblProfileUpdateProfile", "Update Profile", "පැතිකඩ යාවත්කාලීන කරන්න", "சுயவிவரத்தைப் புதுப்பிக்க"],
    ["lblProfileAddANewLand2", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்க"],
    ["lblProfileNoLandsToShow", "No Lands To Show", "පෙන්වීමට ඉඩම් නොමැත", "காட்ட நிலங்கள் இல்லை"]
];

let ProfileUpdateForm = [
    //headings
    ["lblProfileUpdateProfileUpdate", "Profile Update", "පැතිකඩ යාවත්කාලීන කිරීම", "சுயவிவர புதுப்பிப்பு"],

    //links
    ["lblProfileUpdateBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblProfileUpdateBreadCrumbsProfileUpdate", "Profile Update", "පැතිකඩ යාවත්කාලීන කිරීම", " சுயவிவர புதுப்பிப்பு"],
    ["lblProfileUpdateFirstName", "First Name", "මුල් නම", "முதல் பெயர்"],
    ["lblProfileUpdateLastName", "Last Name", "අවසන් නම", "கடைசி பெயர்"],
    ["lblProfileUpdateMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["lblProfileUpdateAddress", "Address", "ලිපිනය", "முகவரி"],
    ["lblProfileUpdateNIC", "NIC", "ජාතික හැඳුනුම්පත", "என்.ஐ.சி."],
    ["lblProfileUpdateDateOfBirth", "Date Of Birth", "උපන්දිනය", "பிறந்த தேதி"],
    ["lblProfileUpdateGender", "Gender", "ස්ත්රී පුරුෂ භාවය", "பாலினம்"],
    ["lblProfileUpdatePassword", "Password", "මුරපදය", "கடவுச்சொல்"],
    ["lblProfileUpdatePasswordConfirm", "Password Confirm", "මුරපදය තහවුරු කරන්න", "புதிய கடவுச்சொல் உறுதிப்படுத்த"],
    ["lblProfileUpdateProvince", "Province", "පළාත", "மாகாணம்"],
    ["lblProfileUpdateDistrict", "District", "දිස්ත්‍රික්කය", "மாவட்டம்"],
    ["lblProfileUpdateGNDivision", "GN Division", "ග්‍රාම නිලධාරී කොට්ඨාශය", "ஜி.என் பிரிவு"],
    ["lblProfileUpdateFarmerPhoto", "Farmer's Photo", "ගොවියාගේ ඡායාරූපය", "விவசாயியின் புகைப்படம்"],
    ["lblProfileUpdateFarmerPhotoSaved", "Saved Farmer's Photo", "ගොවියාගේ ඡායාරූපය සුරකින ලදි", "விவசாயியின் புகைப்படம் சேமிக்கப்பட்டது"],
    ["lblProfileUpdateProfileChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],

    // ["btnProfileUpdateUpdateProfile", "Update Profile", "පැතිකඩ යාවත්කාලීන කරන්න", "சுயவிவரத்தைப் புதுப்பிக்க"],
    ["btnProfileUpdateUpdateProfile", "Update", "යාවත්කාලීන කරන්න", "புதுப்பிப்பு"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyNicPresentTrue", "Your NIC number already present.", "ජාතික හැඳුනුම්පත් අංකය දැනටමත් තිබේ.", "உங்கள் NIC எண் ஏற்கனவே உள்ளது."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyNicValidFalse", "Invalid NIC number, try again.", "අවලංගු ජාතික හැඳුනුම්පත් අංකයක්, නැවත උත්සාහ කරන්න.", "தவறான என்ஐசி எண், மீண்டும் முயற்சிக்க."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"],

    ["ModalError03Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError03BodyIsProfileUpdatedFalse", "Profile update failed, try again.", "පැතිකඩ යාවත්කාලීන කිරීම අසාර්ථක විය, නැවත උත්සාහ කරන්න.", "சுயவிவர புதுப்பிப்பு தோல்வியுற்றது, மீண்டும் முயற்சிக்க."],
    ["ModalError03Footer", "Okay", "හරි", "சரி"],

    ["ModalSuccess01Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess01BodyIsProfileUpdatedTrue", "Profile updated.", "පැතිකඩ යාවත්කාලීන කරන ලදි.", "சுயவிவரம் புதுப்பிக்கப்பட்டது."],
    ["ModalSuccess01Footer", "Okay", "හරි", "சரி"]
];

let LandAddForm = [
    //headings
    ["lblLandAddLandAdd", "Land Add", "ඉඩම් එක් කිරීම", "நிலம் சேர்"],

    //labels
    ["lblLandAddLandName", "Land Name", "ඉඩමේ නම", "நிலத்தின் பெயர்"],
    ["lblLandAddLandAddress", "Land Address", "ඉඩමේ ලිපිනය", "நிலத்தின் முகவரி"],
    ["lblLandAddProvince", "Province", "පළාත", "மாகாணம்"],
    ["lblLandAddDistrict", "District", "දිස්ත්‍රික්කය", "மாவட்டம்"],
    ["lblLandAddGNDivision", "GN Division", "ග්‍රාම නිලධාරී කොට්ඨාශය", "கிராம நிலாதாரி பிரிவு"],
    ["lblLandAddLandType", "Land Type", "ඉඞම් වර්ගය", "நிலத்தின் வகை"],
    ["lblLandAddOwnershipState", "Ownership State", "හිමිකාරීත්වය", "உரிமையாளர்"],
    ["lblLandAddCultivationStatus", "Cultivated Status", "වගා කළ තත්වය", "பயிரிடப்பட்ட நிலை"],
    ["lblLandAddLandExtentAmount", "Land Extent Amount", "ඉඩම් ප්‍රමාණය", "நில விரிவாக்க தொகை"],
    ["lblLandAddLandExtentMeasurement", "Land Extent Measurement", "ඉඩම් ප්‍රමාණය මැනීම", "நில விரிவாக்க அளவீட்டு"],
    ["lblLandAddLandPhoto", "Land's Photo", "ඉඩමේ ඡායාරූපය", "நிலத்தின் புகைப்படம்"],
    ["lblLandAddLandPhotoSelected", "Selected Land's Photo", "තෝරාගත් ඉඩමේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட நிலத்தின் புகைப்படம்"],

    //Input
    ["txtLandAddLandName", "Land Name", "ඉඩමේ නම", "நிலத்தின் பெயர்"],
    ["txtLandAddLandAddress", "Land Address", "ඉඩමේ ලිපිනය", "நிலத்தின் முகவரி"],
    ["txtLandAddLandExtentAmount", "Land Extent Amount", "ඉඩම් ප්‍රමාණය", "நில விரிவாக்க தொகை"],
    ["lblLandAddLandExtentMeasurement", "Land Extent Measurement", "ඉඩම් ප්‍රමාණය මැනීම", "நில விரிவாக்க அளவீட்டு"],
    ["lblLandAddLandPhoto", "Land's Photo", "ඉඩමේ ඡායාරූපය", "நிலத்தின் புகைப்படம்"],
    ["lblLandAddLandPhotoSelected", "Selected Land's Photo", "තෝරාගත් ඉඩමේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட நிலத்தின் புகைப்படம்"],
    ["lblLandAddLandChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தெரிக"],

    //buttons
    // ["btnLandAddAddNewLand", "Add A New land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்க"],
    ["btnLandAddAddNewLand", "Save", "එකතු කරන්න", "கூட்டு"],

    //links
    ["lblLandAddBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandAddBreadCrumbsAllLands", "All Lands", "සියලුම ඉඩම්", "அனைத்து நிலமும்"],
    ["lblLandAddBreadCrumbsAddLands", "Land Add", "ඉඩම් එක් කිරීම", "நிலங்களை சேர்த்தல்"],

    //radio buttons
    ["lblLandAddLandExtentMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblLandAddLandExtentMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblLandAddLandExtentMeasurementPerches", "Perches", "පර්චස්", "பெர்ச்"],
    ["lblLandAddLandExtentMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblLandAddLandTypeDryLand", "Dry Land", "වියළි ඉඩම", "வறண்ட நிலம்"],
    ["lblLandAddLandTypeWetLand", "Wet Land", "තෙත් ඉඩම", "ஈரமான நிலம்"],
    ["lblLandAddLandOwnershipStateOwned", "Owned", "අයිති", "உரிமை உள்ளது"],
    ["lblLandAddLandOwnershipStateRented", "Rented", "කුලියට ගත්", "வாடகைக்கு"],

    //dropdwonOptions
    ["provinceDropDownOptionLandAddWestern", "Western", "බස්නාහිර පළාත", "மேற்கு மாகாணம்"],
    ["provinceDropDownOptionLandAddCentral", "Central", "මධ්‍යම පළාත", "மத்திய மாகாணம்"],
    ["provinceDropDownOptionLandAddSouthern", "Southern", "දකුණු පළාත", "தெற்கு மாகாணம்"],
    ["provinceDropDownOptionLandAddUva", "Uva", "ඌව පළාත", "ஊவா மாகாணம்"],
    ["provinceDropDownOptionLandAddSabaragamuwa", "Sabaragamuwa", "සබරගමුව", "சபராகமுவ"],
    ["provinceDropDownOptionLandAddNorthWestern", "North Western", "වයඹ", "வடமேற்கு"],
    ["provinceDropDownOptionLandAddNorthCentral", "North Central", "උතුරු මැද", "வட மத்திய"],
    ["provinceDropDownOptionLandAddNorthern", "Northern", "උතුරු", "வடக்கு"],
    ["provinceDropDownOptionLandAddEastern", "Eastern", "නැගෙනහිර", "கிழக்கு"],

    /*    ["LandTypeDropDownOptionLandAddWetLand", "Wet Land", "තෙත් බිම", "ஈரமான நிலம்"],
        ["LandTypeDropDownOptionLandAddDryLand", "Dry Land", "වියළි බිම", "வறண்ட நிலம்"],
        ["OwnershipDropDownOptionLandAddRented", "Rented", "කුලියට ගත්", "வாடகைக்கு"],
        ["OwnershipDropDownOptionLandAddOwned", "Owned", "අයිති", "உரிமை உள்ளது"],*/

    /*["CultivatedStatusDropDownOptionLandAddNotCultivated", "Not Cultivated", "වගා නොකෙරේ", "பயிரிடப்படவில்லை"],
    ["CultivatedStatusDropDownOptionLandAddCultivated", "Cultivated", "වගා කර ඇත", "பயிரிடப்பட்டது"],
    ["ExtentMeasurementDropDownOptionLandAddSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["ExtentMeasurementDropDownOptionLandAddSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["ExtentMeasurementDropDownOptionLandAddPerches", "Perches", "පර්චස්", "பெர்ச்"],
    ["ExtentMeasurementDropDownOptionLandAddAcres", "Acres", "අක්කර", "ஏக்கர்"],*/

    //radio-image's labels
    ["lblLandAddLandExtentMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblLandAddLandExtentMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblLandAddLandExtentMeasurementPerches", "Perches", "පර්චස්", "பேர்ச்சஸ்"],
    ["lblLandAddLandExtentMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblLandAddLandTypeDryLand", "Dry Land", "ගොඩ ඉඩම", "வறண்ட நிலம்"],
    ["lblLandAddLandTypeWetLand", "Wet Land", "මඩ ඉඩම", "ஈரமான நிலம்"],
    ["lblLandAddLandTypeGreenhouse", "Greenhouse", "හරිතාගාර", "கிரீன்ஹவுஸ்"],
    ["lblLandAddLandOwnershipStatusOwned", "Owned", "අයිති", "உரிமை உள்ளது"],
    ["lblLandAddLandOwnershipStatusRented", "Rented", "කුලියට ගත්", "வாடகைக்கு விடப்பட்டது"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsLandNameExistsInDatabaseTrue", "Given land name is already present, try again.", "ලබා දී ඇති ඉඩම් නම දැනටමත් තිබේ, නැවත උත්සාහ කරන්න.", "கொடுக்கப்பட்ட நிலத்தின் பெயர் ஏற்கனவே உள்ளது, மீண்டும் முயற்சிக்க."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyIsLandSavedFalse", "Land saving failed.", "ඉඩම් එකතු කිරීම අසාර්ථක විය.", "நிலம் சேர்ப்பது தோல்வியடைந்தது."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"],
];

let LandDetails = [
    //links
    ["lblLandDetailsBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandDetailsBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblLandDetailsBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblLandDetailsUpdateLandDetails", "Update Land Details", "ඉඩම් විස්තර යාවත්කාලීන කරන්න", "நில விவரங்களை புதுப்பிக்க"],
    ["lblLandDetailsAddNewCrop", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்க"],
    ["lblLandDetailsAddNewCrop2", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்க"],
    ["lblLandDetailsAllCrops", "All Crops", "සියලුම බෝග", "அனைத்து பயிர்களும்"],
    ["lblLandDetailsNoCropsToShow", "No Crops To Show", "පෙන්වීමට බෝග නැත", "காட்ட பயிர்கள் இல்லை"],

    //headings
    ["lblLandDetailsBreadCrumbsLandDetailsHeading", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblLandAddMoreDetails", "More Details", "වැඩිපුර විස්තර", "கூடுதல் தகவல்கள்"],

    ["pLandDetailsCultivation", "Cultivation", "වගාව", "சாகுபடி"],
    ["pLandDetailsActivities", "Activities", "කටයුතු", "செயல்பாடுகள்"],

    //notifications
    ["ModalSuccess01Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess01BodyIsCropSavedTrue", "Crop added.", "බෝග එකතු කරන ලදි.", "பயிர் சேர்க்கப்பட்டது."],
    ["ModalSuccess01Footer", "Okay", "හරි", "சரி"]
];

let LandUpdateForm = [
    //labels
    ["lblLandUpdateLandName", "Land Name", "ඉඩම් නම", "நிலத்தின் பெயர்"],
    ["lblLandUpdateLandAddress", "Land Address", "ඉඩම් ලිපිනය", "நிலத்தின் முகவரி"],
    ["lblLandUpdateProvince", "Province", "පළාත", "மாகாணம்"],
    ["lblLandUpdateDistrict", "District", "දිස්ත්‍රික්කය", "மாவட்டம்"],
    ["lblLandUpdateGNDivision", "GN Division", "ග්‍රාම නිලධාරී කොට්ඨාශය", "கிராம நிலாதாரி பிரிவு"],
    ["lblLandUpdateLandType", "Land Type", "ඉඞම් වර්ගය", "நிலத்தின் வகை"],
    ["lblLandUpdateOwnershipState", "Ownership State", "හිමිකාරීත්වය", "உரிமையாளர்"],
    ["lblLandUpdateCultivationStatus", "Cultivated Status", "වගා කළ තත්වය", "பயிரிடப்பட்ட நிலை"],
    ["lblLandUpdateLandExtentAmount", "Land Extent Amount", "ඉඩම් ප්‍රමාණය", "நில விரிவாக்க தொகை"],
    ["lblLandUpdateLandExtentMeasurement", "Land Extent Measurement", "ඉඩම් ප්‍රමාණය මැනීම", "நில விரிவாக்க அளவீட்டு"],
    ["lblLandUpdateLandPhoto", "Land's Photo", "ඉඩම් ඡායාරූපය", "நிலத்தின் புகைப்படம்"],
    ["lblLandUpdateLandPhotoSaved", "Land's Photo", "තෝරාගත් ඉඩම් ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட நிலத்தின் புகைப்படம்"],
    ["lblLandUpdateLandChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],

    //Input
    ["txtLandUpdateLandAddress", "Land Address", "ඉඩම් ලිපිනය", "நிலத்தின் முகவரி"],

    //button
    // ["btnLandUpdateUpdateLand", "Update Land", "ඉඩම යාවත්කාලීන කරන්න", "நிலத்தைப் புதுப்பிக்க"],
    ["btnLandUpdateUpdateLand", "Update", "යාවත්කාලීන කරන්න", "புதுப்பிப்பு"],

    //links
    ["lblLandUpdateBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandUpdateBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblLandUpdateBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblLandUpdateBreadCrumbsLandUpdate", "Land Update", "ඉඩම යාවත්කාලීන කිරීම", "நில புதுப்பிப்பு"],

    //headings
    ["lblLandUpdateBreadCrumbsLandUpdateHeading", "Land Update", "ඉඩම යාවත්කාලීන කිරීම", "நில புதுப்பிப்பு"],

    //radio-image's labels
    ["lblLandUpdateLandExtentMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblLandUpdateLandExtentMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblLandUpdateLandExtentMeasurementPerches", "Perches", "පර්චස්", "பேர்ச்சஸ்"],
    ["lblLandUpdateLandExtentMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblLandUpdateLandTypeDryLand", "Dry Land", "ගොඩ ඉඩම", "வறண்ட நிலம்"],
    ["lblLandUpdateLandTypeWetLand", "Wet Land", "මඩ ඉඩම", "ஈரமான நிலம்"],
    ["lblLandUpdateLandTypeGreenhouse", "Greenhouse", "හරිතාගාර", "கிரீன்ஹவுஸ்"],
    ["lblLandUpdateLandOwnershipStatusOwned", "Owned", "අයිති", "உரிமை உள்ளது"],
    ["lblLandUpdateLandOwnershipStatusRented", "Rented", "කුලියට ගත්", "வாடகைக்கு விடப்பட்டது"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsLandNameExistsInDatabaseTrue", "Given land name is already present, try again.", "ලබා දී ඇති ඉඩම් නම දැනටමත් තිබේ, නැවත උත්සාහ කරන්න.", "கொடுக்கப்பட்ட நிலத்தின் பெயர் ஏற்கனவே உள்ளது, மீண்டும் முயற்சிக்க."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyIsLandUpdatedFalse", "Land updating failed.", "ඉඩම යාවත්කාලීන කිරීම අසාර්ථක විය.", "நிலம் புதுப்பித்தல் தோல்வியுற்றது."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"],

    ["ModalSuccess01Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess01BodyIsLandUpdatedTrue", "Land updated.", "ඉඩම් යාවත්කාලීන කරන ලදි.", "நிலம் புதுப்பிக்கப்பட்டது."],
    ["ModalSuccess01Footer", "Okay", "හරි", "சரி"]
];

let CropAddForm = [
    //links
    ["lblCropAddBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblCropAddBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblCropAddBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblCropAddBreadCrumbsCropAdd", "Crop Add", "බෝගය එක් කිරීම", "பயிர் சேர்த்தல்"],

    //headings
    ["lblCropAddBreadCrumbsCropAddHeading", "Crop Add", "බෝගය එක් කිරීම", "நில புதுப்பிப்பு"],

    //labels
    ["lblCropAddCropType", "Crop Type", "බෝග වර්ගය", "பயிர் வகை"],
    ["lblCropAddCropExtentAmount", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["lblCropAddCropExtentMeasurement", "Cultivated Land Area - Measurement", "වගා බිම් ප්‍රමාණය - ඒකකය", "பயிரிடப்பட்ட நிலப்பரப்பு - அலகு"],
    ["lblCropAddPlotSizeMeasurement", "Plot Size - Measurement", "පාත්ති ප්‍රමාණය - මැනීම", "அடுக்குகள் அளவு - அளவீடு"],
    ["lblCropAddPlotCount", "Plots:", "පාත්ති:", "அடுக்குகள்:"],
    ["lblCropAddPlotUnit", "Unit:", "ඒකක:", "அலகு:"],
    ["lblCropAddNurseryGrown", "Nursery Grown", "තවාන් වැඩී", "நர்சரி வளர்ந்தது"],
    ["lblCropAddNurseryGrownNumber", "Nursery Grown - Number", "තවාන් වැඩුණු - අංකය", "நர்சரி வளர்ந்தது - எண்"],
    ["lblCropAddNurseryGrownMeasurement", "Nursery Grown - Measurement", "තවාන් වැඩීම - මැනීම", "நர்சரி வளர்ந்தது - அளவீட்டு"],
    ["lblCropAddCropPlantedDate", "Planted Date", "රෝපණය කළ දිනය", "நடவு தேதி"],
    ["lblCropAddCropPhoto", "Crop's Photo", "බෝගයේ  ඡායාරූපය", "பயிரின் புகைப்படம்"],
    ["lblCropAddCropPhotoSelected", "Selected Crop's Photo", "තෝරාගත් බෝගයේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட பயிரின் புகைப்படம்"],
    ["lblCropAddChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],
    ["lblCropAddMoreDetails", "More Details", "වැඩිපුර විස්තර", "கூடுதல் தகவல்கள்"],

    //Input
    ["txtCropAddCropExtentNumber", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["txtCropAddNurseryGrownNumber", "Nursery Grown - Number", "තවාන් වැඩුණු - අංකය", "நர்சரி வளர்ந்தது - எண்"],
    ["txtCropAddPlotLength", "Length", "දිග", "நீளம்"],
    ["txtCropAddPlotBreadth", "Breadth", "පළල", "அகலம்"],
    ["txtCropAddPlotCount", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["cmbCropAddPlotUnitFeet", "Feet", "අඩි", "அடி"],
    ["cmbCropAddPlotUnitMetres", "Metres", "මීටර්", "மீட்டர்"],

    //button
    // ["btnCropAddAddNewCrop", "Add New Crop", "නව බෝගය එක් කරන්න", "புதிய பயிர் சேர்க்க"],
    ["btnCropAddAddNewCrop", "Save", "එකතු කරන්න", "கூட்டு"],

    //radio-buttons
    ["NurseryGrownDropDownOptionCropAddYes", "Yes", "ඔව්", "ஆம்"],
    ["NurseryGrownDropDownOptionCropAddNo", "No", "නොමැත", "இல்லை"],

    //radio-image's labels
    ["lblCropAddCropExtentMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblCropAddCropExtentMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblCropAddCropExtentMeasurementPerches", "Perches", "පර්චස්", "பேர்ச்சஸ்"],
    ["lblCropAddCropExtentMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblCropAddCropExtentMeasurementPlots", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["lblCropAddCropNurseryGrownMeasurementDays", "Days", "දින", "நாட்களில்"],
    ["lblCropAddCropNurseryGrownMeasurementWeeks", "Weeks", "සති", "வாரங்கள்"],
    ["lblCropAddCropNurseryGrownMeasurementMonths", "Months", "මාස", "மாதங்கள்"],

    //carousel labels
    ["lblCropCarouselOnion", "Onion", "ලූනු", "வெங்காயம்"],
    ["lblCropCarouselBanana", "Banana", "කෙසෙල්", "வாழை"],
    ["lblCropCarouselBeans", "Beans", "බෝංචි", "பீன்ஸ்"],
    ["lblCropCarouselCabbage", "Cabbage", "ගෝවා", "முட்டைக்கோஸ்"],
    ["lblCropCarouselCarrot", "Carrot", "කැරට්", "கேரட்"],
    ["lblCropCarouselGreenChili", "Green Chili", "අමු මිරිස්", "பச்சை மிளகாய்"],
    ["lblCropCarouselLeeks", "Leeks", "ලීක්ස්", "லீக்ஸ்"],
    ["lblCropCarouselLongBeans", "Long Beans", "දිගු බෝංචි", "நீண்ட பீன்ஸ்"],
    ["lblCropCarouselOkra", "Okra", "බණ්ඩක්කා", "ஓக்ரா"],
    ["lblCropCarouselPapaya", "Papaya", "පැපොල්", "பப்பாளி"],
    ["lblCropCarouselTomato", "Tomato", "තක්කාලි", "தக்காளி"],
    ["lblCropCarouselTurmeric", "Turmeric", "කහ", "மஞ்சள்"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsCropSavedFalse", "Crop adding failed.", "බෝග එකතු කිරීම අසාර්ථක විය.", "பயிர் சேர்ப்பது தோல்வியுற்றது."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyIsLandAreaInvalidTrue", "Cannot add the crop with given land area.", "ලබා දී ඇති භූමි ප්‍රමාණය සමඟ බෝගය එකතු කළ නොහැක.", "கொடுக்கப்பட்ட நிலப்பரப்புடன் பயிர் சேர்க்க முடியாது."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"],

    ["ModalInfoLoaderTitle", "Processing", "සැකසෙමින් පවතී", "செயலாக்கம்"],
    ["ModalInfoLoaderBody", "Please wait.", "කරුණාකර රැඳී සිටින්න.", "தயவுசெய்து காத்திரு."]
];

let CropDetails = [
    //links
    ["lblCropDetailsBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lbCropDetailsBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblCropDetailsBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblCropDetailsCropDetails", "Crop Details", "බෝග විස්තර", "பயிர் விவரம்"],

    ["lblCropDetailsUpdateCropDetails", "Update Crop Details", "බෝග විස්තර යාවත්කාලීන කරන්න", "பயிர் விவரங்களை புதுப்பிக்க"],
    ["lblCropDetailsAddNewStatus", "Add A New Progress", "නව ප්‍රගතියක් එක් කරන්න", "புதிய சூழ்நிலையைச் சேர்க்க"],

    //headings
    ["lblCropDetailsBreadCrumbsCropDetailsHeading", "Crop Details", "බෝග විස්තර", "பயிர் விவரம்"],
    ["lblCropDetailsAllStatusHeading", "All Progresses", "සියලුම ප්‍රගතින්", "அனைத்து நிலை"],

    ["pCropDetailsActivities", "Progresses", "ප්‍රගතින්", "செயல்பாடுகள்"],

    ["lblCropDetailsAddNewStatus2", "Add A New Progress", "නව ප්‍රගතියක් එක් කරන්න", "புதிய சூழ்நிலையைச் சேர்க்க"],
    ["lblCropDetailsNoStatusesToShow", "No Progresses To Show", "පෙන්වීමට ප්‍රගතින් නොමැත", "காண்பிக்க நிலைகள் இல்லை"],

    ["ModalSuccess01Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess01BodyIsStatusSavedTrue", "Progress added.", "ප්‍රගතිය එක් කරන ලදි.", "முன்னேற்றம் சேர்க்கப்பட்டது."],
    ["ModalSuccess01Footer", "Okay", "හරි", "சரி"]
];

let CropUpdateForm = [
    //links
    ["lblCropUpdateBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblCropUpdateBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblCropUpdateBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblCropUpdateBreadCrumbsCropDetails", "Crop Details", "බෝග විස්තර", "பயிர் விவரம்"],
    ["lblCropUpdateBreadCrumbsUpdate", "Crop Update", "බෝගය යාවත්කාලීන කිරීම", "பயிர் புதுப்பிப்பு"],

    //headings
    ["lblCropUpdateBreadCrumbsCropUpdateHeading", "Crop Update", "බෝගය යාවත්කාලීන කිරීම", "பயிர் புதுப்பிப்பு"],

    //labels
    ["lblCropUpdateCropType", "Crop Type", "බෝග වර්ගය", "பயிர் வகை"],
    ["lblCropUpdateCropExtentAmount", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["lblCropUpdateCropExtentMeasurement", "Cultivated Land Area - Unit", "වගා බිම් ප්‍රමාණය - ඒකකය", "பயிரிடப்பட்ட நிலப்பரப்பு - அலகு"],
    ["lblCropUpdatePlotSizeMeasurement", "Plot Size - Measurement", "පාත්ති ප්‍රමාණය - මැනීම", "அடுக்குகள் அளவு - அளவீடு"],
    ["lblCropUpdatePlotCount", "Plots:", "පාත්ති:", "அடுக்குகள்:"],
    ["lblCropUpdatePlotUnit", "Unit:", "ඒකක:", "அலகு:"],
    ["lblCropUpdateNurseryGrown", "Nursery Grown", "තවාන් වැඩී", "நர்சரி வளர்ந்தது"],
    ["lblCropUpdateNurseryGrownNumber", "Nursery Grown - Number", "තවාන් වැඩුණු - අංකය", "நர்சரி வளர்ந்தது - எண்"],
    ["lblCropUpdateNurseryGrownMeasurement", "Nursery Grown - Measurement", "තවාන් වැඩීම - මැනීම", "நர்சரி வளர்ந்தது - அளவீட்டு"],
    ["lblCropUpdateCropPlantedDate", "Planted Date", "රෝපණය කළ දිනය", "நடவு தேதி"],
    ["lblCropUpdateCropPhoto", "Crop's Photo", "බෝගයේ  ඡායාරූපය", "பயிரின் புகைப்படம்"],
    ["lblCropUpdateCropPhotoSelected", "Selected Crop's Photo", "තෝරාගත් බෝගයේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட பயிரின் புகைப்படம்"],
    ["lblCropUpdateChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்"],
    ["lblCropUpdateMoreDetails", "More Details", "වැඩිපුර විස්තර", "கூடுதல் தகவல்கள்"],

    //Input
    ["txtCropUpdateCultivationExtentAmount", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["txtCropUpdateNurseryGrownNumber", "Nursery Grown - Number", "තවාන් වැඩුණු - අංකය", "நர்சரி வளர்ந்தது - எண்"],
    ["txtCropUpdatePlotLength", "Length", "දිග", "நீளம்"],
    ["txtCropUpdatePlotBreadth", "Breadth", "පළල", "அகலம்"],
    ["txtCropUpdatePlotCount", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["cmbCropUpdatePlotUnitFeet", "Feet", "අඩි", "அடி"],
    ["cmbCropUpdatePlotUnitMetres", "Metres", "මීටර්", "மீட்டர்"],

    //buttons
    // ["btnCropUpdateUpdateCrop", "Update Crop", "බෝගය යාවත්කාලීන කරන්න", "பயிர் புதுப்பிக்க"],
    ["btnCropUpdateUpdateCrop", "Update", "යාවත්කාලීන කරන්න", "புதுப்பிப்பு"],

    //radio-image's labels
    ["lblCropUpdateCropExtentMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblCropUpdateCropExtentMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblCropUpdateCropExtentMeasurementPerches", "Perches", "පර්චස්", "பேர்ச்சஸ்"],
    ["lblCropUpdateCropExtentMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblCropUpdateCropExtentMeasurementPlots", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["lblCropUpdateCropNurseryGrownMeasurementDays", "Days", "දින", "நாட்களில்"],
    ["lblCropUpdateCropNurseryGrownMeasurementWeeks", "Weeks", "සති", "வாரங்கள்"],
    ["lblCropUpdateCropNurseryGrownMeasurementMonths", "Months", "මාස", "மாதங்கள்"],

    //carousel labels
    ["lblCropCarouselOnion", "Onion", "ලූනු", "வெங்காயம்"],
    ["lblCropCarouselBanana", "Banana", "කෙසෙල්", "வாழை"],
    ["lblCropCarouselBeans", "Beans", "බෝංචි", "பீன்ஸ்"],
    ["lblCropCarouselCabbage", "Cabbage", "ගෝවා", "முட்டைக்கோஸ்"],
    ["lblCropCarouselCarrot", "Carrot", "කැරට්", "கேரட்"],
    ["lblCropCarouselGreenChili", "Green Chili", "අමු මිරිස්", "பச்சை மிளகாய்"],
    ["lblCropCarouselLeeks", "Leeks", "ලීක්ස්", "லீக்ஸ்"],
    ["lblCropCarouselLongBeans", "Long Beans", "දිගු බෝංචි", "நீண்ட பீன்ஸ்"],
    ["lblCropCarouselOkra", "Okra", "බණ්ඩක්කා", "ஓக்ரா"],
    ["lblCropCarouselPapaya", "Papaya", "පැපොල්", "பப்பாளி"],
    ["lblCropCarouselTomato", "Tomato", "තක්කාලි", "தக்காளி"],
    ["lblCropCarouselTurmeric", "Turmeric", "කහ", "மஞ்சள்"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsCropUpdatedFalse", "Crop updating failed.", "බෝග යාවත්කාලීන කිරීම අසාර්ථක විය.", "பயிர் புதுப்பித்தல் தோல்வியுற்றது."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"],

    ["ModalError02Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError02BodyIsLandAreaInvalidTrue", "Cannot add the crop with given land area.", "ලබා දී ඇති භූමි ප්‍රමාණය සමඟ බෝගය එකතු කළ නොහැක.", "கொடுக்கப்பட்ட நிலப்பரப்புடன் பயிர் சேர்க்க முடியாது."],
    ["ModalError02Footer", "Okay", "හරි", "சரி"],

    ["ModalSuccess01Title", "Success!", "සාර්ථකයි!", "வெற்றி பெற்றது!"],
    ["ModalSuccess02BodyIsCropUpdatedTrue", "Crop updated.", "බෝග යාවත්කාලීන කරන ලදි.", "பயிர் புதுப்பிக்கப்பட்டது."],
    ["ModalSuccess01Footer", "Okay", "හරි", "சரி"]
];

let StatusAddForm = [
    //links
    ["lblStatusAddBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblStatusAddBreadCrumbsLands", "Lands", "ඉඩම්", "நிலம்"],
    ["lblStatusAddBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரம்"],
    ["lblStatusAddBreadCrumbsCropDetails", "Crop Details", "බෝග විස්තර", "பயிர் விவரம்"],
    ["lblStatusAddBreadCrumbsStatusAdd", "Progress Add", "නව ප්‍රගතියක් එක් කරන්න", "முன்னேற்றத்தைச் சேர்க்க"],

    //headings
    ["lblStatusAddBreadCrumbsStatusAddHeading", "Progress Add", "නව ප්‍රගතියක් එක් කරන්න", "முன்னேற்றத்தைச் சேர்க்க"],

    //labels
    ["lblStatusAddStatusType", "Progress", "ප්‍රගතිය", "நிலை"],
    ["lblStatusAddAddedNumber", "Amount", "ප්රමාණය", "தொகை"],
    ["lblStatusAddAddedMeasurement", "Measurement", "මිනුම්", "அளவீட்டு"],

    //carousel labels
    ["lblProgressCarouselWeeded", "Weeded", "වල් පැලෑටි ඉවත් කළා", "களை அகற்று"],
    ["lblProgressCarouselWatered", "Watered", "ජලය යෙදුවා", "பாய்ச்சப்பட்டது"],
    ["lblProgressCarouselAppliedFertilizer", "Applied Fertilizer", "පොහොර යෙදුවා", "பயன்படுத்தப்பட்ட உரம்"],
    ["lblProgressCarouselDamaged", "Damaged", "හානි විය", "சேதமடைந்தது"],
    ["lblProgressCarouselHarvested", "Harvested", "අස්වනු නෙලා ඇත", "அறுவடை செய்யப்பட்டது"],
    ["lblProgressCarouselPestControlled", "Pest Controlled", "පළිබෝධ පාලනය", "பூச்சி கட்டுப்பாடு"],

    //Inputs
    ["txtStatusAddAddedNumber", "Amount", "ප්රමාණය", "தொகை"],
    ["txtStatusAddWateredAmount", "Watered Amount", "වතුර දැමූ ප්‍රමාණය", "பாய்ச்சப்பட்ட தொகை"],
    ["txtStatusAddFertilizerAppliedAmount", "Applied Amount", "භාවිතා කළ ප්රමාණය", "விண்ணப்பித்த தொகை"],
    ["txtStatusAddDamagedAmount", "Damaged Amount", "හානියට පත් ප්‍රමාණය", "சேதமடைந்த அளவு"],
    ["txtStatusAddDamagedPlotSizeLength", "Length", "දිග", "நீளம்"],
    ["txtStatusAddDamagedPlotSizeBreadth", "Breadth", "පළල", "அகலம்"],
    ["txtStatusAddDamagedNoOfPlots", "Plots", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["txtStatusAddHarvestedAmount", "Harvested Amount", "අස්වනු ප්‍රමාණය", "அறுவடை செய்யப்பட்ட தொகை"],
    ["txtStatusAddHarvestedPlotSizeLength", "Length", "දිග", "நீளம்"],
    ["txtStatusAddHarvestedPlotSizeBreadth", "Breadth", "පළල", "அகலம்"],
    ["txtStatusAddHarvestedNoOfPlots", "Plots", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["txtStatusAddUsedPesticideAmount", "Pesticide Amount", "පළිබෝධනාශක ප්‍රමාණය", "பூச்சிக்கொல்லி அளவு"],

    //buttons
    ["btnStatusAddAddNewStatus", "Progress Add", "නව ප්‍රගතියක් එක් කරන්න", "முன்னேற்றத்தைச் சேர்க்க"],

    //image carousel labels
    ["lblStatusAddStatusTypeWeeded", "Weeded", "වල් පැලෑටි ගැලවුවා", "களை"],
    ["lblStatusAddStatusTypeWatered", "Watered", "වතුර දැමීය", "பாய்ச்சியது"],
    ["lblStatusAddStatusTypeAppliedFertilizer", "Applied Fertilizer", "පොහොර දැමීය", "கருவுற்றது"],
    ["lblStatusAddStatusAppliedMeasurementKilograms", "Kilograms", "කිලෝග්‍රෑම්", "கிலோகிராம்"],
    ["lblStatusAddStatusAppliedMeasurementGrams", "Grams", "ග්‍රෑම්", "கிராம்"],
    ["lblStatusAddStatusAppliedMeasurementLitres", "Litres", "ලීටර්", "லிட்டர்"],
    ["lblStatusAddStatusAppliedMeasurementMilliLitres", "Mililitres", "මිලි ලීටර්", "மில்லிலிட்டர்கள்"],
    ["lblStatusAddStatusAppliedMeasurementOther", "Other", "වෙනත්", "மற்றவை"],

    //form labels
    ["lblProgressAddAddAProgressFor", "Add A Progress For", "මෙම බෝගය සඳහා ප්‍රගතියක් එකතු කරන්න", "ஒரு முன்னேற்றத்தைச் சேர்க்கவும்"],
    ["lblStatusAddWeededMeasurement", "Weeded - Measurement", "වල් පැලෑටි ගැලවු - මිනුම්", "களையெடுத்தல் - அளவீடு"],
    ["lblStatusAddWateredAmount", "Watered - Amount", "වතුර භාවිතා කල - ප්රමාණය", "நீர்ப்பாசனம் - தொகை"],
    ["lblStatusAddWateredMeasurement", "Watered - Measurement", "වතුර භාවිතා කල - මිනුම", "நீர்ப்பாசனம் - அளவீடு"],
    ["lblStatusAddAppliedFertilizerType", "Fertilizer Type", "පොහොර වර්ගය", "உர வகை"],
    ["lblStatusAddFertilizerAppliedAmount", "Applied - Amount", "භාවිතා කල - ප්‍රමාණය", "பயன்படுத்தப்பட்டது - தொகை"],
    ["lblStatusAddFertilizerAppliedMeasurement", "Applied - Measurement", "භාවිතා කල - මිනුම", "பயன்படுத்தப்பட்டது - அளவீடு"],
    ["lblStatusAddFertilizerAppliedMeasurement2", "Applied - Measurement", "භාවිතා කල - මිනුම", "பயன்படுத்தப்பட்டது - அளவீடு"],
    ["lblStatusAddDamagedMeasurement", "Damaged - Measurement", "හානි - මිනුම", "சேதம் - அளவீடு"],
    ["lblStatusAddDamagedAmount", "Damaged - Amount", "හානි - ප්රමාණය", "சேதம் - தொகை"],
    ["lblStatusAddDamagedPlotSizeMeasurement", "Plot Size - Measurement", "පාත්ති ප්‍රමාණය - මිනුම", "அடுக்கு அளவு - அளவீடு"],
    ["lblStatusAddDamagedPlotSizeUnits", "Unit:", "ඒකක:", "அலகு:"],
    ["lblStatusAddDamagedPlotSizeUnitsMetres", "Metres", "මීටර්", "மீட்டர்"],
    ["lblStatusAddDamagedPlotSizeUnitsFeet", "Feet", "අඩි", "அடி"],
    ["lblStatusAddDamagedPlotSizePlots", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["lblStatusAddHarvestedMethod", "Harvested Method", "අස්වනු නෙළු ක්‍රමය", "அறுவடை முறை"],
    ["lblStatusAddHarvestedMeasurement", "Harvested - Measurement", "අස්වනු නෙළු - මිනුම", "அறுவடை அளவீடு"],
    ["lblStatusAddHarvestedAmount", "Harvested - Amount", "අස්වනු නෙළු - ප්‍රමාණය", "அறுவடை - தொகை"],
    ["lblStatusAddHarvestedPlotSizeUnits", "Unit:", "ඒකක:", "அலகு:"],
    ["lblStatusAddHarvestedPlotSizeUnitsFeet", "Feet", "අඩි", "அடி"],
    ["lblStatusAddHarvestedPlotSizeUnitsMetres", "Metres", "මීටර්", "மீட்டர்"],
    ["lblStatusAddHarvestedPlotSizePlots", "Plots", "පාත්ති", "அடுக்குகள்"],
    ["lblStatusAddUsedPestControlMethod", "Pest Control Method", "පළිබෝධ පාලන ක්‍රමය", "பூச்சி கட்டுப்பாடு முறைz"],
    ["lblStatusAddUsedPesticideAmount", "Pesticide - Amount", "පළිබෝධනාශක - ප්‍රමාණය", "பூச்சிக்கொல்லி - அளவு"],
    ["lblStatusAddUsedPesticideMeasurement", "Pesticide - Measurement", "පළිබෝධනාශක - මිනුම", "பூச்சிக்கொல்லி - அளவீடு"],
    ["lblStatusAddAddedDate", "Added Date", "එකතු කල දිනය", "சேர்க்கப்பட்ட தேதி"],

    //radio-image's labels
    ["lblProgressAddWeededMeasurementPortion", "Portion", "කොටසක්", "பகுதி"],
    ["lblProgressAddWeededMeasurementQuarter", "Quarter", "කාලක්", "காலாண்டு"],
    ["lblProgressAddWeededMeasurementHalf", "Half", "භාගයක්", "பாதி"],
    ["lblProgressAddWeededMeasurementThreeQuarters", "Three Quarters", "තුන් කාලක්", "நான்கில் மூன்று பங்கு"],
    ["lblProgressAddWeededMeasurementAll", "All", "සියල්ල", "அனைத்து"],

    ["lblProgressAddWateredMeasurementMilliLitres", "Milli Litres", "මිලි ලීටර්", "மில்லிலிட்டர்கள்"],
    ["lblProgressAddWateredMeasurementLitres", "Litres", "ලීටර්", "லிட்டர்"],

    ["lblProgressAddFertilizerTypeOrganicFertilizer", "Organic Fertilizer", "කාබනික පොහොර", "கரிம உரங்கள்"],
    ["lblProgressAddFertilizerTypeAnimalManure", "Animal Manure", "සත්ව පොහොර", "விலங்கு உரம்"],
    ["lblProgressAddFertilizerTypeGreenManure", "Green Manure", "කොළ පොහොර", "பச்சை உரம்"],
    ["lblProgressAddFertilizerTypeCompost", "Compost", "කොම්පොස්ට්", "உரம்"],
    ["lblProgressAddFertilizerTypeOtherFertilizer", "Other Fertilizer", "වෙනත් පොහොර", "மற்ற உரங்கள்"],
    ["lblProgressAddFertilizerTypeLiquidFertilizer", "Liquid Fertilizer", "දියර පොහොර", "திரவ உரங்கள்"],

    ["lblProgressAddSolidFertilizerMeasurementGrams", "Grams", "ග්‍රෑම්", "கிராம்"],
    ["lblProgressAddSolidFertilizerMeasurementKiloGrams", "Kilo Grams", "කිලෝග්‍රෑම්", "கிலோ கிராம்"],
    ["lblProgressAddLiquidFertilizerMeasurementMilliLitres", "Milli Litres", "මිලි ලීටර්", "மில்லிலிட்டர்கள்"],
    ["lblProgressAddLiquidFertilizerMeasurementLitres", "Litres", "ලීටර්", "லிட்டர்"],

    ["lblProgressAddDamagedMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblProgressAddDamagedMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblProgressAddDamagedMeasurementPerches", "Perches", "පර්චස්", "பேர்ச்சஸ்"],
    ["lblProgressAddDamagedMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblProgressAddDamagedMeasurementPlots", "Plots", "පාත්ති", "அடுக்குகள்"],

    ["lblProgressAddHarvestedMethodAll", "All", "සියල්ල", "அனைத்து"],
    ["lblProgressAddHarvestedMethodPortion", "Portion", "කොටසක්", "பகுதி"],
    ["lblProgressAddHarvestedMeasurementSquareFeet", "Square Feet", "වර්ග අඩි", "சதுர அடி"],
    ["lblProgressAddHarvestedMeasurementSquareMetres", "Square Metres", "වර්ග මීටර", "சதுர மீட்டர்"],
    ["lblProgressAddHarvestedMeasurementPerches", "Perches", "පර්චස්", "பேர்ச்சஸ்"],
    ["lblProgressAddHarvestedMeasurementAcres", "Acres", "අක්කර", "ஏக்கர்"],
    ["lblProgressAddHarvestedMeasurementPlots", "Plots", "පාත්ති", "அடுக்குகள்"],

    ["lblProgressAddPestControlMethodPhysicallyRemoved", "Physically Removed", "ශාරීරිකව ඉවත් කර ඇත", "உடல் ரீதியாக நீக்கப்பட்டது"],
    ["lblProgressAddPestControlMethodRemovedCrop", "Removed Crop", "බෝගය ඉවත් කළා", "பயிர் அகற்றப்பட்டது"],
    ["lblProgressAddPestControlMethodOrganicPesticide", "Organic Pesticide", "කාබනික පළිබෝධනාශක", "கரிம பூச்சிக்கொல்லி"],
    ["lblProgressAddPestControlMethodChemicalPesticide", "Chemical Pesticide", "රසායනික පළිබෝධනාශක", "இரசாயன பூச்சிக்கொல்லி"],
    ["lblProgressAddPesticideMeasurementMilliLitres", "Milli Litres", "මිලි ලීටර්", "மில்லிலிட்டர்கள்"],
    ["lblProgressAddPesticideMeasurementLitres", "Litres", "ලීටර්", "லிட்டர்"],

    //notifications
    ["ModalError01Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["ModalError01BodyIsSatusSavedFalse", "Status saving failed.", "තත්වය සුරැකීම අසාර්ථක විය.", "நிலை சேமிப்பு தோல்வியுற்றது."],
    ["ModalError01Footer", "Okay", "හරි", "சரி"]
];

let Header = [
    ["lblHeaderHome", "Home", "පැතිකඩ", "சுயவிவரம்"],
    ["lblHeaderLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblHeaderCrops", "Crops", "බෝග", "பயிர்கள்"],
    ["lblHeaderHistory", "History", "ඉතිහාසය", "வரலாறு"],
    ["lblHeaderLanguageSwitchEnglish", "E", "E", "E"],
    ["lblHeaderLanguageSwitchSinhala", "සි", "සි", "සි"],
    ["lblHeaderLanguageSwitchTamil", "த", "த", "த"],
    ["lblHeaderAccountDetails", "Details", "විස්තර", "விவரம்"],
    ["lblHeaderSignOut", "Sign Out", "වරන්න", "வெளியேறு"]
];

let LandAll = [
    //links
    ["lblLandAllBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandAllBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],

    //headings
    ["lblLandAllBreadCrumbsLandsHeading", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblLandAllAllLandsHeading", "All Lands", "සියලුම ඉඩම්", "அனைத்து நிலமும்"],

    //buttons
    ["btnLandAllAddNewLand", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்க"],
    ["btnLandAllAddNewLand2", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்க"],
    ["lblLandAllNoLandsToShow", "No Lands To Show", "පෙන්වීමට ඉඩම් නොමැත", "காட்ட நிலங்கள் இல்லை"]
];

let CropAll = [
    //links
    ["lblCropAllBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblCropAllBreadCrumbsCrops", "Crops", "බෝග", "பயிர்கள்"],

    //headings
    ["lblCropAllBreadCrumbsCropsHeading", "Crops", "බෝග", "பயிர்கள்"],
    ["lblCropAllAllCropsHeading", "All Crops", "සියලුම බෝග", "அனைத்து பயிர்களும்"],

    //buttons
    ["btnCropAllAddNewCrop", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்க"],
    ["btnCropAllAddNewCrop2", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்க"],
    ["lblCropAllNoCropsToShow", "No Crops To Show", "පෙන්වීමට බෝග නැත", "காட்ட பயிர்கள் இல்லை"],
];

let Error404 = [
    //headings
    ["lblError404Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["lblError404Body", "Sorry! The page you were looking for doesn't exist.", "සමාවන්න! ඔබ සොයන පිටුව නොපවතී.",
        "மன்னிக்கவும்! நீங்கள் தேடிய பக்கம் இல்லை."],
    ["lblError404Footer", "Go Back To The Main Page", "ප්‍රධාන පිටුවට ආපසු යන්න", "முதன்மை பக்கத்திற்குச் செல்க"]
];

let Error500 = [
    //headings
    ["lblError500Title", "Error!", "දෝෂයකි!", "பிழை!"],
    ["lblError500Body", "Sorry! There was a problem in our end. We are looking into it.",
        "සමාවන්න! අපේ පැත්තෙන් ප්‍රශ්නයක් තියෙනවා. අපි ඒ ගැන සොයා බලනවා.",
        "மன்னிக்கவும்! எங்கள் பக்கத்தில் பிரச்சினை இருந்தது. நாங்கள் அதை கவனித்து வருகிறோம்."],
    ["lblError500Footer", "Go Back To The Main Page", "ප්‍රධාන පිටුවට ආපසු යන්න", "முதன்மை பக்கத்திற்குச் செல்க"]
];

const CROPS = [
    // ["Carrot", "කැරට්", "கேரட்"], //Crop Number = 0
    // ["Leeks", "ලීක්ස්", "லீக்ஸ்"], //Crop Number = 1
    // ["Beans", "බෝංචි", "பீன்ஸ்"], //Crop Number = 2
    // ["Onion", "ලූනු", "வெங்காயம்"], //Crop Number = 3
    // ["Tomato", "තක්කාලි", "தக்காளி"], //Crop Number = 4
    // ["Papaya", "පැපොල්", "பப்பாளி"], //Crop Number = 5
    // ["Banana", "කෙසෙල්", "வாழை"], //Crop Number = 6
    ["Apple", "ඇපල්", "ஆப்பிள்"],
    ["Artichoke", "අර්ටිචෝක්", "கூனைப்பூ"],
    ["Asparagus", "ඇස්පරගස්", "அஸ்பாரகஸ்"],
    ["Avocado", "අලිගැටපේර", "வெண்ணெய்"],
    ["Banana", "කෙසෙල්", "வாழை"],
    ["Beans", "බෝංචි", "பீன்ஸ்"],
    ["Beetroot", "බීට්රූට්", "பீட்ரூட்"],
    ["Bell Pepper", "බෙල් පෙපර්", "பெல்பெப்பர்"],
    ["Berries", "බෙරි", "பெர்ரி"],
    ["Bitter Gourd", "කරවිල", "பாகற்காய்"],
    ["Brinjal", "බටු", "கத்திரிக்காய்"],
    ["Broccoli", "බ්රොකොලී", "ப்ரோக்கோலி"],
    ["Cabbage", "ගෝවා", "முட்டைக்கோஸ்"],
    ["Capsicum", "මාළු මිරිස්", "கேப்சிகம்"],
    ["Carrot", "කැරට්", "கேரட்"],
    ["Cauliflower", "මල්ගෝවා", "காலிஃபிளவர்"],
    ["Celery", "සැල්දිරි", "செலரி"],
    ["Cherry", "චෙරි", "செர்ரி"],
    ["Chili", "මිරිස්", "மிளகாய்"],
    ["Coconut", "පොල්", "தேங்காய்"],
    ["Corn", "ඉරිඟු", "சோளம்"],
    ["Cucumber", "පිපිඤ්ඤා", "வெள்ளரிக்காய்"],
    ["Durian", "දූරියන්", "துரியன்"],
    ["Eggplant", "වම්බටු", "கத்திரிக்காய்"],
    ["Garlic", "සුදුළුනු", "பூண்டு"],
    ["Gooseberry", "ගූස්බෙරි", "நெல்லிக்காய்"],
    ["Grapes", "මිදි", "திராட்சை"],
    ["Green Chili", "හරිත මිරිස්", "பச்சை மிளகாய்"],
    ["Kiwi", "කීවි", "கிவி"],
    ["Knokhol", "නොකොල්", "நோகோல்"],
    ["Leeks", "ලීක්ස්", "லீக்ஸ்"],
    ["Lemon", "දෙහි", "எலுமிச்சை"],
    ["Lettuce", "ලෙටිස්", "கீரை"],
    ["Lime", "දෙහි", "சுண்ணாம்பு"],
    ["Long Beans", "දිගු බෝංචි", "நீண்ட பீன்ஸ்"],
    ["Mango", "අඹ", "மாங்கனி"],
    ["Melon", "කොමඩු", "முலாம்பழம்"],
    ["Mint Leaves", "මින්ට් කොළ", "புதினா இலைகள்"],
    ["Mushroom", "හතු", "காளான்"],
    ["Okra", "බණ්ඩක්කා", "ஓக்ரா"],
    ["Onion", "ලූනු", "வெங்காயம்"],
    ["Orange", "දොඩම්", "ஆரஞ்சு"],
    ["Papaya", "පැපොල්", "பப்பாளி"],
    ["Pear", "පෙයා", "பேரிக்காய்"],
    ["Peas", "කඩල", "பட்டாணி"],
    ["Pineapple", "අන්නාසි", "அன்னாசி"],
    ["Plum", "වියලි මිදි", "பிளம்"],
    ["Pomegranate", "දෙළුම්", "மாதுளை"],
    ["Potato", "අල", "உருளைக்கிழங்கு"],
    ["Pumpkin", "වට්ටක්කා", "பூசணி"],
    ["Radish", "රාබු", "முள்ளங்கி"],
    ["Raspberry", "රාස්බෙරි", "ராஸ்பெர்ரி"],
    ["Red Cabbage", "රතු ගෝවා", "சிவப்பு முட்டைக்கோஸ்"],
    ["Spinach", "නිවිති", "கீரை"],
    ["Strawberry", "ස්ට්රෝබෙරි", "ஸ்ட்ராபெரி"],
    ["Sweet Pepper", "මිහිරි ගම්මිරිස්", "இனிப்பு மிளகு"],
    ["Tomato", "තක්කාලි", "தக்காளி"],
    ["Turmeric", "කහ", "மஞ்சள்"],
    ["Watermelon", "කොමඩු", "தர்பூசணி"],
    ["Zucchini", "සුකිනි", "சுரைக்காய்"]
];


function translateCrops(language, cropName) {

    let cropNumber = 0;

    // if (cropName === "Carrot" || cropName === "කැරට්" || cropName === "கேரட்") {
    //     cropNumber = 0;
    // } else if (cropName === "Leeks" || cropName === "ලීක්ස්" || cropName === "லீக்ஸ்") {
    //     cropNumber = 1;
    // } else if (cropName === "Beans" || cropName === "බෝංචි" || cropName === "பீன்ஸ்") {
    //     cropNumber = 2;
    // } else if (cropName === "Onion" || cropName === "ලූනු" || cropName === "வெங்காயம்") {
    //     cropNumber = 3;
    // } else if (cropName === "Tomato" || cropName === "තක්කාලි" || cropName === "தக்காளி") {
    //     cropNumber = 4;
    // } else if (cropName === "Papaya" || cropName === "පැපොල්" || cropName === "பப்பாளி") {
    //     cropNumber = 5;
    // } else if (cropName === "Banana" || cropName === "කෙසෙල්" || cropName === "வாழை") {
    //     cropNumber = 6;
    // }

    if (cropName === "Apple" || cropName === "ඇපල්" || cropName === "ஆப்பிள்") {
        cropNumber = 0;
    } else if (cropName === "Artichoke" || cropName === "අර්ටිචෝක්" || cropName === "கூனைப்பூ") {
        cropNumber = 1;
    } else if (cropName === "Asparagus" || cropName === "ඇස්පරගස්" || cropName === "அஸ்பாரகஸ்") {
        cropNumber = 2;
    } else if (cropName === "Avocado" || cropName === "අලිගැටපේර" || cropName === "வெண்ணெய்") {
        cropNumber = 3;
    } else if (cropName === "Banana" || cropName === "කෙසෙල්" || cropName === "வாழை") {
        cropNumber = 4;
    } else if (cropName === "Beans" || cropName === "බෝංචි" || cropName === "பீன்ஸ்") {
        cropNumber = 5;
    } else if (cropName === "Beetroot" || cropName === "බීට්රූට්" || cropName === "பீட்ரூட்") {
        cropNumber = 6;
    } else if (cropName === "Bell Pepper" || cropName === "බෙල් පෙපර්" || cropName === "பெல்பெப்பர்") {
        cropNumber = 7;
    } else if (cropName === "Berries" || cropName === "බෙරි" || cropName === "பெர்ரி") {
        cropNumber = 8;
    } else if (cropName === "Bitter Gourd" || cropName === "කරවිල" || cropName === "பாகற்காய்") {
        cropNumber = 9;
    } else if (cropName === "Brinjal" || cropName === "බටු" || cropName === "கத்திரிக்காய்") {
        cropNumber = 10;
    } else if (cropName === "Broccoli" || cropName === "බ්රොකොලී" || cropName === "ப்ரோக்கோலி") {
        cropNumber = 11;
    } else if (cropName === "Cabbage" || cropName === "ගෝවා" || cropName === "முட்டைக்கோஸ்") {
        cropNumber = 12;
    } else if (cropName === "Capsicum" || cropName === "මාළු මිරිස්" || cropName === "கேப்சிகம்") {
        cropNumber = 13;
    } else if (cropName === "Carrot" || cropName === "කැරට්" || cropName === "கேரட்") {
        cropNumber = 14;
    } else if (cropName === "Cauliflower" || cropName === "මල්ගෝවා" || cropName === "காலிஃபிளவர்") {
        cropNumber = 15;
    } else if (cropName === "Celery" || cropName === "සැල්දිරි" || cropName === "செலரி") {
        cropNumber = 16;
    } else if (cropName === "Cherry" || cropName === "චෙරි" || cropName === "செர்ரி") {
        cropNumber = 17;
    } else if (cropName === "Chili" || cropName === "මිරිස්" || cropName === "மிளகாய்") {
        cropNumber = 18;
    } else if (cropName === "Coconut" || cropName === "පොල්" || cropName === "தேங்காய்") {
        cropNumber = 19;
    } else if (cropName === "Corn" || cropName === "ඉරිඟු" || cropName === "சோளம்") {
        cropNumber = 20;
    } else if (cropName === "Cucumber" || cropName === "පිපිඤ්ඤා" || cropName === "வெள்ளரிக்காய்") {
        cropNumber = 21;
    } else if (cropName === "Durian" || cropName === "දූරියන්" || cropName === "துரியன்") {
        cropNumber = 22;
    } else if (cropName === "Eggplant" || cropName === "වම්බටු" || cropName === "கத்திரிக்காய்") {
        cropNumber = 23;
    } else if (cropName === "Garlic" || cropName === "සුදුළුනු" || cropName === "பூண்டு") {
        cropNumber = 24;
    } else if (cropName === "Gooseberry" || cropName === "ගූස්බෙරි" || cropName === "நெல்லிக்காய்") {
        cropNumber = 25;
    } else if (cropName === "Grapes" || cropName === "මිදි" || cropName === "திராட்சை") {
        cropNumber = 26;
    } else if (cropName === "Green Chili" || cropName === "හරිත මිරිස්" || cropName === "பச்சை மிளகாய்") {
        cropNumber = 27;
    } else if (cropName === "Kiwi" || cropName === "කීවි" || cropName === "கிவி") {
        cropNumber = 28;
    } else if (cropName === "Knokhol" || cropName === "නොකොල්" || cropName === "நோகோல்") {
        cropNumber = 29;
    } else if (cropName === "Leeks" || cropName === "ලීක්ස්" || cropName === "லீக்ஸ்") {
        cropNumber = 30;
    } else if (cropName === "Lemon" || cropName === "දෙහි" || cropName === "எலுமிச்சை") {
        cropNumber = 31;
    } else if (cropName === "Lettuce" || cropName === "ලෙටිස්" || cropName === "கீரை") {
        cropNumber = 32;
    } else if (cropName === "Lime" || cropName === "දෙහි" || cropName === "சுண்ணாம்பு") {
        cropNumber = 33;
    } else if (cropName === "Long Beans" || cropName === "දිගු බෝංචි" || cropName === "நீண்ட பீன்ஸ்") {
        cropNumber = 34;
    } else if (cropName === "Mango" || cropName === "අඹ" || cropName === "மாங்கனி") {
        cropNumber = 35;
    } else if (cropName === "Melon" || cropName === "කොමඩු" || cropName === "முலாம்பழம்") {
        cropNumber = 36;
    } else if (cropName === "Mint Leaves" || cropName === "මින්ට් කොළ" || cropName === "புதினா இலைகள்") {
        cropNumber = 37;
    } else if (cropName === "Mushroom" || cropName === "හතු" || cropName === "காளான்") {
        cropNumber = 38;
    } else if (cropName === "Okra" || cropName === "බණ්ඩක්කා" || cropName === "ஓக்ரா") {
        cropNumber = 39;
    } else if (cropName === "Onion" || cropName === "ලූනු" || cropName === "வெங்காயம்") {
        cropNumber = 40;
    } else if (cropName === "Orange" || cropName === "දොඩම්" || cropName === "ஆரஞ்சு") {
        cropNumber = 41;
    } else if (cropName === "Papaya" || cropName === "පැපොල්" || cropName === "பப்பாளி") {
        cropNumber = 42;
    } else if (cropName === "Pear" || cropName === "පෙයා" || cropName === "பேரிக்காய்") {
        cropNumber = 43;
    } else if (cropName === "Peas" || cropName === "කඩල" || cropName === "பட்டாணி") {
        cropNumber = 44;
    } else if (cropName === "Pineapple" || cropName === "අන්නාසි" || cropName === "அன்னாசி") {
        cropNumber = 45;
    } else if (cropName === "Plum" || cropName === "වියලි මිදි" || cropName === "பிளம்") {
        cropNumber = 46;
    } else if (cropName === "Pomegranate" || cropName === "දෙළුම්" || cropName === "மாதுளை") {
        cropNumber = 47;
    } else if (cropName === "Potato" || cropName === "අල" || cropName === "உருளைக்கிழங்கு") {
        cropNumber = 48;
    } else if (cropName === "Pumpkin" || cropName === "වට්ටක්කා" || cropName === "பூசணி") {
        cropNumber = 49;
    } else if (cropName === "Radish" || cropName === "රාබු" || cropName === "முள்ளங்கி") {
        cropNumber = 50;
    } else if (cropName === "Raspberry" || cropName === "රාස්බෙරි" || cropName === "ராஸ்பெர்ரி") {
        cropNumber = 51;
    } else if (cropName === "Red Cabbage" || cropName === "රතු ගෝවා" || cropName === "சிவப்பு முட்டைக்கோஸ்") {
        cropNumber = 52;
    } else if (cropName === "Spinach" || cropName === "නිවිති" || cropName === "கீரை") {
        cropNumber = 53;
    } else if (cropName === "Strawberry" || cropName === "ස්ට්රෝබෙරි" || cropName === "ஸ்ட்ராபெரி") {
        cropNumber = 54;
    } else if (cropName === "Sweet Pepper" || cropName === "මිහිරි ගම්මිරිස්" || cropName === "இனிப்பு மிளகு") {
        cropNumber = 55;
    } else if (cropName === "Tomato" || cropName === "තක්කාලි" || cropName === "தக்காளி") {
        cropNumber = 56;
    } else if (cropName === "Turmeric" || cropName === "කහ" || cropName === "மஞ்சள்") {
        cropNumber = 57;
    } else if (cropName === "Watermelon" || cropName === "කොමඩු" || cropName === "தர்பூசணி") {
        cropNumber = 58;
    } else if (cropName === "Zucchini" || cropName === "සුකිනි" || cropName === "சுரைக்காய்") {
        cropNumber = 59;
    }

    let traslatedCropName;

    switch (language) {
        case "Sinhala" :
            traslatedCropName = CROPS[cropNumber][1];
            break;
        case "Tamil"  :
            traslatedCropName = CROPS[cropNumber][2];
            break;
        case "English"  :
            traslatedCropName = CROPS[cropNumber][0];
            break;
    }

    return traslatedCropName;
}

const PROG_WEEDED_E = "Weeded";
const PROG_WEEDED_S = "වල් පැලෑටි ඉවත් කරන ලදී.";
const PROG_WEEDED_T = "களைகள் அகற்றப்பட்டன";

const PROG_WATERED_E = "Watered";
const PROG_WATERED_S = "වතුර දැමීය";
const PROG_WATERED_T = "பாய்ச்சப்பட்டது";

const PROG_FERTILIZER_E = "Applied Fertilizer";
const PROG_FERTILIZER_S = "පොහොර දැමීය";
const PROG_FERTILIZER_T = "உரமாக்கப்பட்டது";

const PROG_DAMAGED_E = "Damaged";
const PROG_DAMAGED_S = "හානි වී ඇත";
const PROG_DAMAGED_T = "சேதமடைந்துள்ளது";

const PROG_HARVESTED_E = "Harvested";
const PROG_HARVESTED_S = "අස්වනු නෙලා ඇත";
const PROG_HARVESTED_T = "அறுவடை செய்யப்பட்டது";

const PROG_PEST_E = "Pest Controlled";
const PROG_PEST_S = "පළිබෝධ පාලනය කරන ලදී";
const PROG_PEST_T = "பூச்சிகள் கட்டுப்படுத்தப்பட்டன";


const ProgressTypes = [
    [PROG_WEEDED_E, PROG_WEEDED_S, PROG_WEEDED_T], //Crop Number = 0
    [PROG_WATERED_E, PROG_WATERED_S, PROG_WATERED_T], //Crop Number = 1
    [PROG_FERTILIZER_E, PROG_FERTILIZER_S, PROG_FERTILIZER_T], //Crop Number = 2
    [PROG_DAMAGED_E, PROG_DAMAGED_S, PROG_DAMAGED_T], //Crop Number = 3
    [PROG_HARVESTED_E, PROG_HARVESTED_S, PROG_HARVESTED_T], //Crop Number = 4
    [PROG_PEST_E, PROG_PEST_S, PROG_PEST_T], //Crop Number = 5
]


function translateProgressTypes(language, progressType) {

    var progressNumber = 0;

    if (progressType === PROG_WEEDED_E || progressType === PROG_WEEDED_S || progressType === PROG_WEEDED_T) {
        progressNumber = 0;
    } else if (progressType === PROG_WATERED_E || progressType === PROG_WATERED_S || progressType === PROG_WATERED_T) {
        progressNumber = 1;
    } else if (progressType === PROG_FERTILIZER_E || progressType === PROG_FERTILIZER_S || progressType === PROG_FERTILIZER_T) {
        progressNumber = 2;
    } else if (progressType === PROG_DAMAGED_E || progressType === PROG_DAMAGED_S || progressType === PROG_DAMAGED_T) {
        progressNumber = 3;
    } else if (progressType === PROG_HARVESTED_E || progressType === PROG_HARVESTED_S || progressType === PROG_HARVESTED_T) {
        progressNumber = 4;
    } else if (progressType === PROG_PEST_E || progressType === PROG_PEST_S || progressType === PROG_PEST_T) {
        progressNumber = 5;
    }

    var traslatedProgress;

    switch (language) {
        case "Sinhala" :
            traslatedProgress = ProgressTypes[progressNumber][1];
            break;
        case "Tamil" :
            traslatedProgress = ProgressTypes[progressNumber][2];
            break;
        case "English" :
            traslatedProgress = ProgressTypes[progressNumber][0];
            break;

    }

    return traslatedProgress;

}


//Fertlizer Types
const Fert_ORGANIC_E = "Organic Fertilizer";
const Fert_ORGANIC_S = "කාබනික පොහොර";
const Fert_ORGANIC_T = "கரிம உரங்கள்";

const Fert_ANIMAL_E = "Animal Manure";
const Fert_ANIMAL_S = "සත්ව පොහොර";
const Fert_ANIMAL_T = "விலங்கு உரம்";

const Fert_GREEN_E = "Green Manure";
const Fert_GREEN_S = "කොළ පොහොර";
const Fert_GREEN_T = "பச்சை உரம்";

const Fert_COMPOST_E = "Compost";
const Fert_COMPOST_S = "කොම්පොස්ට්";
const Fert_COMPOST_T = "வேதியியல் உரம்";

const Fert_OTHER_E = "Other Fertilizer";
const Fert_OTHER_S = "වෙනත් පොහොර";
const Fert_OTHER_T = "மற்ற உரங்கள்";

const Fert_LIQUID_E = "Liquid Fertilizer";
const Fert_LIQUID_S = "දියර පොහොර";
const Fert_LIQUID_T = "திரவ உரங்கள்";

//Pesticides Types
const PEST_ORGANIC_E = "Organic Pesticide";
const PEST_ORGANIC_S = "කාබනික පළිබෝධනාශක";
const PEST_ORGANIC_T = "கரிம பூச்சிக்கொல்லி";

const PEST_CHEMICAL_E = "Chemical Pesticide";
const PEST_CHEMICAL_S = "රසායනික පළිබෝධනාශක";
const PEST_CHEMICAL_T = "இரசாயன பூச்சிக்கொல்லி";

//Measurements

//Pesticide Measurements and Watered Measurements and Fertilizer Measurements
const MEASURE_ML_E = "Milli Litres";
const MEASURE_ML_S = "මිලි ලීටර්";
const MEASURE_ML_T = "மில்லிலிட்டர்கள்";

//Pesticide Measurements and Watered Measurements
const MEASURE_L_E = "Litres";
const MEASURE_L_S = "ලීටර්";
const MEASURE_L_T = "லிட்டர்";

//Fertilizer Measurements
const MEASURE_GRAM_E = "Grams";
const MEASURE_GRAM_S = "ග්‍රෑම්";
const MEASURE_GRAM_T = "கிராம்";

//Fertilizer Measurements
const MEASURE_KG_E = "Kilo Grams";
const MEASURE_KG_S = "කිලෝග්‍රෑම්";
const MEASURE_KG_T = "கிலோகிராம்";

//Damaged Measurements AND Harvested Measurements
const MEASURE_SQUAREFEET_E = "Square Feet";
const MEASURE_SQUAREFEET_S = "වර්ග අඩි";
const MEASURE_SQUAREFEET_T = "சதுர அடி";

//Damaged Measurements AND Harvested Measurements
const MEASURE_SQUAREMETERS_E = "Square Metres";
const MEASURE_SQUAREMETERS_S = "වර්ග මීටර";
const MEASURE_SQUAREMETERS_T = "சதுர மீட்டர்";

//Damaged Measurements AND Harvested Measurements
const MEASURE_PERCHES_E = "Perches";
const MEASURE_PERCHES_S = "පර්චස්";
const MEASURE_PERCHES_T = "பேர்ச்சஸ்";

//Damaged Measurements AND Harvested Measurements
const MEASURE_ACRES_E = "Acres";
const MEASURE_ACRES_S = "අක්කර";
const MEASURE_ACRES_T = "ஏக்கர்";

//Damaged Measurements AND Harvested Measurements
const MEASURE_PLOTS_E = "Plots";
const MEASURE_PLOTS_S = "බිම් කොටස්";
const MEASURE_PLOTS_T = "அடுக்குகள்";

//Weeded  Measurements
const MEASURE_PORTION_E = "Portion";
const MEASURE_PORTION_S = "කොටස";
const MEASURE_PORTION_T = "பகுதி";

//Weeded  Measurements
const MEASURE_QUARTER_E = "Quarter";
const MEASURE_QUARTER_S = "කාර්තුවේ";
const MEASURE_QUARTER_T = "காலாண்டு";

//Weeded  Measurements
const MEASURE_HALF_E = "Half";
const MEASURE_HALF_S = "භාගයක්";
const MEASURE_HALF_T = "பாதி";

//Weeded  Measurements
const MEASURE_3QUARTERS_E = "Three Quarters";
const MEASURE_3QUARTERS_S = "තුන්කාල";
const MEASURE_3QUARTERS_T = "நான்கில் மூன்று பங்கு";


//Weeded  Measurements
const MEASURE_ALL_E = "All";
const MEASURE_ALL_S = "සියළුම";
const MEASURE_ALL_T = "அனைத்து";

//Harvested  Measurements
const MEASURE_HARVESTED_ALL_E = "Harvested All";
const MEASURE_HARVESTED_ALL_S = "සියළුම අස්වනු නෙලා ඇත";
const MEASURE_HARVESTED_ALL_T = "அனைத்து அறுவடை";

//Harvested  Measurements
const MEASURE_HARVEST_PORTION_E = "Harvested Portion";
const MEASURE_HARVEST_PORTION_S = "කොටසක් අස්වනු නෙලා ඇත";
const MEASURE_HARVEST_PORTION_T = "பகுதி அறுவடை செய்யப்படுகிறது";

//Pest Controlled  Measurements
const MEASURE_PHYSICALLY_REMOVED_E = "Physically Removed";
const MEASURE_PHYSICALLY_REMOVED_S = "ශාරීරිකව ඉවත් කර ඇත";
const MEASURE_PHYSICALLY_REMOVED_T = "உடல் ரீதியாக நீக்கப்பட்டது";

//Pest Controlled  Measurements
const MEASURE_REMOVED_CROP_E = "Removed Crop";
const MEASURE_REMOVED_CROP_S = "බෝග ඉවත් කර ඇත";
const MEASURE_REMOVED_CROP_T = "பயிர் அகற்றப்பட்டது";


const FERTILIZER_PESTISIDE = [
    [Fert_ORGANIC_E, Fert_ORGANIC_S, Fert_ORGANIC_T], //FEST_PEST Number 0
    [Fert_ANIMAL_E, Fert_ANIMAL_S, Fert_ANIMAL_T], //FEST_PEST Number 1
    [Fert_GREEN_E, Fert_GREEN_S, Fert_GREEN_T], //FEST_PEST Number 2
    [Fert_COMPOST_E, Fert_COMPOST_S, Fert_COMPOST_T], //FEST_PEST Number 3
    [Fert_OTHER_E, Fert_OTHER_S, Fert_OTHER_T], //FEST_PEST Number 4
    [Fert_LIQUID_E, Fert_LIQUID_S, Fert_LIQUID_T], //FEST_PEST Number 5
    [PEST_ORGANIC_E, PEST_ORGANIC_S, PEST_ORGANIC_T], //FEST_PEST Number 6
    [PEST_CHEMICAL_E, PEST_CHEMICAL_S, PEST_CHEMICAL_T],//FEST_PEST Number 7
];

const MEASUREMENTS = [
    [MEASURE_ML_E, MEASURE_ML_S, MEASURE_ML_T], //Measurement Number 0
    [MEASURE_L_E, MEASURE_L_S, MEASURE_L_T], //Measurement Number 1
    [MEASURE_GRAM_E, MEASURE_GRAM_S, MEASURE_GRAM_T], //Measurement Number 2
    [MEASURE_KG_E, MEASURE_KG_S, MEASURE_KG_T], //Measurement Number 3
    [MEASURE_SQUAREFEET_E, MEASURE_SQUAREFEET_S, MEASURE_SQUAREFEET_T], //Measurement Number 4
    [MEASURE_SQUAREMETERS_E, MEASURE_SQUAREMETERS_S, MEASURE_SQUAREMETERS_T], //Measurement Number 5
    [MEASURE_PERCHES_E, MEASURE_PERCHES_S, MEASURE_PERCHES_T], //Measurement Number 6
    [MEASURE_PLOTS_E, MEASURE_PLOTS_S, MEASURE_PLOTS_T], //Measurement Number 7
    [MEASURE_PORTION_E, MEASURE_PORTION_S, MEASURE_PORTION_T], //Measurement Number 8
    [MEASURE_QUARTER_E, MEASURE_QUARTER_S, MEASURE_QUARTER_T], //Measurement Number 9
    [MEASURE_HALF_E, MEASURE_HALF_S, MEASURE_HALF_T], //Measurement Number 10
    [MEASURE_3QUARTERS_E, MEASURE_3QUARTERS_S, MEASURE_3QUARTERS_T], //Measurement Number 11
    [MEASURE_ALL_E, MEASURE_ALL_S, MEASURE_ALL_T], //Measurement Number 12
    [MEASURE_HARVESTED_ALL_E, MEASURE_HARVESTED_ALL_S, MEASURE_HARVESTED_ALL_T], //Measurement Number 13
    [MEASURE_HARVEST_PORTION_E, MEASURE_HARVEST_PORTION_S, MEASURE_HARVEST_PORTION_T], //Measurement Number 14
    [MEASURE_PHYSICALLY_REMOVED_E, MEASURE_PHYSICALLY_REMOVED_S, MEASURE_PHYSICALLY_REMOVED_T], //Measurement Number 15
    [MEASURE_REMOVED_CROP_E, MEASURE_REMOVED_CROP_S, MEASURE_REMOVED_CROP_T], //Measurement Number 16
    [MEASURE_REMOVED_CROP_E, MEASURE_REMOVED_CROP_S, MEASURE_REMOVED_CROP_T], //Measurement Number 17
    [MEASURE_ACRES_E, MEASURE_ACRES_S, MEASURE_ACRES_T], //Measurement Number 18
];


function translateProgressDesc(language, text, quantityText) {

    var measurement = "";
    var fert_pest_type = "";
    var fert_pest_type_number;
    var measurement_number;

    var quantity = quantityText.split(" ");


    for (var i = 0; i < FERTILIZER_PESTISIDE.length; i++) {

        if (text.includes(FERTILIZER_PESTISIDE[i][0]) || text.includes(FERTILIZER_PESTISIDE[i][1]) || text.includes(FERTILIZER_PESTISIDE[i][2])) {
            fert_pest_type_number = i;
        }
    }

    console.log("Number : " + fert_pest_type_number);


    for (var i = 0; i < MEASUREMENTS.length; i++) {

        if (text.includes(MEASUREMENTS[i][0]) || text.includes(MEASUREMENTS[i][1]) || text.includes(MEASUREMENTS[i][2])) {
            measurement_number = i;
            break;
        }
    }
    var original_quantity = "";
    if (isNaN(quantity[0])) {
        original_quantity = "";
    } else {
        original_quantity = quantity[0];
    }


    switch (language) {
        case "Sinhala" :
            if (fert_pest_type_number >= 0) {
                fert_pest_type = FERTILIZER_PESTISIDE[fert_pest_type_number][1];
            }
            if (measurement_number >= 0) {
                measurement = MEASUREMENTS[measurement_number][1];
            }
            var translatedText = fert_pest_type + " " + measurement + " " + original_quantity;
            break;

        case "English" :
            if (fert_pest_type_number >= 0) {
                fert_pest_type = FERTILIZER_PESTISIDE[fert_pest_type_number][0];
            }
            if (measurement_number >= 0) {
                measurement = MEASUREMENTS[measurement_number][0];
            }
            var translatedText = original_quantity + " " + measurement + " " + fert_pest_type;
            break;

        case "Tamil" :
            if (fert_pest_type_number >= 0) {
                fert_pest_type = FERTILIZER_PESTISIDE[fert_pest_type_number][2];
            }
            if (measurement_number >= 0) {
                measurement = MEASUREMENTS[measurement_number][2];
            }
            var translatedText = fert_pest_type + " " + measurement + " " + original_quantity;
            break;

    }
    console.log("11 " + fert_pest_type);
    console.log("22 " + measurement);
    console.log("33 " + quantity[0]);

    //  var translatedText = fert_pest_type + " " + measurement + " " +original_quantity;
    return translatedText;

}
