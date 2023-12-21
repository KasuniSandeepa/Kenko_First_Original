package controllers;

import services.CropsServices;
import services.DatabaseConnection;
import services.ProgressesServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ProgressAddServlet")
public class ProgressAddServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest Request, HttpServletResponse Response)
            throws ServletException, IOException {

        //validate data and save
        RequestDataInitialize(Request, Response);
        //redirect response
        ResponseGet(Response);

    }

    //PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, FkProgressTypes,
    // FkFertilizerTypes, FkPesticideTypes
    private String _Status = "", _UpdatedDateTime = "";
    //    private String _AddedNumber = "", _AddedUnits = "";
    private String _Quantity = "x";
    private int _FkCrops = 0, _FkProgressTypes = 0, _FkProfiles = 0, _FkLandDetails = 0;
    private String _WeededMeasurement = "", _WateredMeasurement = "", _FertilizerType = "";
    private int _WateredAmount = 0, _FertilizerAmount = 0, _DamagedAmount = 0, _HarvestedAmount = 0;
//    private int _DamagedPlotSizeLength = 0, _DamagedPlotSizeBreadth = 0, _DamagedNoOfPlots = 0;
//    private int _HarvestedPlotSizeLength = 0, _HarvestedPlotSizeBreadth = 0, _HarvestedNoOfPlots = 0;
    private String _SolidFertilizerMeasurement = "", _LiquidFertilizerMeasurement = "", _DamagedMeasurement = "";
    private String _HarvestedMethod = "", _HarvestedMeasurement = "";
    private String _DamagedPlotSizeMeasurement = "", _HarvestedPlotSizeMeasurement = "";
    private int _PesticideAmount = 0;
    private String _PestControlMethod = "", _PesticideMeasurement = "";
    private int _LandUnitArea = 0, _LandTotalArea = 0, _LandTotalAreaWithUnits = 0;
    //    private String _FkFertilizerTypes = null, _FkPesticideTypes = null;
    private int _FkFertilizerTypes = 1, _FkPesticideTypes = 1;

    //filepath is declared below
    boolean _IsStatusSaved = false;

    private void RequestDataInitialize(HttpServletRequest request, HttpServletResponse response) {

        try {

//            _UpdatedDateTime = new Timestamp(new java.util.Date().getTime()).toString();
            _UpdatedDateTime = request.getParameter("status_added_date");
//            _AddedNumber = request.getParameter("status_number");
//            _AddedUnits = request.getParameter("status_units");
//            _Quantity = _AddedNumber + "_" + _AddedUnits;
            _Status = request.getParameter("status_type");
            _FkCrops = Integer.parseInt(request.getParameter("crop_id"));
            _FkProgressTypes = new ProgressesServices().ProgressTypesPrimaryKeyGet(_Status);
            _FkProfiles = Integer.parseInt(request.getParameter("farmer_id"));
            _FkLandDetails = Integer.parseInt(request.getParameter("land_id"));

            _WeededMeasurement = request.getParameter("weeded_measurement");

            _WateredAmount = Integer.parseInt(request.getParameter("watered_amount"));
            _WateredMeasurement = request.getParameter("watered_measurement");

            _FertilizerType = request.getParameter("fertilizer_type");
            _FertilizerAmount = Integer.parseInt(request.getParameter("fertilizer_amount"));
            _SolidFertilizerMeasurement = request.getParameter("solid_fertilizer_measurement");
            _LiquidFertilizerMeasurement = request.getParameter("liquid_fertilizer_measurement");

            _DamagedAmount = Integer.parseInt(request.getParameter("damaged_amount"));
            _DamagedMeasurement = request.getParameter("damaged_measurement");
//            _DamagedPlotSizeLength = Integer.parseInt(request.getParameter("damaged_plot_size_length"));
//            _DamagedPlotSizeBreadth = Integer.parseInt(request.getParameter("damaged_plot_size_breadth"));
//            _DamagedPlotSizeMeasurement = request.getParameter("damaged_plot_size_measurement");
//            _DamagedNoOfPlots = Integer.parseInt(request.getParameter("damaged_no_of_plots"));

            _HarvestedMethod = request.getParameter("harvested_method");
            _HarvestedAmount = Integer.parseInt(request.getParameter("harvested_amount"));
            _HarvestedMeasurement = request.getParameter("harvested_measurement");
//            _HarvestedPlotSizeLength = Integer.parseInt(request.getParameter("harvested_plot_size_length"));
//            _HarvestedPlotSizeBreadth = Integer.parseInt(request.getParameter("harvested_plot_size_breadth"));
//            _HarvestedPlotSizeMeasurement = request.getParameter("harvested_plot_size_measurement");
//            _HarvestedNoOfPlots = Integer.parseInt(request.getParameter("harvested_no_of_plots"));

            _PestControlMethod = request.getParameter("pest_control_method");
            _PesticideAmount = Integer.parseInt(request.getParameter("pesticide_amount"));
            _PesticideMeasurement = request.getParameter("pesticide_measurement");

            //PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, FkProgressTypes,
            // FkFertilizerTypes, FkPesticideTypes
            System.out.println("_FkCrops: " + _FkCrops + ", "
                    + "_Status: " + _Status + ", "
                    + "_UpdatedDateTime: " + _UpdatedDateTime + "\n"
                    + "_FkTypeOfActivities: " + _FkProgressTypes + ", "
                    + "_FkProfiles: " + _FkProfiles + ", "
                    + "_FkLandDetails: " + _FkLandDetails + "\n"

                    + "_WeededMeasurement: " + _WeededMeasurement + ", "

                    + "_WateredAmount: " + _WateredAmount + ", "
                    + "_WateredMeasurement: " + _WateredMeasurement + "\n"

                    + "_FertilizerType: " + _FertilizerType + ", "
                    + "_FertilizerAmount: " + _FertilizerAmount + ", "
                    + "_SolidFertilizerMeasurement: " + _SolidFertilizerMeasurement + "\n"
                    + "_LiquidFertilizerMeasurement: " + _LiquidFertilizerMeasurement + ", "

                    + "_DamagedAmount: " + _DamagedAmount + ", "
                    + "_DamagedMeasurement: " + _DamagedMeasurement + "\n"
//                    + "_DamagedPlotSizeLength: " + _DamagedPlotSizeLength + ", "
//                    + "_DamagedPlotSizeBreadth: " + _DamagedPlotSizeBreadth + ", "
                    + "_DamagedPlotSizeMeasurement: " + _DamagedPlotSizeMeasurement + "\n"
//                    + "_DamagedNoOfPlots: " + _DamagedNoOfPlots + ", "

                    + "_HarvestedMethod: " + _HarvestedMethod + ", "
                    + "_HarvestedAmount: " + _HarvestedAmount + ", "
                    + "_HarvestedMeasurement: " + _HarvestedMeasurement + "\n"
//                    + "_HarvestedPlotSizeLength: " + _HarvestedPlotSizeLength + "\n"
//                    + "_HarvestedPlotSizeBreadth: " + _HarvestedPlotSizeBreadth + ", "
                    + "_HarvestedPlotSizeMeasurement: " + _HarvestedPlotSizeMeasurement + ", "
//                    + "_HarvestedNoOfPlots: " + _HarvestedNoOfPlots + "\n"

                    + "_PestControlMethod: " + _PestControlMethod + ", "
                    + "_PesticideAmount: " + _PesticideAmount + ", "
                    + "_PesticideMeasurement: " + _PesticideMeasurement);

            //--
            StatusQuantityCalculatedGet();

            //save query - done in a separate method
            StatusSave();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void StatusQuantityCalculatedGet() {
        //--
        _FkProgressTypes = new ProgressesServices().ProgressTypesPrimaryKeyGet(_Status);
        System.out.println("_FkProgressTypes: " + _FkProgressTypes);
//        _FkPesticideTypes = null;
//        _FkFertilizerTypes = null;
        _FkPesticideTypes = 1;
        _FkFertilizerTypes = 1;
        //--
        switch (_Status) {
            case "Weeded":
                _Quantity = _WeededMeasurement;
                break;
            case "Watered":
                _Quantity = _WateredAmount + "_" + _WateredMeasurement;
                break;
            case "Applied Fertilizer":
                switch (_FertilizerType) {
                    case "Liquid Fertilizer":
                        _Quantity = _FertilizerAmount + "_" + _LiquidFertilizerMeasurement;
//                        _FkFertilizerTypes = String.valueOf(
//                                new ProgressesServices().FertilizerTypesPrimaryKeyGet(_FertilizerType)
//                        );
                        _FkFertilizerTypes = Integer.parseInt(String.valueOf(new ProgressesServices()
                                .FertilizerTypesPrimaryKeyGet(_FertilizerType)));
                        System.out.println("_FkFertilizerTypes: " + _FkFertilizerTypes +
                                ", _FkPesticideTypes: " + _FkPesticideTypes);
                        //--
                        break;
                    default:
                        _Quantity = _FertilizerAmount + "_" + _SolidFertilizerMeasurement;
//                        _FkFertilizerTypes = String.valueOf(
//                                new ProgressesServices().FertilizerTypesPrimaryKeyGet(_FertilizerType)
//                        );
                        _FkFertilizerTypes = Integer.parseInt(String.valueOf(new ProgressesServices()
                                .FertilizerTypesPrimaryKeyGet(_FertilizerType)));
                        System.out.println("_FkFertilizerTypes: " + _FkFertilizerTypes +
                                ", _FkPesticideTypes: " + _FkPesticideTypes);
                        //--
                        //--save SolidFertilizerSelections
                }
                break;
            case "Damaged":
                switch (_DamagedMeasurement) {
                    case "Plots":
                        //--calculation
//                        _LandUnitArea = _DamagedPlotSizeLength * _DamagedPlotSizeBreadth;
//                        _LandTotalArea = _LandUnitArea * _DamagedNoOfPlots;
                        //--/calculation
//                        _Quantity = _LandTotalArea + "_" + MeasurementSquaredValueGet(_DamagedPlotSizeMeasurement);
//                        _Quantity = _DamagedPlotSizeLength + "x" + _DamagedPlotSizeBreadth + "x"
//                                + _DamagedNoOfPlots + "_" + _DamagedPlotSizeMeasurement;
                        _Quantity = _DamagedAmount + "_" + _DamagedMeasurement;
                        break;
                    default:
                        _Quantity = _DamagedAmount + "_" + _DamagedMeasurement;
                }
                break;
            case "Harvested":
                switch (_HarvestedMethod) {
                    case "Portion":
                        switch (_HarvestedMeasurement) {
                            case "Plots":
                                //--calculation
//                                _LandUnitArea = _HarvestedPlotSizeLength * _HarvestedPlotSizeBreadth;
//                                _LandTotalArea = _LandUnitArea * _HarvestedNoOfPlots;
                                //--/calculation
//                                _Quantity = _LandTotalArea + "_" +
//                                        MeasurementSquaredValueGet(_HarvestedPlotSizeMeasurement);
//                                _Quantity = _HarvestedPlotSizeLength + "x" + _HarvestedPlotSizeBreadth + "x"
//                                        + _HarvestedNoOfPlots + "_" + _HarvestedPlotSizeMeasurement;
                                _Quantity = _HarvestedAmount + "_" + _HarvestedMeasurement;
                                break;
                            default:
                                _Quantity = _HarvestedAmount + "_" + _HarvestedMeasurement;
                        }
                        break;
                    case "All":
                        _Quantity = new CropsServices().CropCultivatedLandAreaGet(_FkCrops);
                        break;
                }
                break;
            case "Pest Controlled":
                switch (_PestControlMethod) {
                    case "Organic Pesticide":
                        _Quantity = _PesticideAmount + "_" + _PesticideMeasurement;
//                        _FkPesticideTypes = String.valueOf(
//                                new ProgressesServices().PesticideTypesPrimaryKeyGet(_PestControlMethod)
//                        );
                        _FkPesticideTypes = Integer.parseInt(String.valueOf(new ProgressesServices()
                                .PesticideTypesPrimaryKeyGet(_PestControlMethod)));
                        System.out.println("_FkPesticideTypes: " + _FkPesticideTypes +
                                ", _FkFertilizerTypes: " + _FkFertilizerTypes);
                        //--
                        break;
                    case "Chemical Pesticide":
                        _Quantity = _PesticideAmount + "_" + _PesticideMeasurement;
//                        _FkPesticideTypes = String.valueOf(
//                                new ProgressesServices().PesticideTypesPrimaryKeyGet(_PestControlMethod)
//                        );
                        _FkPesticideTypes = Integer.parseInt(String.valueOf(new ProgressesServices()
                                .PesticideTypesPrimaryKeyGet(_PestControlMethod)));
                        System.out.println("_FkPesticideTypes: " + _FkPesticideTypes +
                                ", _FkFertilizerTypes: " + _FkFertilizerTypes);
                        //--
                        break;
                    default:
                        _Quantity = _PestControlMethod;
                }
                break;
        }
        System.out.println("StatusQuantityCalculatedGet: " + _Quantity);
    }

    private String MeasurementSquaredValueGet(String Measurement) {
        String SquaredMeasurement = "";
        if (Measurement.equals("Feet")) {
            SquaredMeasurement = "Square Feet";
        } else if (Measurement.equals("Metres")) {
            SquaredMeasurement = "Square Metres";
        }
        return SquaredMeasurement;
    }

    private void StatusSave() {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //PkProgresses, UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, FkProgressTypes,
            // FkFertilizerTypes, FkPesticideTypes
            String SqlQuery = "INSERT INTO progresses(UpdatedDateTime, Quantity, FkCrops, FkProfiles, FkLandDetails, " +
                    "FkProgressTypes, FkFertilizerTypes, FkPesticideTypes)"
                    + " VALUES('" + _UpdatedDateTime + "','" + _Quantity + "'," + _FkCrops + "," + _FkProfiles + ","
                    + _FkLandDetails + "," + _FkProgressTypes + ",'" + _FkFertilizerTypes + "','" + _FkPesticideTypes + "')";

            //use ssh connection to execute a query
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Saved: " + _Status);
            _IsStatusSaved = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }

    }

    private void ResponseGet(HttpServletResponse Response) {

        try {

            if (_IsStatusSaved) {
                Response.sendRedirect("CropDetails.jsp?PkCrops=" + _FkCrops
                        + "&PkLandDetails=" + _FkLandDetails
                        + "&IsStatusSaved=true");
            } else {
                System.out.println("IsStatusSaved=false");
//                PkCrops=<%=d.get_CropId()%>&PkLandDetails=<%=d.get_LandId()%>&PkProfiles=<%=ProfilesInCropList.getPkProfiles()%>
                Response.sendRedirect("ProgressAdd.jsp?PkCrops=" + _FkCrops + "&PkLandDetails="
                        + _FkLandDetails + "&PkProfiles=" + _FkProfiles + "&IsStatusSaved=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
