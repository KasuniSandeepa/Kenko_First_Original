package controllers;

import models.Profiles;
import services.Cookies;
import services.DatabaseConnection;
import services.ProfilesServices;
import utils.Uuid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import static services.HttpSession.PROFILES;
import static utils.EncodeAndDecode.EncodeString;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private String MobileNumber = "";
    private String Password = "";
    private boolean IsRememberMeChecked = false;
    private int PkProfiles = 0;
    private Profiles Profiles = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MobileNumber = request.getParameter("farmer_contact_number");
        Password = request.getParameter("farmer_password");
        System.out.println(MobileNumber + ", " + EncodeString(Password));

        IsRememberMeChecked = request.getParameter("remember_me") != null;

        //sign in
        UserSignIn();
        //clear existing cookie
        services.Cookies.CookieDelete(request, response, Cookies.COOKIE_REMEMBERED_PROFILE);
        //set ip-address
//        IpAddressSave(request, response);
        //set new cookie and redirect response
        ResponseGet(request, response);

    }

    private void IpAddressSave(HttpServletRequest Request, HttpServletResponse Response) {
//        String IpAddress = Request.getRemoteHost();
//        String IpAddress = "112.134.92.56";
//        System.out.println("IpAddress: " + IpAddress);
        //geo-location data
        try {
//            GeoLocation GeoLocation = new GeoLocation();
//            GeoLocation.LocationGet("112.134.92.56");
////            GeoLocation.LocationGet(IpAddress);
//            System.out.println(GeoLocation.CountryGet());
//            System.out.println(GeoLocation.DistrictGet());
//            System.out.println(GeoLocation.CityGet());
//            System.out.println(GeoLocation.PostalCodeGet());
//            System.out.println(GeoLocation.LatitudeAndLongitudeGet());

            //set ip-address in session
//            HttpSession HttpSession = Request.getSession();
//            HttpSession.setAttribute(services.HttpSession.IP_ADDRESS, IpAddress);

        } catch (Exception e) {
            System.out.println(e);
            RedirectForInvalidIpAddress(Response);
        }

    }

    private void RedirectForInvalidIpAddress(HttpServletResponse Response) {
        try {
            Response.sendRedirect("index.jsp?IsIpValid=false");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void UserSignIn() {
        PkProfiles = 0;
        //release flag
//        if (FlaggedText.equals("true")){
//            MobileNumber=DecodeString(MobileNumber);
//            Password=DecodeString(Password);
//            System.out.println("UnFlaggedText: "+MobileNumber+", "+Password);
//        }
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
            String SqlQuery = "SELECT PkProfileLogInDetails, MobileNumber, Password, FkProfiles " +
                    "FROM profilelogindetails " +
                    "WHERE MobileNumber='" + MobileNumber + "' AND Password='" + Password + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                PkProfiles = Integer.parseInt(ResultSet.getString(4));
            }
            //get matching profile
            Profiles = new ProfilesServices().ProfilesGet(PkProfiles);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
    }

    private void ResponseGet(HttpServletRequest Request, HttpServletResponse Response) {

        try {

            if (Profiles.getProfileTypes().getPkProfileTypes() > 1) {
                //invalid user-type
                System.out.println("IsUserTypeInvalid=true");
                Response.sendRedirect("index.jsp?IsUserTypeInvalid=true");


            } else {
                //invalid user-type
                if (Profiles == null) {
                    //user NOT matched with db records
                    System.out.println("IsUserFound=false");
                    Response.sendRedirect("index.jsp?IsUserFound=false");
                } else {
                    //user matched with db records
                    //set user
                    HttpSession HttpSession = Request.getSession();
                    HttpSession.setAttribute(PROFILES, Profiles);
                    //add cookie
                    if (IsRememberMeChecked) {
                        Cookies.CookieSave(Response, Cookies.COOKIE_REMEMBERED_PROFILE, EncodeString(Profiles.getUuid()));
                    }
                    System.out.println("IsUserFound=true");
                    Response.sendRedirect("Profile.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
