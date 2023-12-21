package services;

import models.SeedTypes;

import java.sql.Connection;
import java.sql.ResultSet;

public class SeedTypesServices {

    public SeedTypes SeedTypesGet(int PkSeedTypes) {
        SeedTypes SeedTypes = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkSeedTypes, Name
            String SqlQuery = "SELECT PkSeedTypes, Name " +
                    "FROM seedtypes " +
                    "WHERE PkSeedTypes='" + PkSeedTypes + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                SeedTypes = new SeedTypes(
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
        return SeedTypes;
    }

}
