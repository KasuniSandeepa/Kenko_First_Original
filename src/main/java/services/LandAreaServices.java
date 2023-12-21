package services;

import static utils.RoundOffNumbers.RoundOffDouble;

public class LandAreaServices {

//    public static void main(String[] args) {
//        System.out.println("CropCultivatedLandAreaQuantifiedGet: "+CropCultivatedLandAreaQuantifiedGet("10_Square Metres"));
//    }

    public static String CropCultivatedLandAreaQuantifiedGet(String CropCultivatedLandArea) {
        String CropCultivatedLandAreaQuantified = "";
        String Area = CropCultivatedLandArea.split("_")[0];
        String Unit = CropCultivatedLandArea.split("_")[1];
        double Length = Double.parseDouble(Area.split("x")[0]);
        double Breadth = Double.parseDouble(Area.split("x")[1]);
        double PlotCount = Double.parseDouble(Area.split("x")[2]);
        switch (Unit) {
            case "Plots":
                CropCultivatedLandAreaQuantified = (Length * Breadth * PlotCount) + "_Plots_" + PlotCount;
                break;
            default:
//                //--to check if 'units' are 'squared'
//                if (Unit.split(" ")[1] != null) {
//                    //--is 'squared'
//                    CropCultivatedLandAreaQuantified = String.valueOf((Length * Breadth) + Unit);
//                } else {
//                    //--is NOT 'squared'
//                    CropCultivatedLandAreaQuantified = String.valueOf((Length * Breadth) + "_Plots_");
//                }
                CropCultivatedLandAreaQuantified = (Length * Breadth) + Unit.replaceAll(" ", "_");
                break;
        }
        System.out.println("CropCultivatedLandAreaQuantified: " + CropCultivatedLandAreaQuantified);
        return CropCultivatedLandAreaQuantified;
    }

    //synchronized
    public static synchronized double LandExtentAmountToSquareFeet(int Number, String Unit) {
        double Result = 0.0;
        switch (Unit) {
            case "Square Metres":
                Result = RoundOffDouble(((double) Number * 10.764), 2);
                break;
            case "Square Feet":
                Result = RoundOffDouble(((double) Number), 2);
                break;
            case "Perches":
                Result = RoundOffDouble(((double) Number * 272.25), 2);
                break;
            case "Acres":
                Result = RoundOffDouble(((double) Number * 43560), 2);
                break;
            default:
                Result = RoundOffDouble(((double) Number), 2);
                break;
        }
//        System.out.println("ToSquareFoot: " + Result);
        return Result;
    }

    //synchronized
    public static synchronized double LandExtentAmountFromSquareFeet(double Number, String Unit) {
        double Result = 0.0;
        switch (Unit) {
            case "Square Metres":
                Result = RoundOffDouble(((double) Number / 10.764), 2);
                break;
            case "Square Feet":
                Result = RoundOffDouble(((double) Number), 2);
                break;
            case "Perches":
                Result = RoundOffDouble(((double) Number / 272.25), 2);
                break;
            case "Acres":
                Result = RoundOffDouble(((double) Number / 43560), 2);
                break;
            default:
                Result = RoundOffDouble(((double) Number), 2);
                break;
        }
//        System.out.println("FromSquareFoot: " + Result);
        return Result;
    }

    public static String[] LandAreaInPlotsReformattedGet(String LandAreaInPlots) {
        String ReformattedValues[] = null;
        String Area = LandAreaInPlots.split("_")[0];
        String AreaLength = Area.split("x")[0];
        String AreaBreadth = Area.split("x")[1];
        String AreaCount = " x" + Area.split("x")[2];
        String PlotArea = AreaLength + "x" + AreaBreadth;
        String Unit = LandAreaInPlots.split("_")[1];
        if (Unit.equals("Feet")) {
            Unit = " Foot";
        } else if (Unit.equals("Metres")) {
            Unit = " Metre";
        }
        ReformattedValues = new String[]{PlotArea, Unit, " Plots", AreaCount};
        return ReformattedValues;
    }

}
