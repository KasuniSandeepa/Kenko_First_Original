// const KURUNEGALA_GN_DIVISION_LIST = 'src/main/webapp/dist-assets/js/custom/gn_divisions/kurunegala_gn_divisions.txt';

let DropDownlanguage='';

function include(file) {

    let script = document.createElement('script');
    script.src = file;
    script.type = 'text/javascript';
    script.defer = true;

    document.getElementsByTagName('head').item(0).appendChild(script);

}

//Get the selected language to set in the dropdowns
function SetDropDownLanguage(selectedLanguage) {
    DropDownlanguage = selectedLanguage;
    SetDistricts();
}

//Set the districts according to the selected province to an array called districts
function SetDistricts() {
    DeleteAllDistrictsInAdd();
    if (document.getElementById("cmbLandAddProvince") == null || document.getElementById("cmbLandAddDistrict") == null) {

    } else {
        let province_dropdown = document.getElementById("cmbLandAddProvince");
        let district_dropdown = document.getElementById("cmbLandAddDistrict");
        let selectedProvince = province_dropdown.value;
        console.log("6666666" + selectedProvince);

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
        switch (DropDownlanguage) {
            case "Sinhala" :
                ShowInDropDownDistrictsInAdd(districts, 1);
                break;
            case "English" :
                ShowInDropDownDistrictsInAdd(districts, 0);
                break;
            case "Tamil" :
                ShowInDropDownDistrictsInAdd(districts, 2);
                break;
            default : //code default here
                break;
        }
    }
}

//Add the districts in districts drop down
function ShowInDropDownDistrictsInAdd(districts, lan) {
    let district_dropdown = document.getElementById("cmbLandAddDistrict");
    for (let i = 0; i < districts.length; ++i) {
        AddOption(district_dropdown, districts[i][lan], districts[i][0]);
    }
}

//Add the districts in district select by creating each districts options dynamically
function AddOption(selectbox, text, value) {
    if (value == "Select") {
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        optn.disabled
        optn.selected
        optn.hidden
        selectbox.options.add(optn);
    } else {
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        selectbox.options.add(optn);
    }
}

//Clear options in district dropdown
function DeleteAllDistrictsInAdd() {
    if (document.getElementById("cmbLandAddDistrict") == null) {

    } else {
        let listBox = document.getElementById("cmbLandAddDistrict");
        listBox.options.length = 0;
        /*AddOption(listBox,"Select District","Select");*/
        return false;
    }
}
