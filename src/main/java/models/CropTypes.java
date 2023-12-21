package models;

public class CropTypes {

    //PkCropTypes, Name, GrowthDuration, DefaultImage
    private int PkCropTypes;
    private String Name;
    private String GrowthDuration;
    private String DefaultImage;

    public int getPkCropTypes() {
        return PkCropTypes;
    }

    public void setPkCropTypes(int pkCropTypes) {
        PkCropTypes = pkCropTypes;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getGrowthDuration() {
        return GrowthDuration;
    }

    public void setGrowthDuration(String growthDuration) {
        GrowthDuration = growthDuration;
    }

    public String getDefaultImage() {
        return DefaultImage;
    }

    public void setDefaultImage(String defaultImage) {
        DefaultImage = defaultImage;
    }

    public CropTypes(int pkCropTypes, String name, String growthDuration, String defaultImage) {
        PkCropTypes = pkCropTypes;
        Name = name;
        GrowthDuration = growthDuration;
        DefaultImage = defaultImage;
    }
}
