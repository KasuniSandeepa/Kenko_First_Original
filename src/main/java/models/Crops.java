package models;

import java.sql.Date;

public class Crops {

    //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement, CropCycleDuration,
    // PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
    private int PkCrops;
    private String CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement, CropCycleDuration;
//    private Date PlantedDate;
    private String PhotoUrl;
    private LandDetails LandDetails;
    private CropTypes CropTypes;
    private Fertilizers Fertilizers;
    private SeedTypes SeedTypes;
    private Seeds Seeds;
    private Yields Yields;

    public int getPkCrops() {
        return PkCrops;
    }

    public void setPkCrops(int pkCrops) {
        PkCrops = pkCrops;
    }

    public String getCultivatedLandArea() {
        return CultivatedLandArea;
    }

    public void setCultivatedLandArea(String cultivatedLandArea) {
        CultivatedLandArea = cultivatedLandArea;
    }

    public String getNurseryTime() {
        return NurseryTime;
    }

    public void setNurseryTime(String nurseryTime) {
        NurseryTime = nurseryTime;
    }

    public String getWaterRequirement() {
        return WaterRequirement;
    }

    public void setWaterRequirement(String waterRequirement) {
        WaterRequirement = waterRequirement;
    }

    public String getClimateRequirement() {
        return ClimateRequirement;
    }

    public void setClimateRequirement(String climateRequirement) {
        ClimateRequirement = climateRequirement;
    }

    public String getCropCycleDuration() {
        return CropCycleDuration;
    }

    public void setCropCycleDuration(String cropCycleDuration) {
        CropCycleDuration = cropCycleDuration;
    }

    public String getPlantedDate() {
        return PlantedDate;
    }

    public void setPlantedDate(String plantedDate) {
        PlantedDate = plantedDate;
    }

    public String getPhotoUrl() {
        return PhotoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        PhotoUrl = photoUrl;
    }

    public models.LandDetails getLandDetails() {
        return LandDetails;
    }

    public void setLandDetails(models.LandDetails landDetails) {
        LandDetails = landDetails;
    }

    public models.CropTypes getCropTypes() {
        return CropTypes;
    }

    public void setCropTypes(models.CropTypes cropTypes) {
        CropTypes = cropTypes;
    }

    public models.Fertilizers getFertilizers() {
        return Fertilizers;
    }

    public void setFertilizers(models.Fertilizers fertilizers) {
        Fertilizers = fertilizers;
    }

    public models.SeedTypes getSeedTypes() {
        return SeedTypes;
    }

    public void setSeedTypes(models.SeedTypes seedTypes) {
        SeedTypes = seedTypes;
    }

    public models.Seeds getSeeds() {
        return Seeds;
    }

    public void setSeeds(models.Seeds seeds) {
        Seeds = seeds;
    }

    public models.Yields getYields() {
        return Yields;
    }

    public void setYields(models.Yields yields) {
        Yields = yields;
    }

    public Crops(int pkCrops, String cultivatedLandArea, String nurseryTime, String waterRequirement,
            String climateRequirement, String cropCycleDuration, String plantedDate, String photoUrl,
            models.LandDetails landDetails, models.CropTypes cropTypes, models.Fertilizers fertilizers,
            models.SeedTypes seedTypes, models.Seeds seeds, models.Yields yields) {
        PkCrops = pkCrops;
        CultivatedLandArea = cultivatedLandArea;
        NurseryTime = nurseryTime;
        WaterRequirement = waterRequirement;
        ClimateRequirement = climateRequirement;
        CropCycleDuration = cropCycleDuration;
        PlantedDate = plantedDate;
        PhotoUrl = photoUrl;
        LandDetails = landDetails;
        CropTypes = cropTypes;
        Fertilizers = fertilizers;
        SeedTypes = seedTypes;
        Seeds = seeds;
        Yields = yields;
    }
}
