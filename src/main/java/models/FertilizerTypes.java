package models;

public class FertilizerTypes {

    //PkFertilizers, Name
    private int PkFertilizers;
    private String Name;

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

    public FertilizerTypes(int pkFertilizers, String name) {
        PkFertilizers = pkFertilizers;
        Name = name;
    }
}
