package models;

public class ProfileTypes {

    //PkProfileTypes, Name
    private int PkProfileTypes;
    private String Name;

    public int getPkProfileTypes() {
        return PkProfileTypes;
    }

    public void setPkProfileTypes(int pkProfileTypes) {
        PkProfileTypes = pkProfileTypes;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public ProfileTypes(int pkProfileTypes, String name) {
        PkProfileTypes = pkProfileTypes;
        Name = name;
    }

}
