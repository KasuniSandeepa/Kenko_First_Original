let DropDownlanguageGNDivison;
//Add the gn divisions in gn division select by creating each gn divisions options dynamically
function AddOptionGNDivision(selectbox,text,value )
{
    if(value == "Select"){
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        optn.disabled = "disabled";
        optn.selected = "selected";
        optn.hidden = "hidden";
        selectbox.options.add(optn);
    }else {
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        selectbox.options.add(optn);
    }
}

//Get the selected language to set in the dropdowns
function SetDropDownLanguageGnDivison(selectedLanguage){
    DropDownlanguageGNDivison = selectedLanguage;
    SetGNDivisions();
}

const GN_DIVISIONS = new Map();
GN_DIVISIONS.set("Kurunagala", KURUNEGALA_DIVISIONS);
GN_DIVISIONS.set("Puttalam", PUTTALAM_DIVISIONS);

GN_DIVISIONS.set("Kaluthara", KALUTARA_DIVISIONS);
GN_DIVISIONS.set("Colombo", COLOMBO_DIVISIONS);
GN_DIVISIONS.set("Gampaha", GAMPAHA_DIVISIONS);

GN_DIVISIONS.set("Kandy", KANDY_DIVISIONS);
GN_DIVISIONS.set("Matale", MATALE_DIVISIONS);
GN_DIVISIONS.set("Nuwaraeliya", NUWARA_ELIYA_DIVISIONS);

GN_DIVISIONS.set("Ampara", AMPARA_DIVISIONS);
GN_DIVISIONS.set("Batticaloa", BATTICALOA_DIVISIONS);
GN_DIVISIONS.set("Trincomalee", TRINCOMALEE_DIVISION);

GN_DIVISIONS.set("Galle", GALLE_DIVISION);
GN_DIVISIONS.set("Hambantota", HAMBANTOTA_DIVISION);
GN_DIVISIONS.set("Matara", MATARA_DIVISION);

GN_DIVISIONS.set("Jaffna", JAFFNA_DIVISION);
GN_DIVISIONS.set("Kilinochchi", KILINOCHCHI_DIVISION);
GN_DIVISIONS.set("Mannar", MANNAR_DIVISION);
GN_DIVISIONS.set("Mullativu", MULLATIVU_DIVISION);
GN_DIVISIONS.set("Vavuniya", VAVUNIYA_DIVISION);
GN_DIVISIONS.set("Alambil", ALAMBIL_DIVISION);

GN_DIVISIONS.set("Anuradhapura", ANURADHAPURA_DIVISION);
GN_DIVISIONS.set("Polonnaruwa", POLONNARUWA_DIVISION);

GN_DIVISIONS.set("Kegalle", KEGALLE_DIVISION);
GN_DIVISIONS.set("Rathnapura", RATHNAPURA_DIVISION);

GN_DIVISIONS.set("Badulla", BADULLA_DIVISION);
GN_DIVISIONS.set("Monaragala", MONARAGALA_DIVISION);


//Set the gn divisions according to the selected district.
function SetGNDivisions() {
    DeleteAllDivisions();
    let district_dropdown;
    if (document.getElementById("cmbLandAddDistrict") == null) {
        district_dropdown = document.getElementById("cmbLandUpdateDistrict");
    } else if (document.getElementById("cmbLandUpdateDistrict") == null) {
        district_dropdown = document.getElementById("cmbLandAddDistrict");
    }
    if (district_dropdown == null) {
        //Nothing Is happeninh
    } else {
        let selectedDistrict = district_dropdown.value;
        console.log('selectedDistrict: '+selectedDistrict);
        switch (DropDownlanguageGNDivison) {
            case "Sinhala":
                ShowInDropDown(GN_DIVISIONS.get(selectedDistrict), 1);
                break;
            case "Tamil":
                ShowInDropDown(GN_DIVISIONS.get(selectedDistrict), 2);
                break;
            case "English":
                ShowInDropDown(GN_DIVISIONS.get(selectedDistrict).sort(), 0);
                break;
            default       :
                // ShowInDropDown(GN_DIVISIONS.get(selectedDistrict).sort(), 0);
        }
    }
}

//Clear options in gn divisions  dropdown
function DeleteAllDivisions() {
    if(document.getElementById("cmbLandAddGNDivision") == null){
    }else {
        let listBox = document.getElementById("cmbLandAddGNDivision");
        listBox.options.length = 0;
        //  AddOption(listBox,"Select GN Division","Select");
        return false;
    }
}

//Add the gn divisions in gn divisions drop down
function ShowInDropDown(divisions,lan){
    if(document.getElementById("cmbLandAddGNDivision") == null){
    }else {
        let divisions_dropdown = document.getElementById("cmbLandAddGNDivision");
        for (let i = 0; i < divisions.length; ++i) {
            AddOptionGNDivision(divisions_dropdown, divisions[i][lan], divisions[i][0]);
        }
    }
}
