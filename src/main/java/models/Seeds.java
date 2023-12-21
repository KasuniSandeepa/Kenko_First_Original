package models;

public class Seeds {

    //PkSeeds, Name, FkSeedTypes
    private int PkSeeds;
    private String Name;
    private models.SeedTypes SeedTypes;

    public int getPkSeeds() {
        return PkSeeds;
    }

    public void setPkSeeds(int pkSeeds) {
        PkSeeds = pkSeeds;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public models.SeedTypes getSeedTypes() {
        return SeedTypes;
    }

    public void setSeedTypes(models.SeedTypes seedTypes) {
        SeedTypes = seedTypes;
    }

    public Seeds(int pkSeeds, String name, models.SeedTypes seedTypes) {
        PkSeeds = pkSeeds;
        Name = name;
        SeedTypes = seedTypes;
    }
}
