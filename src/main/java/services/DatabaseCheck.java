/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.ResultSet;

/**
 * @author NCCS
 */
public class DatabaseCheck {

//    public static void main(String[] args) {
//        ProfilesCheck("v", "mary123");
//        System.out.println("ProfileRegisteredDateGet: "
//                + ProfileRegisteredDateGet(1).split(" ")[0]);
//        System.out.println("CropCountOfLandGet: "
//                + CropCountOfLandGet(1));
//        System.out.println("StatusCountOfCropGet: "
//                + StatusCountOfCropGet(1));
//        System.out.println("CropCountOfProfilesGet: "
//                + CropCountOfProfilesGet(1));
//        System.out.println("LandCountOfProfilesGet: "
//                + LandCountOfProfilesGet(1));
//        Profiles p = Profiles.LandDetailsGet(1);
//        System.out.println(p.getPkProfiles() + ", " + p.getName() + ", "
//                + p.getMobileNumber() + ", " + p.getAddress());
//        System.out.println("LandNameGet: "
//                + LandNameGet(1));
//        System.out.println("CropNameGet: "
//                + CropNameGet(1));
//    }

    private static void ProfilesCheck(String MobileNumber, String Password) {
        DatabaseConnection Ssh = null;
        int ProfilesId = 0;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            String SqlQuery = "SELECT PkProfiles, MobileNumber, Password" +
                    " FROM profiles" +
                    " WHERE MobileNumber='" + MobileNumber + "'" +
                    " AND Password='" + Password + "'";

            ResultSet ResultSetSignIn = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSetSignIn.next()) {
                ProfilesId = Integer.parseInt(ResultSetSignIn.getString(1));
                System.out.println("ProfilesId: " + ProfilesId);
            }
            if (ProfilesId == 0) {
                System.out.println("ProfilesId=0");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }

    }

    //synchronized
    public static synchronized String ResultGet(String SqlQuery) {
        String Result = "";
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                Result = ResultSet.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return Result;
    }

    //synchronized
    public static synchronized int LandCountOfProfilesGet(int FkProfiles) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM landdetails" +
                " WHERE FkProfiles ='" + FkProfiles + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int CropCountOfProfilesGet(int PkProfiles) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM crops c " +
                " INNER JOIN landdetails l ON c.FkLandDetails=l.PkLandDetails " +
                " INNER JOIN profiles p ON l.FkProfiles=p.PkProfiles " +
                " WHERE PkProfiles ='" + PkProfiles + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int CropCountOfLandGet(int PkLandDetails) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM crops " +
                " WHERE FkLandDetails='" + PkLandDetails + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int StatusCountOfCropGet(int PkCrops) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM progresses " +
                " WHERE FkCrops='" + PkCrops + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int RowCountGet(String SqlQuery) {
        int Count = 0;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                Count = Integer.parseInt(ResultSet.getString("COUNT(*)"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return Count;
    }

    public static void InsertIntoTable(String[] stringArray, String tableName) {
        int Rows = 0;
        if (DatabaseCheck.IsTableEmpty(tableName)) {
            DatabaseConnection DatabaseConnection = null;
            try {
                DatabaseConnection = new DatabaseConnection();
                Connection Connection = DatabaseConnection.ConnectionGet();
                String SqlQuery = "";
                for (String Value : stringArray) {
                    SqlQuery = "INSERT INTO " + tableName + "(Name)" +
                            " VALUES('" + Value + "')";
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    DatabaseConnection.ConnectionClose();
                } catch (Exception e) {
                }
            }
            System.out.println("affected rows in " + tableName + ": " + Rows);
        } else {
            System.out.println("no of data present in " + tableName + ": "
                    + DatabaseCheck.GetRowCount(tableName));
        }
    }

    public static boolean IsTableEmpty(String tableName) {
        boolean IsTableEmpty = true;
        if (GetRowCount(tableName) > 0) {
            IsTableEmpty = false;
        }
        return IsTableEmpty;
    }

    public static int GetRowCount(String tableName) {
        int RowCount = 0;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            String SqlQuery = "SELECT COUNT(*) FROM " + tableName;
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                RowCount = Integer.parseInt(ResultSet.getString("COUNT(*)"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return RowCount;
    }

    public static int MinimumPrimaryKeyGet(String tableName) {
        int MinimumPrimaryKey = 0;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            String SqlQuery = "SELECT MIN(*) FROM " + tableName;
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                MinimumPrimaryKey = Integer.parseInt(ResultSet.getString("COUNT(*)"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return MinimumPrimaryKey;
    }

    //--synchronized
    public static synchronized int PrimaryKeyGet(String SqlQuery) {
        int Id = 0;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                Id = Integer.parseInt(ResultSet.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return Id;
    }

}
