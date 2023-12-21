package services;

import models.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class YieldsServices {

//    public static void main(String[] args) {
//        System.out.println("MinimumPkYields: " + new YieldsServices().MinimumPkYieldsGet());
//    }

    public List<Yields> YieldsListOfCropTypeGet(int PkCropTypes) {
        List<Yields> YieldsList = new LinkedList<>();
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, FkCropTypeVarieties
            String SqlQuery = "SELECT y.PkYields, y.YieldDuration, y.DurationTillYield, y.StandardYield, y.FkSeedTypes, " +
                    "y.FkCropTypeVarieties " +
                    "FROM yields y " +
                    "INNER JOIN croptypevarieties ctv ON y.FkCropTypeVarieties=ctv.PkCropTypeVarieties " +
                    "INNER JOIN croptypes ct ON ctv.FkCropTypes=ct.PkCropTypes " +
                    "WHERE PkCropTypes='" + PkCropTypes + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            int PkSeedTypes = 0, PkCropTypeVarieties = 0;
            while (ResultSet.next()) {
                PkSeedTypes=Integer.parseInt(ResultSet.getString(5));
                PkCropTypeVarieties=Integer.parseInt(ResultSet.getString(6));
                YieldsList.add(new Yields(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes),
                        new CropTypeVarietiesServices().CropTypeVarietiesGet(PkCropTypeVarieties)
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
        return YieldsList;
        //--
//        return YieldOfCropType;
    }

    public List<Yields> YieldsListGet() {
        List<Yields> YieldsList = new LinkedList<>();
        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, FkCropTypeVarieties
            String SqlQuery = "SELECT PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, " +
                    "FkCropTypeVarieties " +
                    "FROM yields";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            int PkSeedTypes = 0, PkCropTypeVarieties = 0;
            while (ResultSet.next()) {
                PkSeedTypes=Integer.parseInt(ResultSet.getString(5));
                PkCropTypeVarieties=Integer.parseInt(ResultSet.getString(6));
                YieldsList.add(new Yields(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes),
                        new CropTypeVarietiesServices().CropTypeVarietiesGet(PkCropTypeVarieties)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }

        return YieldsList;
    }

    //synchronized
    public synchronized Yields YieldsGet(int PkYields) {
        Yields Yields = null;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, FkCropTypeVarieties
            String SqlQuery = "SELECT PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, " +
                    "FkCropTypeVarieties " +
                    "FROM yields " +
                    "WHERE PkYields='" + PkYields + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                int PkSeedTypes = Integer.parseInt(ResultSet.getString(5));
                int PkCropTypeVarieties = Integer.parseInt(ResultSet.getString(6));
                Yields = new Yields(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        new SeedTypesServices().SeedTypesGet(PkSeedTypes),
                        new CropTypeVarietiesServices().CropTypeVarietiesGet(PkCropTypeVarieties)
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
        return Yields;
    }

    public int MinimumPkYieldsGet() {
        int MinimumPkYields = 0;
        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            String SqlQuery = "SELECT MIN(PkYields) " +
                    "FROM yields";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                MinimumPkYields = Integer.parseInt(ResultSet.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return MinimumPkYields;
    }

}

/*
Beans, Bush Bean, 6-10 t/ha
Beans, Pole Bean, 9-12 t/ha
Beetroot, Hybrid, 16-18 t/ha
Beetroot, Non Hybrid, 12-15 t/ha
Bitter Gourd, Standard, 15 t/ha
Brinjal, Amanda(F1 Hybrid), 30-35 t/ha
Brinjal, Anjalee(F1 Hybrid), 30-40 t/ha
Brinjal, SM-64, 15-18 t/ha
Bitter Gourd, Standard, 18.03 t/ha
Capsicum, C.A. - 8 (Dry Zone), 10-15 t/ha
Capsicum, C.A. - 8 (Wet Zone), 6-8 t/ha
Capsicum, H.Y.W., 10-15 t/ha
Beetroot, Hybrid, 55-60 t/ha
Beetroot, Non Hybrid, 30-35 t/ha
Bitter Gourd, Standard, 30-40 t/ha
Bitter Gourd, Standard, 10-15 t/ha
Bitter Gourd, Standard, 15000-25000 kg/ha
Radish, Beeralu, 20-30 t/ha
Radish, Japanese Ball, 40-50 t/ha
Bitter Gourd, Standard, 20-30 t/ha
*/
