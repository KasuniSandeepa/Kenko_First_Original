/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import services.*;
import services.CropTypesServices;

import java.sql.Connection;

/**
 * @author NCCS
 */
public class PrerequisitesSave {

    private static String[] StringArray;
    private static String TableName;

//    public static void main(String[] args) {
//        ProfileTypesSave();
//        //needs ProfileTypes
//        ProfilesSave();
//        //for progresses save
//        ProgressTypesSave();
//        //
//        FertilizerTypesSave();
//        FertilizersSave();
//        //
//        PesticideTypesSave();
//        PesticidesSave();
//        //for crops save
//        SeedTypesSave();
//        //needs SeedTypes
//        SeedsSave();
//        CropTypesSave();
//        //need CropTypes
//        CropTypeVarietiesSave();
//        //needs SeedTypes, CropTypeVariety
//        YieldsSave();
//        YieldsUpdate();
//    }

    private static void ProfileTypesSave() {
        TableName = "profiletypes";
        StringArray = new String[]{"Farmer", "Admin", "Super Admin"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void CropStatesSave() {
        TableName = "cropstates";
        StringArray = new String[]{"Grown", "Not Grown"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void LandStatesSave() {
        TableName = "landstates";
        StringArray = new String[]{"Dry LandDetails", "Wet LandDetails"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void ProvincesSave() {
        TableName = "provinces";
        StringArray = new String[]{"Western", "Central"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void ProfilesSave() {
        int Rows = 0, SavedLoginDetails = 0;
        String[] User_01 = {"John_Doe", "911504123X", "1991-05-29", "Male", "0712222222", "john123"};
        String[] User_02 = {"Mary_Jane", "916004123V", "1991-04-09", "Female", "0723333333", "mary123"};
        String[] User_03 = {"Diana_Walker", "925014123V", "1992-01-01", "Female", "0734444444", "diana123"};
        String[] User_04 = {"Eric_McLaggen", "922524123X", "1992-09-08", "Male", "0745555555", "eric123"};
        String[] User_05 = {"Asanka_Bandara", "923654123V", "1992-12-30", "Male", "0756666666", "asanka123"};
        TableName = "profiles";
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection DatabaseConnection = null;
            try {
                DatabaseConnection = new DatabaseConnection();
                Connection Connection = DatabaseConnection.ConnectionGet();

                //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, Address, PhotoUrl, Province, District,
                // GnArea, LandState, CropState, RegisteredDate, Uuid, FkProfileTypes

                String SqlQuery01 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid, FkProfileTypes)"
                        + " VALUES('" + User_01[0] + "','" + User_01[1] + "','" + User_01[2] + "','" + User_01[3] + "','"
                        + User_01[4] + "','Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGenerate() + "',3)";
                Connection.createStatement().executeUpdate(SqlQuery01);
                //--save log-in details
                SavedLoginDetails+=
                        LogInDetailsSave(User_01[4], User_01[5], new ProfilesServices().PkProfilesForProfileAddGet(User_01[1], User_01[4]));
                Rows++;

                String SqlQuery02 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid, FkProfileTypes)"
                        + " VALUES('" + User_02[0] + "','" + User_02[1] + "','" + User_02[2] + "','" + User_02[3] + "','"
                        + User_02[4] + "','Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGenerate() + "',2)";
                Connection.createStatement().executeUpdate(SqlQuery02);
                //--save log-in details
                SavedLoginDetails+=
                        LogInDetailsSave(User_02[4], User_02[5], new ProfilesServices().PkProfilesForProfileAddGet(User_02[1], User_02[4]));
                Rows++;

                String SqlQuery03 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid, FkProfileTypes)"
                        + " VALUES('" + User_03[0] + "','" + User_03[1] + "','" + User_03[2] + "','" + User_03[3] + "','"
                        + User_03[4] + "','Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGenerate() + "',1)";
                Connection.createStatement().executeUpdate(SqlQuery03);
                //--save log-in details
                SavedLoginDetails+=
                        LogInDetailsSave(User_03[4], User_03[5], new ProfilesServices().PkProfilesForProfileAddGet(User_03[1], User_03[4]));
                Rows++;

                String SqlQuery04 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid, FkProfileTypes)"
                        + " VALUES('" + User_04[0] + "','" + User_04[1] + "','" + User_04[2] + "','" + User_04[3] + "','"
                        + User_04[4] + "','Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGenerate() + "',1)";
                Connection.createStatement().executeUpdate(SqlQuery04);
                //--save log-in details
                SavedLoginDetails+=
                        LogInDetailsSave(User_04[4], User_04[5], new ProfilesServices().PkProfilesForProfileAddGet(User_04[1], User_04[4]));
                Rows++;

                String SqlQuery05 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid, FkProfileTypes)"
                        + " VALUES('" + User_05[0] + "','" + User_05[1] + "','" + User_05[2] + "','" + User_05[3] + "','"
                        + User_05[4] + "','Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGenerate() + "',1)";
                Connection.createStatement().executeUpdate(SqlQuery05);
                //--save log-in details
                SavedLoginDetails+=
                        LogInDetailsSave(User_05[4], User_05[5], new ProfilesServices().PkProfilesForProfileAddGet(User_05[1], User_05[4]));
                Rows++;

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    //close ssh connection
                    DatabaseConnection.ConnectionClose();
                } catch (Exception e) {
                }
            }
            System.out.println("affected rows in " + TableName + ": " + Rows);
            System.out.println("affected rows in " + "profilelogindetails" + ": " + SavedLoginDetails);

        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static int LogInDetailsSave(String MobileNumber, String Password, int PkProfiles) {
//        boolean IsLogInDetailsSaved = false;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
            String SqlQuery = "INSERT INTO profilelogindetails(MobileNumber, Password, FkProfiles) "
                    + "VALUES('" + MobileNumber + "','" + Password + "'," + PkProfiles + ")";
            Connection.createStatement().executeUpdate(SqlQuery);
//            System.out.println("IsLogInDetailsSaved=true");
//            IsLogInDetailsSaved = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
//        return IsLogInDetailsSaved;
        return 1;
    }

    private static void CropTypesSave() {
        int Rows = 0;
        TableName = "croptypes";
//        StringArray = new String[]{"Carrot", "Leeks", "Beans", "Onion", "Tomato", "Papaya", "Banana"};
        String[] GrowthDays =
                new String[]{"90 Days", "115 Days", "45 Days", "90 Days", "40 Days", "180 Days", "270 Days"};
        String Name = "", DefaultImage = "", GrowthTime = "";

        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (String S : Strings.CROPS_ENGLISH
            ) {
                Name = Strings.TextPrettyPrint(S);
                DefaultImage = Strings.TextPrettyPrintInverse(S).concat(".png");
//                System.out.println(Name + ", " + DefaultImage);
//            }

//            for (int i = 0; i < StringArray.length && i < GrowthDays.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
//                    String SqlQuery = "INSERT INTO " + TableName
//                            + "(Name, GrowthDuration, DefaultImage) VALUES('" + StringArray[i]
//                            + "','" + GrowthDays[i] + "')";

                    String SqlQuery = "INSERT INTO " + TableName + "(Name, GrowthDuration, DefaultImage) " +
                            "VALUES('" + Name + "','90 Days','" + DefaultImage + "')";

                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        //close ssh connection
                        Ssh.ConnectionClose();
                    } catch (Exception e) {
                    }
                }

            }
            System.out.println("affected rows in " + TableName + ": " + Rows);

        } else {
            System.out.println("Data already present in " + TableName);
        }

    }

    private static void CropTypeVarietiesSave() {
        int Rows = 0;
        TableName = "croptypevarieties";

        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            String Name = "", Variety = "";
            int PkCropTypes = 0;
            CropTypesServices CropTypesServices = new CropTypesServices();

            for (String S : Strings.YIELDS) {
                Name = S.split(",")[0];
                Variety = S.split(",")[1];
                PkCropTypes = CropTypesServices.PkCropTypesGet(Name);
                if (PkCropTypes != 0) {
//                    System.out.println(PkCropTypes + ", " + Name + ", " + Variety);
                    //--
                    try {
                        Ssh = new DatabaseConnection();
                        Connection Connection = Ssh.ConnectionGet();
                        //Name, FkCropTypes
                        String SqlQuery = "INSERT INTO " + TableName + "(Name, FkCropTypes) " +
                                "VALUES('" + Variety + "'," + PkCropTypes + ")";
                        Connection.createStatement().executeUpdate(SqlQuery);
                        Rows++;
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            Ssh.ConnectionClose();
                        } catch (Exception e) {
                        }
                    }
                    //--
                }
            }
            System.out.println("affected rows in " + TableName + ": " + Rows);

        } else {
            System.out.println("Data already present in " + TableName);
        }

    }

    private static void YieldsSave() {
        int Rows = 0;
        TableName = "yields";
        String Yield = "";

        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            int FkSeedTypes = 1, PkCropTypes = 0, PkCropTypeVarieties = 0;
            String CropType = "", CropTypeVariety = "";
            CropTypesServices CropTypesServices = new CropTypesServices();
            CropTypeVarietiesServices CropTypeVarietiesServices = new CropTypeVarietiesServices();

            for (int i = 0; i < Strings.YIELDS.length; i++) {
                CropType = Strings.YIELDS[i].split(",")[0];
                CropTypeVariety = Strings.YIELDS[i].split(",")[1];
                Yield = Strings.YIELDS[i].split(",")[2];
                PkCropTypes = CropTypesServices.PkCropTypesGet(CropType);
                PkCropTypeVarieties = CropTypeVarietiesServices.PkCropTypeVarietiesGet(CropType);
                //--
                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    //PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, FkCropTypeVarieties
                    String SqlQuery = "INSERT INTO " + TableName +
                            "(YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, FkCropTypeVarieties) " +
                            "VALUES('30 Days','10 Days','" + Yield + "'," + FkSeedTypes + ",'" + PkCropTypeVarieties + "')";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        //close ssh connection
                        Ssh.ConnectionClose();
                    } catch (Exception e) {
                    }
                }
                //--
            }
            System.out.println("affected rows in " + TableName + ": " + Rows);
        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void YieldsUpdate() {
        int Rows = 0;
        TableName = "yields";
        String Yield = "";

//        if (DatabaseCheck.IsTableEmpty(TableName)) {

        DatabaseConnection Ssh = null;

        int MaxCount = new CropTypeVarietiesServices().CropTypeVarietiesListGet().size();
//            System.out.println("MaxCount: " + MaxCount);

        for (int i = 0; i < MaxCount; i++) {
//                System.out.println("index: "+(i+1));
            //--
            try {
                Ssh = new DatabaseConnection();
                Connection Connection = Ssh.ConnectionGet();
                String SqlQuery = "UPDATE " + TableName +
                        " SET FkCropTypeVarieties=" + (i + 1) + "" +
                        " WHERE PkYields=" + (i + 1) + "";
                Connection.createStatement().executeUpdate(SqlQuery);
                Rows++;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    Ssh.ConnectionClose();
                } catch (Exception e) {
                }
            }
            //--
        }
        System.out.println("updated rows in " + TableName + ": " + Rows);
//        } else {
//            System.out.println("Data already present in " + TableName);
//        }
    }

    private static void SeedTypesSave() {
        TableName = "seedtypes";
        StringArray = new String[]{"None", "Carrot", "Beans"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void SeedsSave() {
        int Rows = 0;
        TableName = "seeds";
        StringArray = new String[]{"None", "B612-D", "G1FG-3"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    String SqlQuery = "INSERT INTO " + TableName
                            + "(Name, FkSeedTypes) VALUES('" + StringArray[i] + "',1)";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        //close ssh connection
                        Ssh.ConnectionClose();
                    } catch (Exception e) {
                    }
                }

            }
            System.out.println("affected rows in " + TableName + ": " + Rows);
        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void ProgressTypesSave() {
        int Rows = 0;
        TableName = "progresstypes";
        StringArray = new String[]{
                "Weeded", "Watered", "Applied Fertilizer", "Damaged",
                "Harvested", "Pest Controlled"
        };
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void FertilizerTypesSave() {
        TableName = "fertilizertypes";
        StringArray = new String[]{
                "None", "Organic Fertilizer", "Animal Manure", "Green Manure", "Compost", "Other Fertilizer",
                "Liquid Fertilizer"
        };
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void FertilizersSave() {
        int Rows = 0;
        TableName = "fertilizers";
        StringArray = new String[]{"Urea", "Ammonium Sulphate"};
        String[] UsedFors = new String[]{"Yellow Leaves", "Root Rotting"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length && i < UsedFors.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    //PkFertilizers, Name, UsedFor, FkFertilizerTypes
                    String SqlQuery = "INSERT INTO " + TableName + "(Name, UsedFor, FkFertilizerTypes)" +
                            " VALUES('" + StringArray[i] + "','" + UsedFors[i] + "',1)";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        //close ssh connection
                        Ssh.ConnectionClose();
                    } catch (Exception e) {
                    }
                }

            }
            System.out.println("affected rows in " + TableName + ": " + Rows);

        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void PesticideTypesSave() {
        TableName = "pesticidetypes";
        StringArray = new String[]{"None", "Organic Pesticide", "Chemical Pesticide"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void PesticidesSave() {
        int Rows = 0;
        TableName = "pesticides";
        StringArray = new String[]{"Del-Z", "Ahura"};
        String[] UsedFors = new String[]{"Bugs", "Worms"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length && i < UsedFors.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    String SqlQuery = "INSERT INTO " + TableName + "(Name, UsedFor, FkPesticideTypes)" +
                            " VALUES('" + StringArray[i] + "','" + UsedFors[i] + "',1)";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        //close ssh connection
                        Ssh.ConnectionClose();
                    } catch (Exception e) {
                    }
                }

            }
            System.out.println("affected rows in " + TableName + ": " + Rows);

        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

}
