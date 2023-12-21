package services;

import models.CropTypeVarieties;
import models.CropTypeVariety;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import static services.DatabaseCheck.PrimaryKeyGet;

public class CropTypeVarietiesServices {

//    public static void main(String[] args) {
//        CropTypeVariety CropTypeVariety = CropTypeVarietyGet(1);
//        System.out.println(CropTypeVariety.get_PkCropTypeVarieties() + ", " + CropTypeVariety.get_Name() + ", " +
//                CropTypeVariety.get_FkCropTypes());
//        //1, Bush Bean, 6
//        System.out.println("PkCropTypeVarieties: " +
//                new CropTypeVarietiesServices().PkCropTypeVarietiesGet("Amanda(F1 Hybrid)"));
//        List<CropTypeVariety> CropTypeVarietiesList = new CropTypeVarietiesServices().CropTypeVarietiesListGet();
//        for (CropTypeVariety C : CropTypeVarietiesList
//        ) {
//            System.out.println(C.get_PkCropTypeVarieties() + ", " + C.get_Name() + ", " + C.get_FkCropTypes());
//        }
//    }

    public CropTypeVarieties CropTypeVarietiesGet(int PkCropTypeVarieties) {
        CropTypeVarieties CropTypeVarieties = null;
        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //PkCropTypeVarieties, Name, FkCropTypes
            String SqlQuery = "SELECT PkCropTypeVarieties, Name, FkCropTypes " +
                    "FROM croptypevarieties " +
                    "WHERE PkCropTypeVarieties='" + PkCropTypeVarieties + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                int PkCropTypes = Integer.parseInt(ResultSet.getString(3));
                CropTypeVarieties = new CropTypeVarieties(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        new CropTypesServices().CropTypesGet(PkCropTypes)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return CropTypeVarieties;
    }

    public List<CropTypeVariety> CropTypeVarietiesListGet() {
        List<CropTypeVariety> cropTypeVarietyList = null;

        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            String SqlQuery = "SELECT * " +
                    "FROM croptypevarieties";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            cropTypeVarietyList = new LinkedList<>();
            while (ResultSet.next()) {
                cropTypeVarietyList.add(new CropTypeVariety(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        Integer.parseInt(ResultSet.getString(3))
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

        return cropTypeVarietyList;
    }

    public int PkCropTypeVarietiesGet(String CropType) {
        int PkCropTypeVarieties = 0;
        String SqlQuery = "SELECT ctv.PkCropTypeVarieties " +
                "FROM croptypevarieties ctv " +
                "INNER JOIN croptypes ct ON ctv.FkCropTypes=ct.PkCropTypes " +
                "WHERE ct.Name='" + CropType + "'";
        PkCropTypeVarieties = PrimaryKeyGet(SqlQuery);
        return PkCropTypeVarieties;
    }

//    public int PkCropTypeVarietiesGet(String CropTypeVariety) {
//        int PkCropTypeVarieties = 0;
//        String SqlQuery = "SELECT PkCropTypeVarieties " +
//                "FROM croptypevarieties " +
//                "WHERE Name='" + CropTypeVariety + "'";
//        PkCropTypeVarieties = PrimaryKeyGet(SqlQuery);
//        return PkCropTypeVarieties;
//    }

    public static CropTypeVariety CropTypeVarietyGet(int PkCropTypeVarieties) {
        CropTypeVariety CropTypeVariety = null;

        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            String SqlQuery = "SELECT * " +
                    "FROM croptypevarieties " +
                    "WHERE PkCropTypeVarieties='" + PkCropTypeVarieties + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                CropTypeVariety = new CropTypeVariety(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        Integer.parseInt(ResultSet.getString(3))
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }

        return CropTypeVariety;
    }

}
