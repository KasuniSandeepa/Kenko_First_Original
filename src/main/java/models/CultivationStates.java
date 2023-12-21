package models;

public class CultivationStates {

    //PkCultivationStates, Name
    private int PkCultivationStates;
    private String Name;

    public int getPkCultivationStates() {
        return PkCultivationStates;
    }

    public void setPkCultivationStates(int pkCultivationStates) {
        PkCultivationStates = pkCultivationStates;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public CultivationStates(int pkCultivationStates, String name) {
        PkCultivationStates = pkCultivationStates;
        Name = name;
    }
}
