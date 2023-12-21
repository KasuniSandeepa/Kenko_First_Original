
function GetDateOfBirthByNIC(NIC) {
    if (NIC === null || NIC === "")
        return null;

    if (ValidateNIC(NIC) === false)
        return null;

    if (_PatientType === "PATIENT_ADULT") {

        TogglePatientDataForChild(true);

        let Year;
        let Day;
        let Month;
        let DayText;

        let Gender;
        // Year
        if (NIC.length === 10) {
            Year = "19" + NIC.substr(0, 2);
            DayText = parseInt(NIC.substr(2, 3));
        } else {
            Year = NIC.substr(0, 4);
            DayText = parseInt(NIC.substr(4, 3));
        }

        // Gender
        if (DayText > 500) {
            Gender = "Female";
            DayText = DayText - 500;
        } else {
            Gender = "Male";
        }

        GetGender(Gender);

        // Day Digit Validation
        if (DayText < 1 && DayText > 366) {
            return null
        }

        if (DayText > 335) {
            Day = DayText - 335;
            Month = "12";
        }
        else if (DayText > 305) {
            Day = DayText - 305;
            Month = "11";
        }
        else if (DayText > 274) {
            Day = DayText - 274;
            Month = "10";
        }
        else if (DayText > 244) {
            Day = DayText - 244;
            Month = "09";
        }
        else if (DayText > 213) {
            Day = DayText - 213;
            Month = "08";
        }
        else if (DayText > 182) {
            Day = DayText - 182;
            Month = "07";
        }
        else if (DayText > 152) {
            Day = DayText - 152;
            Month = "06";
        }
        else if (DayText > 121) {
            Day = DayText - 121;
            Month = "05";
        }
        else if (DayText > 91) {
            Day = DayText - 91;
            Month = "04";
        }
        else if (DayText > 60) {
            Day = DayText - 60;
            Month = "03";
        }
        else if (DayText < 32) {
            Month = "01";
            Day = DayText;
        }
        else if (DayText > 31) {
            Day = DayText - 31;
            Month = "02";
        }

        return Year + "/" + Month + "/" + Day;

    } else {
        TogglePatientDataForChild(false);
    }

}

function AgeCalculate(DateString) {
    let Result = [];

    if (DateString === null || DateString === "") {
        Result[0] = null;
        Result[1] = null;

        return Result;
    }
    let Today = new Date();
    let BirthDate = new Date(DateString);
    let AgeYears = Today.getFullYear() - BirthDate.getFullYear();
    let AgeMonth = Today.getMonth() - BirthDate.getMonth();
    console.log(Today.getMonth() + " " + BirthDate.getMonth());

    if (AgeMonth < 0 || (AgeMonth === 0 && Today.getDate() < BirthDate.getDate())) {
        AgeYears--;
        AgeMonth = 12 + AgeMonth;
    }

    if (AgeMonth == 12) {
        AgeMonth = 0;
        AgeYears++;
    }

    Result[0] = AgeYears;
    Result[1] = AgeMonth;

    return Result;

}

//function isNumeric(evt)
//{
//    var theEvent = evt || window.event;
//    var key = theEvent.keyCode || theEvent.which;
//    key = String.fromCharCode(key);
//    var regex = /[0-9]|\./;
//    if (!regex.test(key)) {
//        theEvent.returnValue = false;
//        if (theEvent.preventDefault) theEvent.preventDefault();
//    }
//}

function GetGender(Gender)
{

    if (Gender === 'MALE' ||Gender === 'Male') {
        $("#male").prop("checked", true);
        $("#female").prop("checked", false);

        $("#Clinicmale").prop("checked", true);
        $("#Clinicfemale").prop("checked", false);

        $("#ClinicParentmale").prop("checked", true);
        $("#ClinicParentfemale").prop("checked", false);
    }
    else if (Gender === 'FEMALE' || Gender === 'Female') {
        $("#male").prop("checked", false);
        $("#Clinicfemale").prop("checked", true);

        $("#male").prop("checked", false);
        $("#Clinicfemale").prop("checked", true);

        $("#ClinicParentmale").prop("checked", false);
        $("#ClinicParentfemale").prop("checked", true);
    }

}