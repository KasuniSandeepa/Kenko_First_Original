package services;

import models.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;

import static services.DatabaseCheck.ResultGet;

public class CropsServices {

//    public static void main(String[] args) {
//        CropsServices CropsServices = new CropsServices();
//        String LandExtentAvailable = CropsServices
//                .LandExtentAvailableGet(2, "10_Square Feet");
//        System.out.println("LandExtentAvailable: " + LandExtentAvailable);
//        System.out.println("IsRequiredLandExtentAvailable: " + CropsServices.IsRequiredLandExtentAvailable);
////        System.out.println("LandExtentCultivatedInSquareFeetGet: " +
////                CropsService.LandExtentCultivatedInSquareFeetGet(3));
//        System.out.println("CropCultivatedLandAreaGet: " + new CropsServices().CropCultivatedLandAreaGet(1));
//    }

    //synchronized
    public synchronized List<Crops> CropsOfLandDetailsPaginatedGet(int PkLandDetails, int Start, int Total) {
        List<Crops> CropsList = new LinkedList<>();
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement,
            // CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
            String SqlQuery = "SELECT c.PkCrops, c.CultivatedLandArea, c.NurseryTime, c.PlantedDate, c.WaterRequirement, " +
                    "c.ClimateRequirement, c.CropCycleDuration, c.PhotoUrl, c.FkLandDetails, c.FkCropTypes, c.FkFertilizers, " +
                    "c.FkSeedTypes, c.FkSeeds, c.FkYields " +
                    "FROM crops c " +
                    "WHERE FkLandDetails ='" + PkLandDetails + "'" +
                    "ORDER BY PkCrops DESC " +
                    "LIMIT " + (Start - 1) + "," + Total + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //--primary keys
            int PkCropTypes = 0, PkFertilizers = 0, PkSeedTypes = 0, PkSeeds = 0, PkYields = 0;
            //--static object
            LandDetails LandDetails = new LandDetailsServices().LandDetailsGet(PkLandDetails);
            while (ResultSet.next()) {
                PkCropTypes = Integer.parseInt(ResultSet.getString(10));
                PkFertilizers = Integer.parseInt(ResultSet.getString(11));
                PkSeedTypes = Integer.parseInt(ResultSet.getString(12));
                PkSeeds = Integer.parseInt(ResultSet.getString(13));
                PkYields = Integer.parseInt(ResultSet.getString(14));
                CropsList.add(new Crops(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        LandDetails,
                        new CropTypesServices().CropTypesGet(PkCropTypes),
                        new FertilizersServices().FertilizersGet(PkFertilizers),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes),
                        new SeedsServices().SeedsGet(PkSeeds),
                        new YieldsServices().YieldsGet(PkYields)
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return CropsList;
    }

    //synchronized
    public synchronized List<Crops> CropsOfProfilesPaginatedGet(int PkProfiles, int Start, int Total) {
        List<Crops> CropsList = new LinkedList<>();
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement,
            // CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
            String SqlQuery = "SELECT c.PkCrops, c.CultivatedLandArea, c.NurseryTime, c.PlantedDate, c.WaterRequirement, " +
                    "c.ClimateRequirement, c.CropCycleDuration, c.PhotoUrl, c.FkLandDetails, c.FkCropTypes, c.FkFertilizers, " +
                    "c.FkSeedTypes, c.FkSeeds, c.FkYields " +
                    "FROM crops c " +
                    "INNER JOIN landdetails l ON c.FkLandDetails=l.PkLandDetails " +
                    "INNER JOIN profiles p ON l.FkProfiles=p.PkProfiles " +
                    "WHERE FkProfiles ='" + PkProfiles + "' " +
                    "ORDER BY PkCrops DESC " +
                    "LIMIT " + (Start - 1) + "," + Total + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //--primary keys
            int PkLandDetails = 0, PkCropTypes = 0, PkFertilizers = 0, PkSeedTypes = 0, PkSeeds = 0, PkYields = 0;
            while (ResultSet.next()) {
                PkLandDetails = Integer.parseInt(ResultSet.getString(9));
                PkCropTypes = Integer.parseInt(ResultSet.getString(10));
                PkFertilizers = Integer.parseInt(ResultSet.getString(11));
                PkSeedTypes = Integer.parseInt(ResultSet.getString(12));
                PkSeeds = Integer.parseInt(ResultSet.getString(13));
                PkYields = Integer.parseInt(ResultSet.getString(14));
                CropsList.add(new Crops(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        new LandDetailsServices().LandDetailsGet(PkLandDetails),
                        new CropTypesServices().CropTypesGet(PkCropTypes),
                        new FertilizersServices().FertilizersGet(PkFertilizers),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes),
                        new SeedsServices().SeedsGet(PkSeeds),
                        new YieldsServices().YieldsGet(PkYields)
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return CropsList;
    }

    //synchronized
    public synchronized Crops CropsGet(int PkCrops) {
        Crops Crops = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement,
            // CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
            String SqlQuery = "SELECT PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, " +
                    "WaterRequirement, ClimateRequirement, CropCycleDuration, PhotoUrl, FkLandDetails, " +
                    "FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields " +
                    "FROM crops " +
                    "WHERE PkCrops='" + PkCrops + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                //--primary keys
                int PkLandDetails = Integer.parseInt(ResultSet.getString(9));
                int PkCropTypes = Integer.parseInt(ResultSet.getString(10));
                int PkFertilizers = Integer.parseInt(ResultSet.getString(11));
                int PkSeedTypes = Integer.parseInt(ResultSet.getString(12));
                int PkSeeds = Integer.parseInt(ResultSet.getString(13));
                int PkYields = Integer.parseInt(ResultSet.getString(14));
                Crops = new Crops(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        new LandDetailsServices().LandDetailsGet(PkLandDetails),
                        new CropTypesServices().CropTypesGet(PkCropTypes),
                        new FertilizersServices().FertilizersGet(PkFertilizers),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes),
                        new SeedsServices().SeedsGet(PkSeeds),
                        new YieldsServices().YieldsGet(PkYields)
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
        return Crops;
    }

    //synchronized
    public synchronized String CropCultivatedLandAreaGet(int PkCrops) {
        String SqlQuery = "SELECT CultivatedLandArea " +
                "FROM crops " +
                "WHERE PkCrops='" + PkCrops + "'";
        String CultivatedLandArea = ResultGet(SqlQuery);
        return CultivatedLandArea;
    }



}

/*
Required: 8 Square Metres
Total: 10 Square Metres
TotalLandNumberCultivated: 2.0 Square Metres
LandExtentAvailable: 0.0_Square Metres
IsRequiredLandExtentAvailable: true

Required: 9 Square Metres
Total: 10 Square Metres
TotalLandNumberCultivated: 2.0 Square Metres
LandExtentAvailable: -1.0_Square Metres
IsRequiredLandExtentAvailable: false

Required: 1 Acres
Total: 10 Square Metres
TotalLandNumberCultivated: 0.0 Acres
LandExtentAvailable: -1.0_Acres
IsRequiredLandExtentAvailable: false

Required: 1 Perches
Total: 10 Square Metres
TotalLandNumberCultivated: 0.08 Perches
LandExtentAvailable: -0.68_Perches
IsRequiredLandExtentAvailable: false

Required: 10 Square Feet
Total: 10 Square Metres
TotalLandNumberCultivated: 21.52 Square Feet
LandExtentAvailable: 76.12_Square Feet
IsRequiredLandExtentAvailable: true
*/
