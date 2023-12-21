package services;

import models.Crops;
import models.Fertilizers;

import java.sql.Connection;
import java.sql.ResultSet;

public class FertilizersServices {

    //synchronized
    public synchronized Fertilizers FertilizersGet(int PkFertilizers) {
        Fertilizers Fertilizers = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkFertilizers, Name, UsedFor, FkFertilizerTypes
            String SqlQuery = "SELECT PkFertilizers, Name, UsedFor, FkFertilizerTypes " +
                    "FROM fertilizers " +
                    "WHERE PkFertilizers='" + PkFertilizers + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                int PkFertilizersTypes = Integer.parseInt(ResultSet.getString(4));
                Fertilizers = new Fertilizers(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        new FertilizerTypesServices().FertilizerTypesGet(PkFertilizersTypes)
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
        return Fertilizers;
    }

}
