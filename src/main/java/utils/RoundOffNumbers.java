package utils;

public class RoundOffNumbers {

    //synchronized
    public static synchronized double RoundOffDouble(double Value, int Places) {
        if (Places < 0) throw new IllegalArgumentException();
        long Factor = (long) Math.pow(10, Places);
        Value = Value * Factor;
        long TemporaryValue = Math.round(Value);
        return (double) TemporaryValue / Factor;
    }

}
