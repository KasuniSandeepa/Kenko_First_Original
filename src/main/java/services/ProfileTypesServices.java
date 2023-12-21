package services;

import models.ProfileTypes;

import java.sql.Connection;
import java.sql.ResultSet;

public class ProfileTypesServices {

    public ProfileTypes ProfileTypesGet(int PkProfileTypes) {
        ProfileTypes ProfileTypes = null;
        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            String SqlQuery = "SELECT PkProfileTypes, Name" +
                    " FROM profiletypes" +
                    " WHERE PkProfileTypes=" + PkProfileTypes + "";
            ResultSet ResultSetMatchedProfile = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSetMatchedProfile.next()) {
                ProfileTypes = new ProfileTypes(
                        Integer.parseInt(
                                ResultSetMatchedProfile.getString(1)),
                        ResultSetMatchedProfile.getString(2)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return ProfileTypes;
    }

}
