package models;

public class Fertilizers {

    //PkFertilizers, Name, UsedFor, FkFertilizerTypes
    private int PkFertilizers;
    private String Name;
    private String UsedFor;
    private FertilizerTypes FertilizerTypes;

    public int getPkFertilizers() {
        return PkFertilizers;
    }

    public void setPkFertilizers(int pkFertilizers) {
        PkFertilizers = pkFertilizers;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getUsedFor() {
        return UsedFor;
    }

    public void setUsedFor(String usedFor) {
        UsedFor = usedFor;
    }

    public models.FertilizerTypes getFertilizerTypes() {
        return FertilizerTypes;
    }

    public void setFertilizerTypes(models.FertilizerTypes fertilizerTypes) {
        FertilizerTypes = fertilizerTypes;
    }

    public Fertilizers(int pkFertilizers, String name, String usedFor, models.FertilizerTypes fertilizerTypes) {
        PkFertilizers = pkFertilizers;
        Name = name;
        UsedFor = usedFor;
        FertilizerTypes = fertilizerTypes;
    }
}
