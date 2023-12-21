package models;

public class SeedTypes {

    //PkSeedTypes, Name
    private int PkSeedTypes;
    private String Name;

    public int getPkSeedTypes() {
        return PkSeedTypes;
    }

    public void setPkSeedTypes(int pkSeedTypes) {
        PkSeedTypes = pkSeedTypes;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public SeedTypes(int pkSeedTypes, String name) {
        PkSeedTypes = pkSeedTypes;
        Name = name;
    }
}
