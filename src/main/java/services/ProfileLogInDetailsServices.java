package services;

import models.ProfileLogInDetails;

import java.sql.Connection;
import java.sql.ResultSet;

public class ProfileLogInDetailsServices {

    public ProfileLogInDetails ProfileLogInDetailsOfProfilesGet(int PkProfiles) {
        ProfileLogInDetails ProfileLogInDetails = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
            String SqlQuery = "SELECT PkProfileLogInDetails, MobileNumber, Password, FkProfiles " +
                    "FROM profilelogindetails " +
                    "WHERE FkProfiles=" + PkProfiles + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                ProfileLogInDetails = new ProfileLogInDetails(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        new ProfilesServices().ProfilesGet(PkProfiles)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return ProfileLogInDetails;
    }

    public ProfileLogInDetails ProfileLogInDetailsGet(int PkProfileLogInDetails) {
        ProfileLogInDetails ProfileLogInDetails = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
            String SqlQuery = "SELECT PkProfileLogInDetails, MobileNumber, Password, FkProfiles " +
                    "FROM profilelogindetails " +
                    "WHERE PkProfileLogInDetails=" + PkProfileLogInDetails + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                int PkProfiles = Integer.parseInt(ResultSet.getString(4));
                ProfileLogInDetails = new ProfileLogInDetails(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        new ProfilesServices().ProfilesGet(PkProfiles)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return ProfileLogInDetails;
    }

}
