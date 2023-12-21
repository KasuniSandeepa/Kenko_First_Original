package services;

import models.CropTypes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import static services.DatabaseCheck.PrimaryKeyGet;
import static services.DatabaseCheck.ResultGet;

public class CropTypesServices {

//    public static void main(String[] args) {
//    }

    public CropTypes CropTypesGet(int PkCropTypes) {
        CropTypes CropTypes = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            String SqlQuery = "SELECT PkCropTypes, Name, GrowthDuration, DefaultImage" +
                    " FROM croptypes " +
                    " WHERE PkCropTypes='" + PkCropTypes + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                CropTypes = new CropTypes(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4)
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
        return CropTypes;
    }

    public synchronized String CropTypesNameGet(int PkCrops) {
        String SqlQuery = "SELECT ct.Name " +
                "FROM crops c " +
                "INNER JOIN croptypes ct ON c.FkCropTypes=ct.PkCropTypes " +
                "WHERE c.PkCrops='" + PkCrops + "'";
        String Name = ResultGet(SqlQuery);
        return Name;
    }

    public int PkCropTypesGet(String CropType) {
        int PkCropType = 0;
        String SqlQuery = "SELECT PkCropTypes " +
                "FROM croptypes " +
                "WHERE Name='" + CropType + "'";
        PkCropType = PrimaryKeyGet(SqlQuery);
        return PkCropType;
    }

    public List<CropTypes> CropTypesListGet() {
        List<CropTypes> CropTypesList = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkCropTypes, Name, GrowthDuration, DefaultImage
            String SqlQuery = "SELECT PkCropTypes, Name, GrowthDuration, DefaultImage " +
                    "FROM croptypes";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            CropTypesList = new LinkedList<>();
            while (ResultSet.next()) {
                CropTypesList.add(new CropTypes(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4))
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
        return CropTypesList;
    }

}
