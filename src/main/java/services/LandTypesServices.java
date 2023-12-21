package services;

import models.LandTypes;
import models.ProfileTypes;
import models.Profiles;

import java.sql.Connection;
import java.sql.ResultSet;

public class LandTypesServices {


    public LandTypes LandTypesGet(int PkLandTypes) {
        LandTypes LandTypes = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkLandTypes, Name
            String SqlQuery = "SELECT PkLandTypes " +
                    " FROM landtypes" +
                    " WHERE PkLandTypes=" + PkLandTypes + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                LandTypes = new LandTypes(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2)
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
        return LandTypes;
    }

}
