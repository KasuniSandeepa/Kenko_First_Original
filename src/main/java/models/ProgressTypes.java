package models;

public class ProgressTypes {

    //PkProgressTypes, Name
    private int PkProgressTypes;
    private String Name;

    public int getPkProgressTypes() {
        return PkProgressTypes;
    }

    public void setPkProgressTypes(int pkProgressTypes) {
        PkProgressTypes = pkProgressTypes;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public ProgressTypes(int pkProgressTypes, String name) {
        PkProgressTypes = pkProgressTypes;
        Name = name;
    }
}
