package models;

public class OwnershipStates {

    //PkOwnershipStates, Name
    private int PkOwnershipStates;
    private String Name;

    public int getPkOwnershipStates() {
        return PkOwnershipStates;
    }

    public void setPkOwnershipStates(int pkOwnershipStates) {
        PkOwnershipStates = pkOwnershipStates;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public OwnershipStates(int pkOwnershipStates, String name) {
        PkOwnershipStates = pkOwnershipStates;
        Name = name;
    }
}
