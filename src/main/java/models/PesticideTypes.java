package models;

public class PesticideTypes {

    //PkPesticideTypes, Name
    private int PkPesticideTypes;
    private String Name;

    public int getPkPesticideTypes() {
        return PkPesticideTypes;
    }

    public void setPkPesticideTypes(int pkPesticideTypes) {
        PkPesticideTypes = pkPesticideTypes;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public PesticideTypes(int pkPesticideTypes, String name) {
        PkPesticideTypes = pkPesticideTypes;
        Name = name;
    }
}
