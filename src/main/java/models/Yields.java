package models;

public class Yields {

    //PkYields, YieldDuration, DurationTillYield, StandardYield, FkSeedTypes, FkCropTypeVarieties
    private int PkYields;
    private String YieldDuration, DurationTillYield, StandardYield;
    private models.SeedTypes SeedTypes;
    private CropTypeVarieties CropTypeVarieties;

    public int getPkYields() {
        return PkYields;
    }

    public void setPkYields(int pkYields) {
        PkYields = pkYields;
    }

    public String getYieldDuration() {
        return YieldDuration;
    }

    public void setYieldDuration(String yieldDuration) {
        YieldDuration = yieldDuration;
    }

    public String getDurationTillYield() {
        return DurationTillYield;
    }

    public void setDurationTillYield(String durationTillYield) {
        DurationTillYield = durationTillYield;
    }

    public String getStandardYield() {
        return StandardYield;
    }

    public void setStandardYield(String standardYield) {
        StandardYield = standardYield;
    }

    public models.SeedTypes getSeedTypes() {
        return SeedTypes;
    }

    public void setSeedTypes(models.SeedTypes seedTypes) {
        SeedTypes = seedTypes;
    }

    public models.CropTypeVarieties getCropTypeVarieties() {
        return CropTypeVarieties;
    }

    public void setCropTypeVarieties(models.CropTypeVarieties cropTypeVarieties) {
        CropTypeVarieties = cropTypeVarieties;
    }

    public Yields(int pkYields, String yieldDuration, String durationTillYield, String standardYield,
            models.SeedTypes seedTypes, models.CropTypeVarieties cropTypeVarieties) {
        PkYields = pkYields;
        YieldDuration = yieldDuration;
        DurationTillYield = durationTillYield;
        StandardYield = standardYield;
        SeedTypes = seedTypes;
        CropTypeVarieties = cropTypeVarieties;
    }
}
