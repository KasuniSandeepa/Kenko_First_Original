package controllers;

import services.Cookies;
import services.DatabaseConnection;
import services.ProfilesServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import static services.Cookies.CookieDelete;
import static utils.EncodeAndDecode.DecodeString;
import static utils.EncodeAndDecode.EncodeString;
import static utils.NicDetails.GetNicDetails;

@WebServlet("/ProfileAddServlet")
public class ProfileAddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private String FirstName = "", LastName = "", Name = "", NIC = "";
    private String DateOfBirth = "", Gender = "", MobileNumber = "", Password = "";
    private boolean IsSignedUp = false, NicIsExists = false;
    private int FkProfileTypes = 1;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FirstName = request.getParameter("farmer_first_name");
        LastName = request.getParameter("farmer_last_name");
        Name = FirstName + "_" + LastName;
        NIC = request.getParameter("farmer_nic");
        MobileNumber = request.getParameter("farmer_contact_number");
        Password = request.getParameter("farmer_password");
        System.out.println(MobileNumber + ", " + EncodeString(Password));

        if (IsNicValid()) {
            if (services.NIC.IsNicExistsInDatabase(NIC)) {
                System.out.println("NicPresent=true");
                response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                        "&NicPresent=true");
            } else {
                if (IsSignedUp()) {
                    CookieDelete(request, response, Cookies.COOKIE_REMEMBERED_PROFILE);
                    response.sendRedirect("index.jsp?IsUserSignedUp=true");
                    System.out.println("IsUserSignedUp=true");
                } else {
                    System.out.println("UserSaved=false");
                    response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                            "&UserSaved=false");
                }
            }
        } else {
            System.out.println("NicValid=false");
            response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                    "&NicValid=false");
        }

    }

    private boolean IsNicValid() {
        boolean NicIsValid = false;
        String[] NicDetails = {"0", "0", "0", "0"};
        if (!GetNicDetails(NIC)[0].equals("0")) {
            //change flag
            NicIsValid = true;
            //assign local variable values
            NicDetails = GetNicDetails(NIC);
            DateOfBirth = NicDetails[0] + "-" + NicDetails[1] + "-" + NicDetails[2];
            Gender = NicDetails[3];
//            System.out.println(DateOfBirth + ", " + Gender);
        }
        return NicIsValid;
    }

    private boolean IsSignedUp() {
        boolean IsSignedUp = false;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, Address, PhotoUrl, Province, District, GnArea,
            // LandState, CropState, RegisteredDate, Uuid, FkProfileTypes
            String SqlQuery = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender,"
                    + " MobileNumber, Address, PhotoUrl, Province, District, GnArea,"
                    + " LandState, CropState, RegisteredDate, Uuid, FkProfileTypes)"
                    + " VALUES('" + Name + "','" + NIC + "','" + DateOfBirth + "','" + Gender + "',"
                    + " '" + MobileNumber + "','Address','PhotoUrl','Province',"
                    + " 'District','GnArea','Not_Cultivated','Not_Grown','"
                    + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGenerate() + "',"
                    + " " + FkProfileTypes + ")";
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Signed Up: " + Name);
            IsSignedUp = true;
            //--save log-in details
            LogInDetailsSave(new ProfilesServices().PkProfilesForProfileAddGet(NIC, MobileNumber));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return IsSignedUp;
    }

    private void LogInDetailsSave(int PkProfiles) {
//        boolean IsLogInDetailsSaved = false;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
            String SqlQuery = "INSERT INTO profilelogindetails(MobileNumber, Password, FkProfiles) "
                    + "VALUES('" + MobileNumber + "','" + Password + "'," + PkProfiles + ")";
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("IsLogInDetailsSaved=true");
//            IsLogInDetailsSaved = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
//        return IsLogInDetailsSaved;
    }

//    private void ResponseGet(HttpServletRequest request, HttpServletResponse response) {
//
//        try {
////            if (IsNicValid == false) {
////                System.out.println("NicValid=false");
////                response.sendRedirect("ProfileAdd.jsp?NicValid=false");
////            } else
//
//            if (NicIsExists) {
//                System.out.println("NicPresent=true");
//                response.sendRedirect("ProfileAdd.jsp?NicPresent=true");
//            } else if (IsSignedUp) {
//                System.out.println("UserSaved=true");
//                response.sendRedirect("index.jsp?IsUserSignedUp=true");
//            } else {
//                System.out.println("UserSaved=false");
//                response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
//                        "&UserSaved=false");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }

}
