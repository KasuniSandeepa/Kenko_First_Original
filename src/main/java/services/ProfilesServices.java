package services;

import models.ProfileTypes;
import models.Profiles;
import utils.Strings;

import java.sql.Connection;
import java.sql.ResultSet;

import static services.DatabaseCheck.PrimaryKeyGet;
import static services.DatabaseCheck.ResultGet;

public class ProfilesServices {

//    public static void main(String[] args) {
//        int PkProfiles = new ProfilesServices().PkProfilesForUuidGet("01d5bfab-2d34-4951-948f-da7bab4a2c2f");
//        if (PkProfiles > 0) {
//            System.out.println("PkProfilesForUuidGet: " + PkProfiles);
//        } else {
//            System.out.println("PkProfilesForUuidGet==0");
//        }
//    }

    public int PkProfilesForUuidGet(String Uuid) {
        int PkProfiles = 0;
        String SqlQuery = "SELECT PkProfiles" +
                " FROM profiles" +
                " WHERE Uuid = '" + Uuid + "'";
        PkProfiles = PrimaryKeyGet(SqlQuery);
//        System.out.println("PkProfilesForUuidGet : " + PkProfiles);
        return PkProfiles;
    }

    public int PkProfilesForProfileAddGet(String NIC, String MobileNumber) {
        int PkProfiles = 0;
        String SqlQuery = "SELECT PkProfiles " +
                "FROM profiles " +
                "WHERE NIC='" + NIC + "' " +
                "AND MobileNumber='" + MobileNumber + "'";
        PkProfiles = PrimaryKeyGet(SqlQuery);
        return PkProfiles;
    }

    public Profiles ProfilesGet(int PkProfiles) {
        Profiles Profiles = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, Address, PhotoUrl, Province, District, GnArea,
            // LandState, CropState, RegisteredDate, Uuid, FkProfileTypes
            String SqlQuery = "SELECT PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, " +
                    "Address, PhotoUrl, Province, District, GnArea, LandState, CropState, RegisteredDate, " +
                    "Uuid, FkProfileTypes " +
                    "FROM profiles " +
                    "WHERE PkProfiles=" + PkProfiles + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                int PkProfileTypes = Integer.parseInt(ResultSet.getString(16));
                ProfileTypes ProfileTypes = new ProfileTypesServices().ProfileTypesGet(PkProfileTypes);
                Profiles = new Profiles(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        ResultSet.getString(9),
                        ResultSet.getString(10),
                        ResultSet.getString(11),
                        ResultSet.getString(12),
                        ResultSet.getString(13),
                        ResultSet.getString(14),
                        ResultSet.getString(15),
                        ProfileTypes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return Profiles;
    }

    public void ProfilesDetailsPrint(Profiles Profiles) {
        System.out.println(Profiles.getPkProfiles() + "\n" +
                Strings.UnderscoresReplace(Profiles.getName()) + ", " +
                Profiles.getNIC() + "\n" +
                Profiles.getDateOfBirth() + ", " + Profiles.getGender() + "\n" +
                Profiles.getMobileNumber() + ", " + Profiles.getAddress() + "\n" +
                Profiles.getPhotoUrl() + ", " + Profiles.getProfileTypes().getName());
    }

    public String UuidOfProfileGet(String NIC, String MobileNumber) {
        String Result = "";
        String SqlQuery = "SELECT uuid " +
                "FROM profiles " +
                "WHERE NIC='" + NIC + "' " +
                "AND MobileNumber='" + MobileNumber + "'";
        Result = ResultGet(SqlQuery);
        return Result;
    }

    public String MobileNumberOfProfilesGet(String Uuid) {
        String Result = "";
        String SqlQuery = "SELECT MobileNumber " +
                "FROM profiles " +
                "WHERE Uuid='" + Uuid + "'";
        Result = ResultGet(SqlQuery);
        return Result;
    }

}
