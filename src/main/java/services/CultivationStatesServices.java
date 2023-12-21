package services;

import models.CultivationStates;
import models.ProfileTypes;
import models.Profiles;

import java.sql.Connection;
import java.sql.ResultSet;

public class CultivationStatesServices {

    public CultivationStates CultivationStatesGet(int PkCultivationStates) {
        CultivationStates CultivationStates = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkCultivationStates, Name
            String SqlQuery = "SELECT PkCultivationStates, Name " +
                    "FROM cultivationstates " +
                    "WHERE PkCultivationStates=" + PkCultivationStates + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                CultivationStates = new CultivationStates(
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
        return CultivationStates;
    }

}
