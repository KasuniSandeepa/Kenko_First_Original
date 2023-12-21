package models;

public class CropTypeVarieties {

    //PkCropTypeVarieties, Name, FkCropTypes
    private int PkCropTypeVarieties;
    private String Name;
    private models.CropTypes CropTypes;

    public int getPkCropTypeVarieties() {
        return PkCropTypeVarieties;
    }

    public void setPkCropTypeVarieties(int pkCropTypeVarieties) {
        PkCropTypeVarieties = pkCropTypeVarieties;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public models.CropTypes getCropTypes() {
        return CropTypes;
    }

    public void setCropTypes(models.CropTypes cropTypes) {
        CropTypes = cropTypes;
    }

    public CropTypeVarieties(int pkCropTypeVarieties, String name, models.CropTypes cropTypes) {
        PkCropTypeVarieties = pkCropTypeVarieties;
        Name = name;
        CropTypes = cropTypes;
    }
}
