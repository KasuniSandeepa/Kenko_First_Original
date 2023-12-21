package models;

public class LandTypes {

    //PkLandTypes, Name
    private int PkLandTypes;
    private String Name;

    public int getPkLandTypes() {
        return PkLandTypes;
    }

    public void setPkLandTypes(int pkLandTypes) {
        PkLandTypes = pkLandTypes;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public LandTypes(int pkLandTypes, String name) {
        PkLandTypes = pkLandTypes;
        Name = name;
    }
}
