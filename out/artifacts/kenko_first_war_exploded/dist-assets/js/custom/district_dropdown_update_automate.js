//const KURUNEGALA_GN_DIVISION_LIST = 'src/main/webapp/dist-assets/js/custom/gn_divisions/kurunegala_gn_divisions.txt';
var provinces = [];
let DropDownlanguageUpdate = "";

//Get the selected language to set in the dropdowns
function SetDropDownLanguageInUpdate(selectedLanguage){
    DropDownlanguageUpdate = selectedLanguage;
    SetDistrictsUpdate();
    SetProvinces(1);
}

//Set the districts according to the selected province to an array called districts
function SetDistrictsUpdate() {
    DeleteAllDistricts();
    if(document.getElementById("cmbLandUpdateProvince") == null || document.getElementById("cmbLandUpdateDistrict") == null){

    }else {
        let province_dropdown = document.getElementById("cmbLandUpdateProvince");
        let district_dropdown = document.getElementById("cmbLandUpdateDistrict");
        let selectedProvince = province_dropdown.value;
        let selectedDistrict = district_dropdown.value;
        let districts = [];
        if (selectedProvince === "Western") {
            districts = [
                ["Colombo", "කොළඹ", "கொழும்பு"],
                ["Kaluthara", "කළුතර", "களுத்துறை"],
                ["Gampaha", "ගම්පහ", "கம்பாஹா"]
            ];
        } else if (selectedProvince === "Central") {
            districts = [
                ["Kandy", "මහනුවර", "கண்டி"],
                ["Matale", "මාතලේ", "மாத்தலே"],
                ["Nuwaraeliya", "නුවරඑළිය", "நுவரெலியா"],
            ];
        } else if (selectedProvince === "Southern") {
            districts = [
                ["Galle", "ගාල්ල", "காலி"],
                ["Hambantota", "හම්බන්තොට", "ஹம்பாந்தோட்டா"],
                ["Matara", "මාතර", "மாதாரா"],
            ];
        } else if (selectedProvince === "Eastern") {
            districts = [
                ["Ampara", "අම්පාර", "அம்பாரா"],
                ["Batticaloa", "මඩකලපුව", "மட்டக்களப்பு"],
                ["Trincomalee", "ත්රිකුණාමලය", "திருகோணமலை"],
            ];
        } else if (selectedProvince === "Northern") {
            districts = [
                ["Jaffna", "යාපනය", "யாழ்ப்பாணம்"],
                ["Kilinochchi", "කිලිනොච්චි", "கிலினோச்சி"],
                ["Mannar", "මන්නාරම", "மன்னார்"],
                ["Mullativu", "මුලතිව්", "முல்லைதிவு"],
                ["Vavuniya", "වවුනියාව", "வவுனியா"],
                ["Alambil", "ඇලම්බිල්", "அலம்பில்"],
            ];
        } else if (selectedProvince === "North Central") {
            districts = [
                ["Anuradhapura", "අනුරාධපුර", "அனுராதபுரம்"],
                ["Polonnaruwa", "පොළොන්නරුව", "பொலோனருவா"],
            ];
        } else if (selectedProvince === "North Western") {
            districts = [
                ["Kurunagala", "කුරුණෑගල", "குருநாகல்"],
                ["Puttalam", "පුත්තලම", "புட்டலம்"]
            ];
        } else if (selectedProvince === "Sabaragamuwa") {
            districts = [
                ["Kegalle", "කෑගල්ල", "கெகல்லே"],
                ["Rathnapura", "රත්නපුර", "ரத்னபுரா"]
            ];
        } else if (selectedProvince === "Uva") {
            districts = [
                ["Badulla", "බදුල්ල", "பதுல்லா"],
                ["Monaragala", "මොණරාගල", "மோனராகலா"]
            ];
        }
        //Pass the array and language index to add those districts in districts dropdown
        switch (DropDownlanguageUpdate) {
            case "Sinhala" :
                ShowInDropDownDistricts(districts, 1);
                break;
            case "English"   :
                ShowInDropDownDistricts(districts, 0);
                break;
            case "Tamil"   :
                ShowInDropDownDistricts(districts, 2);
                break;
            default        : //code default here
        }
    }
}
//Add the districts in districts drop down
function ShowInDropDownDistricts(districts,lan){
    if(document.getElementById("cmbLandUpdateDistrict") == null){

    }else {
        let district_dropdown = document.getElementById("cmbLandUpdateDistrict");
        console.log("I AM hereee")
        for (let i = 0; i < districts.length; ++i) {
            AddOptionInUpdate(district_dropdown, districts[i][lan], districts[i][0],0);
        }
    }
}

//Add the districts in district select by creating each districts options dynamically
function AddOptionInUpdate(selectbox,text,value , x)
{
    if(value == "Select"){
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        optn.disabled = true;
        optn.selected = true;
        optn.hidden = true;
        selectbox.options.add(optn);
    }else {
        if(x==1) {
            console.log("here")
            let optn = document.createElement("OPTION");
            optn.text = text;
            optn.value = value;
            optn.selected = true;
            optn.hidden = true;
            selectbox.options.add(optn);
        }else{
            let optn = document.createElement("OPTION");
            optn.text = text;
            optn.value = value;
            selectbox.options.add(optn);
        }
    }
}

//Clear options in district dropdown
function DeleteAllDistricts() {
    if(document.getElementById("cmbLandUpdateDistrict") == null){
    }
    else {
        let listBox = document.getElementById("cmbLandUpdateDistrict");
        listBox.options.length = 0;
        // AddOption(listBox,"Select District","Select");
        return false;
    }
}

//Set the provinces according
function SetProvinces(j){
    if(document.getElementById("cmbLandUpdateProvince") == null || document.getElementById("cmbLandUpdateDistrict") == null){

    }else {
       // DeleteAllProvinces();
        let province_dropdown = document.getElementById("cmbLandUpdateProvince");
        let district_dropdown = document.getElementById("cmbLandUpdateDistrict");
        let selectedProvince = province_dropdown.value;
        let selectedDistrict = district_dropdown.value;

       /* provinces = new Array("Sabaragamuwa", "Eastern", "North Central", "North Western", "Northern", "Uva",
            "Southern", "Central", "Western");*/
        provinces = [
            ["Western", "බස්නාහිර පළාත", "மேற்கு மாகாணம்"],
            ["Central", "මධ්‍යම පළාත", "மத்திய மாகாணம்"],
            ["Southern", "දකුණු පළාත", "தெற்கு மாகாணம்"],
            ["Uva", "ඌව පළාත", "ஊவா மாகாணம்"],
            ["Sabaragamuwa", "සබරගමුව", "சபராகமுவ"],
            ["North Western", "වයඹ", "வடமேற்கு"],
            ["North Central", "උතුරු මැද", "வட மத்திய"],
            ["Northern", "උතුරු", "வடக்கு"],
            ["Eastern", "නැගෙනහිර", "கிழக்கு"]
        ];

        let Index = 0;
        switch (DropDownlanguageUpdate) {
            case "English":
                Index = 0;
                break;
            case "Sinhala":
                Index = 1;
                break;
            case "Tamil":
                Index = 2;
                break;
            default:
            // code block
        }

        if (j == 0) {
            for (let i = 0; i < provinces.length; ++i) {
                if (selectedProvince == provinces[i][0]) {
                } else {
                    AddOptionInUpdate(province_dropdown, provinces[i][Index], provinces[i][0], 0);
                }
            }
        }
        if (j == 1) {
            DeleteAllProvinces();
            for (let i = 0; i < provinces.length; ++i) {
                if (selectedProvince == provinces[i][0]) {
                    AddOptionInUpdate(province_dropdown, provinces[i][Index], provinces[i][0], 1);
                } else {
                    AddOptionInUpdate(province_dropdown, provinces[i][Index], provinces[i][0], 0);
                }
            }
        }
    }
    provinces = [];
}

//Clear all districts
function DeleteAllProvinces() {
    let listBox = document.getElementById("cmbLandUpdateProvince");
    listBox.options.length = 0;
//AddOption(listBox,"Select District","Select");
    return false;
}
