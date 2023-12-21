package models;

import java.sql.Date;

public class Progresses {

    //PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, FkProgressTypes, FkFertilizerTypes,
    // FkPesticideTypes
    private int PkProgresses;
    private String UpdatedDateTime;
    private String Quantity;
    private models.Crops Crops;
    private models.Profiles Profiles;
    private LandDetails LandDetails;
    private ProgressTypes ProgressTypes;
    private FertilizerTypes FertilizerTypes;
    private PesticideTypes PesticideTypes;

    public int getPkProgresses() {
        return PkProgresses;
    }

    public void setPkProgresses(int pkProgresses) {
        PkProgresses = pkProgresses;
    }

    public String getUpdatedDateTime() {
        return UpdatedDateTime;
    }

    public void setUpdatedDateTime(String updatedDateTime) {
        UpdatedDateTime = updatedDateTime;
    }

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String quantity) {
        Quantity = quantity;
    }

    public models.Crops getCrops() {
        return Crops;
    }

    public void setCrops(models.Crops crops) {
        Crops = crops;
    }

    public models.Profiles getProfiles() {
        return Profiles;
    }

    public void setProfiles(models.Profiles profiles) {
        Profiles = profiles;
    }

    public models.LandDetails getLandDetails() {
        return LandDetails;
    }

    public void setLandDetails(models.LandDetails landDetails) {
        LandDetails = landDetails;
    }

    public models.ProgressTypes getProgressTypes() {
        return ProgressTypes;
    }

    public void setProgressTypes(models.ProgressTypes progressTypes) {
        ProgressTypes = progressTypes;
    }

    public models.FertilizerTypes getFertilizerTypes() {
        return FertilizerTypes;
    }

    public void setFertilizerTypes(models.FertilizerTypes fertilizerTypes) {
        FertilizerTypes = fertilizerTypes;
    }

    public models.PesticideTypes getPesticideTypes() {
        return PesticideTypes;
    }

    public void setPesticideTypes(models.PesticideTypes pesticideTypes) {
        PesticideTypes = pesticideTypes;
    }

    public Progresses(int pkProgresses, String updatedDateTime, String quantity, models.Crops crops,
            models.Profiles profiles, models.LandDetails landDetails, models.ProgressTypes progressTypes,
            models.FertilizerTypes fertilizerTypes, models.PesticideTypes pesticideTypes) {
        PkProgresses = pkProgresses;
        UpdatedDateTime = updatedDateTime;
        Quantity = quantity;
        Crops = crops;
        Profiles = profiles;
        LandDetails = landDetails;
        ProgressTypes = progressTypes;
        FertilizerTypes = fertilizerTypes;
        PesticideTypes = pesticideTypes;
    }
}
