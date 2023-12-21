package services;

import models.ProgressTypes;
import models.SeedTypes;

import java.sql.Connection;
import java.sql.ResultSet;

public class ProgressTypesServices {

    public ProgressTypes ProgressTypesGet(int PkProgressTypes) {
        ProgressTypes ProgressTypes = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProgressTypes, Name
            String SqlQuery = "SELECT PkProgressTypes, Name " +
                    "FROM progresstypes " +
                    "WHERE PkProgressTypes='" + PkProgressTypes + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                ProgressTypes = new ProgressTypes(
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
        return ProgressTypes;
    }

}
