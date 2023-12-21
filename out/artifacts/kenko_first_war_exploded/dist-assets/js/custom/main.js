
//show and hide crop-add > more details fields
function CropAddMoreDetailsShowAndHide() {

    let NurseryGrownNumberField = document.getElementById("Nursery_Grown_Number");
    let NurseryGrownMeasurement = document.getElementById("Nursery_Grown_Measurement");
    // let PlantedDate = document.getElementById("Planted_Date");
    let CropPhoto = document.getElementById("Crop_Photo");
    let SelectedCropPhoto = document.getElementById("Selected_Crop_Photo");

    if(document.getElementById("myCheckbox").checked === true){
        // console.log('true');
        NurseryGrownNumberField.style.display = "block";
        NurseryGrownMeasurement.style.display = "block";
        // PlantedDate.style.display = "block";
        CropPhoto.style.display = "block";
        SelectedCropPhoto.style.display = "block";
    } else {
        // console.log('false');
        NurseryGrownNumberField.style.display = "none";
        NurseryGrownMeasurement.style.display = "none";
        // PlantedDate.style.display = "none";
        CropPhoto.style.display = "none";
        SelectedCropPhoto.style.display = "none";
    }
}

//show and hide land-add > more details fields
function LandAddMoreDetailsShowAndHide() {

    let LandAddress = document.getElementById("Land_Address");
    let LandType = document.getElementById("Land_Type");
    let OwnershipState = document.getElementById("Ownership_State");
    let Province = document.getElementById("Province");
    let District = document.getElementById("District");
    let GnDivision = document.getElementById("Gn_Division");
    let LandPhoto = document.getElementById("Land_Photo");
    let SelectedLandPhoto = document.getElementById("Selected_Land_Photo");

    if(document.getElementById("myCheckbox").checked === true){
        // console.log('true');
        LandAddress.style.display = "block";
        LandType.style.display = "block";
        OwnershipState.style.display = "block";
        Province.style.display = "block";
        District.style.display = "block";
        GnDivision.style.display = "block";
        LandPhoto.style.display = "block";
        SelectedLandPhoto.style.display = "block";
    } else {
        // console.log('false');
        LandAddress.style.display = "none";
        LandType.style.display = "none";
        OwnershipState.style.display = "none";
        Province.style.display = "none";
        District.style.display = "none";
        GnDivision.style.display = "none";
        LandPhoto.style.display = "none";
        SelectedLandPhoto.style.display = "none";
    }
}

//show and hide crop-add, crop-update > nursery-time fields
function Show(value) {
    console.log(value);
    var NurseryGrownNumberField = document.getElementById("Nursery_Grown_Number");
    var NurseryGrownMeasurement = document.getElementById("Nursery_Grown_Measurement");
    if (value == "Yes") {
        NurseryGrownNumberField.style.display = "block";
        NurseryGrownMeasurement.style.display = "block";
    } else if (value == "No") {
        NurseryGrownNumberField.style.display = "none";
        NurseryGrownMeasurement.style.display = "none";
    }
}

//show and hide password - jquery
$(document).ready(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );
        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
    });
});

//show and hide password-confirm - jquery
$(document).ready(function() {
    $("#show_hide_password_confirm a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password_confirm input').attr("type") == "text"){
            $('#show_hide_password_confirm input').attr('type', 'password');
            $('#show_hide_password_confirm i').addClass( "fa-eye-slash" );
            $('#show_hide_password_confirm i').removeClass( "fa-eye" );
        }else if($('#show_hide_password_confirm input').attr("type") == "password"){
            $('#show_hide_password_confirm input').attr('type', 'text');
            $('#show_hide_password_confirm i').removeClass( "fa-eye-slash" );
            $('#show_hide_password_confirm i').addClass( "fa-eye" );
        }
    });
});

//show and hide 'back-to-top' element on page scroll
// window.onscroll = function () {
//     let btt = document.getElementById('backToTop');
//     if (pageYOffset >= 1000) {
//         btt.style.visibility = 'visible';
//     } else {
//         btt.style.visibility = 'none';
//     }
// };

//refine url
function refineUrl(url) {
    let refUrl = url.split('?')[0];
    return refUrl;
}

//image preview
function ReadUrl(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('photo_preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}

//validate 'required' form fields and display 'loading' notification