package services;

import models.PesticideTypes;

import java.sql.Connection;
import java.sql.ResultSet;

public class PesticideTypesServices {

    public PesticideTypes PesticideTypesGet(int PkPesticideTypes) {
        PesticideTypes PesticideTypes = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkPesticideTypes, Name
            String SqlQuery = "SELECT PkPesticideTypes, Name " +
                    "FROM pesticidetypes " +
                    "WHERE PkPesticideTypes='" + PkPesticideTypes + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                PesticideTypes = new PesticideTypes(
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
        return PesticideTypes;
    }

}
