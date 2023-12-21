package models;

public class Pesticides {

    //PkPesticides, Name, UsedFor, FkPesticideTypes
    private int PkPesticides;
    private String Name;
    private String UsedFor;
    private models.PesticideTypes PesticideTypes;

    public int getPkPesticides() {
        return PkPesticides;
    }

    public void setPkPesticides(int pkPesticides) {
        PkPesticides = pkPesticides;
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

    public models.PesticideTypes getPesticideTypes() {
        return PesticideTypes;
    }

    public void setPesticideTypes(models.PesticideTypes pesticideTypes) {
        PesticideTypes = pesticideTypes;
    }

    public Pesticides(int pkPesticides, String name, String usedFor, models.PesticideTypes pesticideTypes) {
        PkPesticides = pkPesticides;
        Name = name;
        UsedFor = usedFor;
        PesticideTypes = pesticideTypes;
    }
}
