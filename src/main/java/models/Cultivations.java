package models;

import java.sql.Date;

public class Cultivations {

    //PkCultivations, ExtentOfCultivation, DateStart, DateEnd, FkCrops, FkLandDetails, FkProgresses
    private int PkCultivations;
    private String ExtentOfCultivation;
    private Date DateStart, DateEnd;
    private models.Crops Crops;
    private LandDetails LandDetails;
    private models.Progresses Progresses;

    public int getPkCultivations() {
        return PkCultivations;
    }

    public void setPkCultivations(int pkCultivations) {
        PkCultivations = pkCultivations;
    }

    public String getExtentOfCultivation() {
        return ExtentOfCultivation;
    }

    public void setExtentOfCultivation(String extentOfCultivation) {
        ExtentOfCultivation = extentOfCultivation;
    }

    public Date getDateStart() {
        return DateStart;
    }

    public void setDateStart(Date dateStart) {
        DateStart = dateStart;
    }

    public Date getDateEnd() {
        return DateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        DateEnd = dateEnd;
    }

    public models.Crops getCrops() {
        return Crops;
    }

    public void setCrops(models.Crops crops) {
        Crops = crops;
    }

    public models.LandDetails getLandDetails() {
        return LandDetails;
    }

    public void setLandDetails(models.LandDetails landDetails) {
        LandDetails = landDetails;
    }

    public models.Progresses getProgresses() {
        return Progresses;
    }

    public void setProgresses(models.Progresses progresses) {
        Progresses = progresses;
    }

    public Cultivations(int pkCultivations, String extentOfCultivation, Date dateStart, Date dateEnd,
            models.Crops crops, models.LandDetails landDetails, models.Progresses progresses) {
        PkCultivations = pkCultivations;
        ExtentOfCultivation = extentOfCultivation;
        DateStart = dateStart;
        DateEnd = dateEnd;
        Crops = crops;
        LandDetails = landDetails;
        Progresses = progresses;
    }
}
