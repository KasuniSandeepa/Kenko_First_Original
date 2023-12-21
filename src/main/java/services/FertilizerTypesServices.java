package services;

import models.FertilizerTypes;

import java.sql.Connection;
import java.sql.ResultSet;

public class FertilizerTypesServices {

    public FertilizerTypes FertilizerTypesGet(int PkFertilizerTypes) {
        FertilizerTypes FertilizerTypes = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkFertilizerTypes, Name
            String SqlQuery = "SELECT PkFertilizerTypes, Name " +
                    "FROM fertilizertypes " +
                    "WHERE PkFertilizerTypes='" + PkFertilizerTypes + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                FertilizerTypes = new FertilizerTypes(
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
        return FertilizerTypes;
    }

}
