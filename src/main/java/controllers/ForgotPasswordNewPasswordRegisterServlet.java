package controllers;

import services.Cookies;
import services.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;

import static services.Cookies.CookieDelete;
import static services.DatabaseCheck.PrimaryKeyGet;
import static utils.EncodeAndDecode.DecodeString;
import static utils.EncodeAndDecode.EncodeString;

@WebServlet("/ForgotPasswordNewPasswordRegisterServlet")
public class ForgotPasswordNewPasswordRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String MobileNumber = request.getParameter("farmer_contact_number");
        String Password = request.getParameter("farmer_password");
        System.out.println("Updating: " + MobileNumber + ", " + EncodeString(Password));
        int MatchedUserId = PkProfilesGet(MobileNumber);
        //
        ProfilesPasswordUpdate(Password, MatchedUserId);
        //
        CookieDelete(request, response, Cookies.COOKIE_REMEMBERED_PROFILE);
        //
        response.sendRedirect("index.jsp?IsPasswordUpdated=true");
    }

    private void ProfilesPasswordUpdate(String Password, int PkProfiles) {
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            String SqlQuery = "UPDATE profilelogindetails"
                    + " SET Password='" + Password + "'"
                    + " WHERE FkProfiles='" + PkProfiles + "'";
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("User's Password Updated!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
    }

    private int PkProfilesGet(String MobileNumber) {
        int PkProfiles = 0;
        String SqlQuery = "SELECT PkProfiles" +
                " FROM profiles" +
                " WHERE MobileNumber = '" + MobileNumber + "'";
        PkProfiles = PrimaryKeyGet(SqlQuery);
//        System.out.println("PkProfilesGet : " + PkProfiles);
        return PkProfiles;
    }

}
