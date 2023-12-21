package services;

import models.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import static services.DatabaseCheck.ResultGet;
import static services.LandAreaServices.LandExtentAmountFromSquareFeet;
import static services.LandAreaServices.LandExtentAmountToSquareFeet;

public class LandDetailsServices {

//    public static void main(String[] args) {
//        CropsServices CropsServices = new CropsServices();
//        String LandExtentAvailable = CropsServices.LandExtentAvailableGet(1);
//        System.out.println("LandExtentAvailable: " + LandExtentAvailable);
//        System.out.println("IsRequiredLandExtentAvailable: " + CropsServices.IsRequiredLandExtentAvailable);
////        System.out.println("LandExtentCultivatedInSquareFeetGet: " +
////                CropsService.LandExtentCultivatedInSquareFeetGet(3));
//    }

    public List<LandDetails> LandDetailsOfProfilePaginatedGet(int PkProfiles, int Start, int Total) {
        List<LandDetails> LandDetailsList = new LinkedList<>();
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent, Measurements,
            // CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkLandDetails, Name, Address, Province, District, GNArea, LandType, " +
                            "LandExtent, Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, " +
                            "FkProfiles" +
                            " FROM landdetails" +
                            " WHERE FkProfiles ='" + PkProfiles + "'" +
                            " ORDER BY PkLandDetails DESC" +
                            " LIMIT " + (Start - 1) + "," + Total + "");
            //--static object for the list
            Profiles Profiles = new ProfilesServices().ProfilesGet(PkProfiles);
            while (ResultSet.next()) {
                LandDetailsList.add(new LandDetails(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        ResultSet.getString(9),
                        ResultSet.getString(10),
                        ResultSet.getString(11),
                        ResultSet.getString(12),
                        ResultSet.getString(13),
                        ResultSet.getString(14),
                        Profiles
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
        return LandDetailsList;
    }

    public LandDetails LandDetailsGet(int PkLandDetails) {
        LandDetails LandDetails = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent, Measurements,
            // CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
            String SqlQuery = "SELECT PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent, " +
                    "Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles " +
                    " FROM landdetails" +
                    " WHERE PkLandDetails=" + PkLandDetails + "";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                //dummy objects
//                CultivationStates CultivationStates =
//                        new CultivationStates(1, ResultSet.getString(10));
//                OwnershipStates OwnershipStates =
//                        new OwnershipStates(1, ResultSet.getString(11));
                //--real objects
                int PkProfiles = Integer.parseInt(ResultSet.getString(15));
                LandDetails = new LandDetails(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        ResultSet.getString(9),
                        ResultSet.getString(10),
                        ResultSet.getString(11),
                        ResultSet.getString(12),
                        ResultSet.getString(13),
                        ResultSet.getString(14),
                        new ProfilesServices().ProfilesGet(PkProfiles));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return LandDetails;
    }

    public boolean IsRequiredLandExtentAvailable = false;

    public String LandExtentAvailableGet(int PkLandDetails, String LandExtentRequired) {
        String Total = "", Available = "";
        int TotalNumber = 0, RequiredNumber = 0;
        double AvailableNumber = 0.0, TotalLandNumberBalanced = 0.0, TotalLandNumberCultivatedInSquareFeet = 0.0;
        String TotalUnit = "", RequiredUnit = "", AvailableUnit = "";

        RequiredNumber = Integer.parseInt(LandExtentRequired.split("_")[0]);
        RequiredUnit = LandExtentRequired.split("_")[1];
//        System.out.println("Required: " + RequiredNumber + " " + RequiredUnit);

        Total = LandExtentTotalGet(PkLandDetails);
        TotalNumber = Integer.parseInt(Total.split("_")[0]);
        TotalUnit = Total.split("_")[1];
//        System.out.println("Total: " + TotalNumber + " " + TotalUnit);

//        System.out.println("LandExtentAmountToSquareFeet: " +
//                LandExtentAmountToSquareFeet(RequiredNumber, RequiredUnit));

//        Required = LandExtentRequired(PkCrops).split("_")[0];
//        double AvailableNumberInFeet = (LandExtentAmountToSquareFeet(TotalNumber, TotalUnit) -
//                LandExtentAmountToSquareFeet(RequiredNumber, RequiredUnit));

        TotalLandNumberCultivatedInSquareFeet = LandExtentCultivatedInSquareFeetGet(PkLandDetails);
//        System.out.println("TotalLandNumberCultivated: " +
//                LandExtentAmountFromSquareFeet(TotalLandNumberCultivatedInSquareFeet, RequiredUnit) +
//                " " + RequiredUnit);
        TotalLandNumberBalanced = LandExtentAmountToSquareFeet(TotalNumber, TotalUnit) -
                TotalLandNumberCultivatedInSquareFeet;
        double AvailableNumberInFeet = TotalLandNumberBalanced -
                LandExtentAmountToSquareFeet(RequiredNumber, RequiredUnit);

        //needs to convert back to original unit
        AvailableNumber = LandExtentAmountFromSquareFeet(AvailableNumberInFeet, RequiredUnit);
        if (AvailableNumber >= 0.0) {
            IsRequiredLandExtentAvailable = true;
        }
//        System.out.println("IsRequiredLandExtentAvailable=" + IsRequiredLandExtentAvailable);
        //
        Available = String.valueOf(AvailableNumber + "_" + RequiredUnit);

        return Available;
    }

    public String LandExtentAvailableGet(int PkLandDetails) {
        String Total = "", Available = "";
        int TotalNumber = 0, RequiredNumber = 0;
        double AvailableNumber = 0.0, TotalLandNumberBalanced = 0.0, TotalLandNumberCultivatedInSquareFeet = 0.0;
        String TotalUnit = "";
//        String RequiredUnit = "", AvailableUnit = "";

        Total = LandExtentTotalGet(PkLandDetails);
        TotalNumber = Integer.parseInt(Total.split("_")[0]);
        TotalUnit = Total.split("_")[1];
//        System.out.println("Total: " + TotalNumber + " " + TotalUnit);

        TotalLandNumberCultivatedInSquareFeet = LandExtentCultivatedInSquareFeetGet(PkLandDetails);
//        System.out.println("TotalLandNumberCultivated: " +
//                LandExtentAmountFromSquareFeet(TotalLandNumberCultivatedInSquareFeet, RequiredUnit) +
//                " " + RequiredUnit);
        TotalLandNumberBalanced = LandExtentAmountToSquareFeet(TotalNumber, TotalUnit) -
                TotalLandNumberCultivatedInSquareFeet;
        double AvailableNumberInFeet = TotalLandNumberBalanced -
                LandExtentAmountToSquareFeet(RequiredNumber, TotalUnit);

        //needs to convert back to original unit
        AvailableNumber = LandExtentAmountFromSquareFeet(AvailableNumberInFeet, TotalUnit);
        if (AvailableNumber >= 0.0) {
            IsRequiredLandExtentAvailable = true;
        }
//        System.out.println("IsRequiredLandExtentAvailable=" + IsRequiredLandExtentAvailable);
        //
        Available = String.valueOf(AvailableNumber + "_" + TotalUnit);

        return Available;
    }

    private double LandExtentCultivatedInSquareFeetGet(int PkLandDetails) {
        double TotalGrownLandExtent = 0.0;
        String SqlQuery = "SELECT CultivatedLandArea " +
                "FROM crops " +
                "WHERE FkLandDetails=" + PkLandDetails;
        List<LandArea> LandAreaList = LandAreaListOfCropsGet(SqlQuery);
        for (LandArea LandArea : LandAreaList
        ) {
//            TotalGrownLandExtent += (double) LandArea.getNumber();
            TotalGrownLandExtent += LandExtentAmountToSquareFeet(LandArea.getNumber(), LandArea.getUnit());
//            System.out.println("TotalGrownLandExtent: " + TotalGrownLandExtent);
        }
        return TotalGrownLandExtent;
    }

    private List<LandArea> LandAreaListOfCropsGet(String SqlQuery) {
        List<LandArea> LandAreaList = null;
        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            LandAreaList = new LinkedList<>();
            int Number = 0;
            String Unit = "";
            String NumberString = "";
            while (ResultSet.next()) {
                NumberString = ResultSet.getString(1).split("_")[0];
                try {
                    Number = Integer.parseInt(NumberString);
                } catch (Exception e) {
                    Number = Integer.parseInt(NumberString.split("x")[0]) *
                            Integer.parseInt(NumberString.split("x")[1]) *
                            Integer.parseInt(NumberString.split("x")[2]);
                }
                Unit = ResultSet.getString(1).split("_")[1];
                LandAreaList.add(new LandArea(Number, Unit));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return LandAreaList;
    }

    private String LandExtentTotalGet(int PkLandDetails) {
        String Result = "";
        String SqlQuery = "SELECT LandExtent " +
                "FROM landdetails " +
                "WHERE PkLandDetails=" + PkLandDetails;
        Result = ResultGet(SqlQuery);
        return Result;
    }

    public static String LandTypeImageUrlGet(String LandType) {
        String ImageUrl = "";
        switch (LandType) {
            case "Dry Land":
                ImageUrl = "dist-assets/images/custom/dry-land.png";
                break;
            case "Wet Land":
                ImageUrl = "dist-assets/images/custom/wet-land.png";
                break;
            case "Greenhouse":
                ImageUrl = "dist-assets/images/custom/greenhouse.png";
                break;
        }
        return ImageUrl;
    }

    public static String LandOwnershipTypeImageUrlGet(String LandOwnershipType) {
        String ImageUrl = "";
        switch (LandOwnershipType) {
            case "Owned":
                ImageUrl = "dist-assets/images/custom/rented.png";
                break;
            case "Rented":
                ImageUrl = "dist-assets/images/custom/owned.png";
                break;
        }
        return ImageUrl;
    }

    public boolean IsLandDetailsNameExistsInDatabase(int PkProfiles, String LandName) {
        boolean IsLandDetailsNameExistsInDatabase = false;

        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();

            String SqlQuery = "SELECT Name" +
                    " FROM landdetails" +
                    " WHERE Name='" + LandName + "' AND FkProfiles=" + PkProfiles + "";

            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);

            if (ResultSet.next()) {
                IsLandDetailsNameExistsInDatabase = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }

        return IsLandDetailsNameExistsInDatabase;
    }

    public void LandDetailsPrint(int PkLandDetails) {
        LandDetails p = new LandDetailsServices().LandDetailsGet(PkLandDetails);
        System.out.println(p.getPkLandDetails() + ", " + p.getName() + ", "
                + p.getAddress() + ", " + p.getProvince() + ", "
                + p.getDistrict() + ", " + p.getGNArea() + "\n"
                + p.getLandType() + ", " + p.getLandExtent() + ", "
                + p.getMeasurements() + ", " + p.getCultivationState() + ", "
                + p.getOwnershipState() + ", " + p.getLongitude() + "\n"
                + p.getLatitude() + ", " + p.getPhotoUrl() + ", "
                + p.getProfiles().getName());
    }

//    public LandDetails LandDetailsGet(int PkLandDetails) {
//        LandDetails landDetailsDetails = null;
//
//        DatabaseConnection Ssh = null;
//        try {
//            Ssh = new DatabaseConnection();
//            Connection Connection = Ssh.ConnectionGet();
//
//            //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
//            // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
//            String SqlQuery = "SELECT PkLandDetails, Name, Address, Province, District, GNArea," +
//                    " LandType, LandExtent, Measurements, CultivationState, OwnershipState, Longitude," +
//                    " Latitude, PhotoUrl, FkProfiles" +
//                    " FROM landdetails" +
//                    " WHERE PkLandDetails=" + PkLandDetails + "";
//
//            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
//
//            if (ResultSet.next()) {
//                landDetailsDetails = new LandDetails(
//                        Integer.parseInt(ResultSet.getString(1)),
//                        ResultSet.getString(2),
//                        ResultSet.getString(3),
//                        ResultSet.getString(4),
//                        ResultSet.getString(5),
//                        ResultSet.getString(6),
//                        ResultSet.getString(7),
//                        ResultSet.getString(8),
//                        ResultSet.getString(9),
//                        ResultSet.getString(10),
//                        ResultSet.getString(11),
//                        ResultSet.getString(12),
//                        ResultSet.getString(13),
//                        ResultSet.getString(14),
//                        Integer.parseInt(ResultSet.getString(15))
//                );
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                //close ssh connection
//                Ssh.ConnectionClose();
//            } catch (Exception e) {
//            }
//        }
//        return landDetailsDetails;
//    }

}
