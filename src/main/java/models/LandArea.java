package models;

public class LandArea {

    private int Number;
    private String Unit;

    public int getNumber() {
        return Number;
    }

    public void setNumber(int number) {
        Number = number;
    }

    public String getUnit() {
        return Unit;
    }

    public void setUnit(String unit) {
        Unit = unit;
    }

    public LandArea(int number, String unit) {
        Number = number;
        Unit = unit;
    }

}
