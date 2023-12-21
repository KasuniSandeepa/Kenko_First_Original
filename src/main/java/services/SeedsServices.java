package services;

import models.FertilizerTypes;
import models.Seeds;

import java.sql.Connection;
import java.sql.ResultSet;

public class SeedsServices {

    public Seeds SeedsGet(int PkSeeds) {
        Seeds Seeds = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkSeeds, Name, FkSeedTypes
            String SqlQuery = "SELECT PkSeeds, Name, FkSeedTypes " +
                    "FROM seeds " +
                    "WHERE PkSeeds='" + PkSeeds + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                int PkSeedTypes = Integer.parseInt(ResultSet.getString(3));
                Seeds = new Seeds(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes)
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
        return Seeds;
    }

}
