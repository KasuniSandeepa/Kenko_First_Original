package services;

import models.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import static services.DatabaseCheck.*;

public class ProgressesServices {

//    public static void main(String[] args) {
//        String[] values = null;
//        values = new String[]{"Weeded", "Watered", "Applied Fertilizer", "Damaged", "Harvested", "Pest Controlled"};
//        System.out.println("ProgressTypePrimaryKeyGet: " + ProgressTypesPrimaryKeyGet(values[1]));
//        values = new String[]{"Solid Fertilizer", "Liquid Fertilizer"};
//        System.out.println("FertilizerTypesPrimaryKeyGet: " + FertilizerTypesPrimaryKeyGet(values[1]));
//        String[] x = LandAreaInPlotsChangedDisplayMethodGet("2x3x4_Metres");
//        System.out.println("LandAreaInPlotsChangedDisplayMethodGet: " + x[0] + x[1] + x[2] + x[3]);
//        System.out.println("ProgressTypesGet: "+ProgressTypesGet(1));
//        System.out.println("PesticideTypesPrimaryKeyGet: " +
//                new ProgressesServices().PesticideTypesPrimaryKeyGet("Organic Pesticide"));
//        ProgressesOfCropDisplay(1);
//    }

    public List<Progresses> ProgressesListOfCropPaginatedGet(int PkCrops, int Start, int Total) {
        List<Progresses> ProgressesList = new LinkedList<>();
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            String SqlQuery = "SELECT PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, " +
                    "FkProgressTypes, FkFertilizerTypes, FkPesticideTypes " +
                    "FROM progresses " +
                    "WHERE FkCrops='" + PkCrops + "' " +
                    "ORDER BY PkProgresses DESC " +
                    "LIMIT " + (Start - 1) + "," + Total + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //--primary keys
            int PkProfiles = 0, PkLandDetails = 0, PkProgressTypes = 0, PkFertilizerTypes = 0, PkPesticideTypes = 0;
            //--static object
            Crops Crops = new CropsServices().CropsGet(PkCrops);
            while (ResultSet.next()) {
                PkProfiles = Integer.parseInt(ResultSet.getString(5));
                PkLandDetails = Integer.parseInt(ResultSet.getString(6));
                PkProgressTypes = Integer.parseInt(ResultSet.getString(7));
                PkFertilizerTypes = Integer.parseInt(ResultSet.getString(8));
                PkPesticideTypes = Integer.parseInt(ResultSet.getString(9));
                ProgressesList.add(new Progresses(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        Crops,
                        new ProfilesServices().ProfilesGet(PkProfiles),
                        new LandDetailsServices().LandDetailsGet(PkLandDetails),
                        new ProgressTypesServices().ProgressTypesGet(PkProgressTypes),
                        new FertilizerTypesServices().FertilizerTypesGet(PkFertilizerTypes),
                        new PesticideTypesServices().PesticideTypesGet(PkPesticideTypes)
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return ProgressesList;
    }

    public Progresses ProgressesGet(int PkProgresses) {
        Progresses Progresses = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, FkProgressTypes,
            // FkFertilizerTypes, FkPesticideTypes
            String SqlQuery = "SELECT PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, " +
                    "FkProgressTypes, FkFertilizerTypes, FkPesticideTypes " +
                    "FROM progresses " +
                    "WHERE PkProgresses='" + PkProgresses + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //--primary keys
            int PkCrops = 0, PkProfiles = 0, PkLandDetails = 0, PkProgressTypes = 0, PkFertilizerTypes = 0;
            int PkPesticideTypes = 0;
            if (ResultSet.next()) {
                PkCrops = Integer.parseInt(ResultSet.getString(4));
                PkProfiles = Integer.parseInt(ResultSet.getString(5));
                PkLandDetails = Integer.parseInt(ResultSet.getString(6));
                PkProgressTypes = Integer.parseInt(ResultSet.getString(7));
                PkFertilizerTypes = Integer.parseInt(ResultSet.getString(8));
                PkPesticideTypes = Integer.parseInt(ResultSet.getString(9));
                Progresses = new Progresses(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        new CropsServices().CropsGet(PkCrops),
                        new ProfilesServices().ProfilesGet(PkProfiles),
                        new LandDetailsServices().LandDetailsGet(PkLandDetails),
                        new ProgressTypesServices().ProgressTypesGet(PkProgressTypes),
                        new FertilizerTypesServices().FertilizerTypesGet(PkFertilizerTypes),
                        new PesticideTypesServices().PesticideTypesGet(PkPesticideTypes)
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

        return Progresses;
    }

    //---------------------------------------------------------

    public static String ProgressImageUrlGet(String Progress) {
        String ImageUrl = "";
        switch (Progress) {
            case "Weeded":
                ImageUrl = "dist-assets/images/farm/rake-2.png";
                break;
            case "Watered":
                ImageUrl = "dist-assets/images/farm/watering-can.png";
                break;
            case "Applied Fertilizer":
                ImageUrl = "dist-assets/images/farm/sack.png";
                break;
            case "Damaged":
                ImageUrl = "dist-assets/images/farm/tree.png";
                break;
            case "Harvested":
                ImageUrl = "dist-assets/images/farm/bucket.png";
                break;
            case "Pest Controlled":
                ImageUrl = "dist-assets/images/custom/pest.png";
                break;
        }
        return ImageUrl;
    }

    public static String ProgressTypeNameGet(int PkProgressTypes) {
        String ProgressTypeName = "";
        String SqlQuery = "SELECT Name " +
                "FROM progresstypes " +
                "WHERE PkProgressTypes='" + PkProgressTypes + "'";
        ProgressTypeName = ResultGet(SqlQuery);
        return ProgressTypeName;
    }

//    public int PkCropsOfProgressGet(int FkCrops) {
//        int PkCrops = 0;
//        String SqlQuery = "SELECT PkCrops " +
//                "FROM crops " +
//                "WHERE PkCrops='" + FkCrops + "'";
//        PkCrops = PrimaryKeyGet(SqlQuery);
//        return PkCrops;
//    }

    public int ProgressTypesPrimaryKeyGet(String TypeName) {
        int PrimaryKey = 0;
        String SqlQuery = "SELECT PkProgressTypes " +
                "FROM progresstypes " +
                "WHERE Name='" + TypeName + "'";
        PrimaryKey = PrimaryKeyGet(SqlQuery);
        return PrimaryKey;
    }

    public int FertilizerTypesPrimaryKeyGet(String TypeName) {
        int PrimaryKey = 0;
        String SqlQuery = "SELECT PkFertilizerTypes " +
                "FROM fertilizertypes " +
                "WHERE Name='" + TypeName + "'";
        PrimaryKey = PrimaryKeyGet(SqlQuery);
        return PrimaryKey;
    }

    public static String FertilizerTypeNameGet(int PkFertilizerTypes) {
        String FertilizerTypeName = "";
        String SqlQuery = "SELECT Name " +
                "FROM fertilizertypes " +
                "WHERE PkFertilizerTypes='" + PkFertilizerTypes + "'";
        FertilizerTypeName = ResultGet(SqlQuery);
        return FertilizerTypeName;
    }

    public int PesticideTypesPrimaryKeyGet(String TypeName) {
        int PrimaryKey = 0;
        String SqlQuery = "SELECT PkPesticideTypes " +
                "FROM pesticidetypes " +
                "WHERE Name='" + TypeName + "'";
        PrimaryKey = PrimaryKeyGet(SqlQuery);
        return PrimaryKey;
    }

    public static String PesticideTypeNameGet(int PkPesticideTypes) {
        String PesticideTypeName = "";
        String SqlQuery = "SELECT Name " +
                "FROM pesticidetypes " +
                "WHERE PkPesticideTypes='" + PkPesticideTypes + "'";
        PesticideTypeName = ResultGet(SqlQuery);
        return PesticideTypeName;
    }

    public static boolean IsConvertedToInt(String Value) {
        boolean IsConvertedToInt = false;
        try {
            Integer.parseInt(Value);
            IsConvertedToInt = true;
        } catch (Exception e) {
        }
        return IsConvertedToInt;
    }

}
