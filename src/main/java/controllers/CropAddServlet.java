package controllers;

import models.Yields;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import services.DatabaseConnection;
import services.LandDetailsServices;
import services.YieldsServices;
import utils.FilesAndFolders;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/CropAddServlet")
public class CropAddServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDataInitialize(request, response);
//        ResponseGet(request, response);

    }

    //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement, CropCycleDuration,
    // PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
    private String _CropType = "", _PlantedDate = "";
    private String _CropExtentNumber = "", _CropExtentUnit = "", _CultivatedLandArea = "";
    private String _NurseryGrownNumber = "", _NurseryGrownUnit = "", _NurseryTime = "";
    private String _WaterRequirement = "_WaterRequirement", _ClimateRequirement = "_ClimateRequirement";
    private String _CropCycleDuration = "_CropCycleDuration";
    private String _PhotoUrl = "src/images/_PhotoUrl";
    private int _FkLandDetails = 0, _FkCropTypes = 1, _FkFertilizers = 1, _FkSeedTypes = 1;
    private int _FkSeeds = 1, _FkYields = 0;
    private int _PlotLength = 0, _PlotBreadth = 0, _PlotUnitArea = 0, _PlotTotalArea = 0;
    String _PlotSizeMeasurementUnit = "_PlotUnit", _PlotTotalAreaWithMeasuringUnits = "";
    int _PlotQuantity = 0;

    //filepath is declared below
    boolean _IsCropSaved = false, _IsRequiredLandExtentAvailable = false;

    private void RequestDataInitialize(HttpServletRequest Request, HttpServletResponse Response) {

        try {
            //checks if the uploaded file is of 'multipart' type
            boolean isMultipart = ServletFileUpload.isMultipartContent(Request);
            if (isMultipart == true) {
                try {
                    FileItemFactory fi = new DiskFileItemFactory();
                    ServletFileUpload uploadFile = new ServletFileUpload(fi);
                    //--set a 'FileItem' list for uploaded files to get ANY type of file
                    List<FileItem> li = uploadFile.parseRequest(Request);

                    String TargetFolder = "", ImageName = "", FilePath = "";
                    File TargetFile;

                    //--iterate the list
                    for (FileItem FileItem : li) {
                        if (!FileItem.isFormField()) {
                            //--file name
                            ImageName = FileItem.getName();
                            //--replace all whitespace chars
                            ImageName = ImageName.replaceAll("\\s", "_");
                            //--path
                            String Path = Request.getServletContext().getRealPath("/");
                            //--MUST
                            Path = Path.replace("\\", "/");
                            //--folder
                            String Folder = FilesAndFolders.CROPS_IMAGES_FOLDER;
                            //--'File' object to set a file path
                            File f = new File(Path + Folder + ImageName);
                            //--execute 'upload'
                            if (f.exists() && !f.isDirectory()) {
                                System.out.println("File already exists!");
                            } else {
                                //--execute 'upload'
                                FileItem.write(f);
                            }
                            //--sending the total path is useless, therefore
                            FilePath = Folder + ImageName;

//                            //--file name
//                            ImageName = FileItem.getName();
//                            //--replace all whitespace chars
//                            ImageName = ImageName.replaceAll("\\s", "_");
//                            System.out.println("ImageName: "+ImageName);
//
//                            //--path - outside the project
//                            TargetFolder = FilesAndFolders.CROPS_IMAGES_FOLDER;
//                            System.out.println("TargetFolder: "+TargetFolder);
//
//                            //--'File' write to target folder
//                            TargetFile = new File((TargetFolder + ImageName).trim());
//                            if (TargetFile.exists() && !TargetFile.isDirectory()) {
//                                System.out.println("File already exists!");
//                            } else {
//                                //--execute 'upload'
//                                FileItem.write(TargetFile);
//                            }
//
//                            //--sending the total path is useless, therefore
//                            FilePath = TargetFolder + ImageName;
//                            //--
//                            FilePath = FilePath.replaceAll("\\\\", "\\\\\\\\");
                            _PhotoUrl = FilePath;

                        } else {

                            if (FileItem.getFieldName().equals("land_id")) {
                                _FkLandDetails = Integer.parseInt(FileItem.getString());

                            } else if (FileItem.getFieldName().equals("crop_type")) {
                                _FkCropTypes = Integer.parseInt(FileItem.getString().split("_")[0]);
                                _CropType = FileItem.getString().split("_")[1];

                            } else if (FileItem.getFieldName().equals("crop_extent_number")) {
                                _CropExtentNumber = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("crop_extent_unit")) {
                                _CropExtentUnit = FileItem.getString();
                                //concat both names
//                                _CultivatedLandArea = _CropExtentNumber + "_" + _CropExtentUnit;

                            } else if (FileItem.getFieldName().equals("crop_nursery_grown_number")) {
                                _NurseryGrownNumber = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("crop_nursery_grown_unit")) {
                                _NurseryGrownUnit = FileItem.getString();
                                //concat both names
//                                _NurseryTime = _NurseryGrownNumber + "_" + _NurseryGrownUnit;

                            } else if (FileItem.getFieldName().equals("crop_planted_date")) {
                                _PlantedDate = FileItem.getString();

//                            } else if (FileItem.getFieldName().equals("crop_photo")) {
//                                FilePath = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("plot_size_length")) {
                                _PlotLength = Integer.parseInt(FileItem.getString());

                            } else if (FileItem.getFieldName().equals("plot_size_breadth")) {
                                _PlotBreadth = Integer.parseInt(FileItem.getString());
                                //get unit area
//                                _PlotUnitArea=(_PlotLength * _PlotBreadth);

                            } else if (FileItem.getFieldName().equals("plot_size_measurement_unit")) {
                                _PlotSizeMeasurementUnit = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("no_of_plots")) {
                                _PlotQuantity = Integer.parseInt(FileItem.getString());
                                //get total unit area
//                                _PlotTotalArea = (_PlotQuantity * _PlotUnitArea);

                            }

                        }

                    }

                    //--
                    CalculatedValuesToSaveGet();

                    //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement, CropCycleDuration,
                    // PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
                    System.out.println("_FkLandDetails: " + _FkLandDetails + ", "
                            + "_CropType: " + _CropType + ", "
                            + "_PlantedDate: " + _PlantedDate + ", "
                            + "_CultivatedLandArea: " + _CultivatedLandArea + ", "
                            + "_NurseryTime: " + _NurseryTime + "\n"
                            + "_WaterRequirement: " + _WaterRequirement + ", "
                            + "_ClimateRequirement: " + _ClimateRequirement + "\n"
                            + "_CropCycleDuration: " + _CropCycleDuration + "\n"
                            + "_PhotoUrl: " + _PhotoUrl + "\n"
                            + "_FkCropTypes: " + _FkCropTypes + ", "
                            + "_FkFertilizers: " + _FkFertilizers + ", "
                            + "_FkSeedTypes: " + _FkSeedTypes + ", "
                            + "_FkSeeds: " + _FkSeeds + "\n"
                            + "_FkYields: " + _FkYields + ", "
                            + "_PlotLength: " + _PlotLength + ", "
                            + "_PlotBreadth: " + _PlotBreadth + ", "
                            + "_PlotQuantity: " + _PlotQuantity + ", "
                            + "_PlotSizeMeasurementUnit: " + _PlotSizeMeasurementUnit + "\n"
                            + "_PlotUnitArea: " + _PlotUnitArea + ", "
                            + "_PlotTotalArea: " + _PlotTotalArea + ", "
                            + "_PlotSizeMeasurementUnit: " + _PlotSizeMeasurementUnit);

                    //save query - done in a separate method
                    //a unique 'LandDetailsServices' object > returns a 'boolean' based on input values
                    LandDetailsServices LandDetailsServices = new LandDetailsServices();
                    String LandExtentAvailable = "";

                    //check input land area type
                    if (_CultivatedLandArea.split("_")[1].equals("Plots")) {
                        //DoCalculations in metric units to check if crop_grown_area > land_area
                        PlotTotalAreaWithMeasuringUnitsGet(_PlotSizeMeasurementUnit);
                        LandExtentAvailable = LandDetailsServices
                                .LandExtentAvailableGet(_FkLandDetails, _PlotTotalAreaWithMeasuringUnits);
                        //--but parse plot sizes to save
//                        _CultivatedLandArea=_PlotTotalAreaWithMeasuringUnits;
                        _CultivatedLandArea = _PlotLength + "x" + _PlotBreadth + "x" + _PlotQuantity + "_" +
                                _PlotSizeMeasurementUnit;
                    } else {
                        LandExtentAvailable = LandDetailsServices
                                .LandExtentAvailableGet(_FkLandDetails, _CultivatedLandArea);
                    }
                    System.out.println("_CultivatedLandArea: " + _CultivatedLandArea);

//                    String LandExtentAvailable = CropsServices
//                            .LandExtentAvailableGet(_FkLandDetails, _CultivatedLandArea);
                    System.out.println("LandExtentAvailable: " + LandExtentAvailable);
                    _IsRequiredLandExtentAvailable = LandDetailsServices.IsRequiredLandExtentAvailable;
                    System.out.println("_IsRequiredLandExtentAvailable: " + _IsRequiredLandExtentAvailable);
                    if (_IsRequiredLandExtentAvailable) {
                        CropSave(Response);
                    } else {
                        ResponseForInvalidLandAreaGet(Response, LandExtentAvailable);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void CalculatedValuesToSaveGet() {
        //_CultivatedLandArea
        _CultivatedLandArea = _CropExtentNumber + "_" + _CropExtentUnit;
        //_NurseryTime
        _NurseryTime = _NurseryGrownNumber + "_" + _NurseryGrownUnit;
        //_PlotUnitArea
        _PlotUnitArea = (_PlotLength * _PlotBreadth);
        //_PlotTotalArea
        _PlotTotalArea = (_PlotQuantity * _PlotUnitArea);
        //_FkYields
        try {
            Yields Yields = new YieldsServices().YieldsListOfCropTypeGet(_FkCropTypes).get(0);
            _FkYields = Yields.getPkYields();
        } catch (Exception e) {
            //min pk
            _FkYields = new YieldsServices().MinimumPkYieldsGet();
        }
    }

    private void PlotTotalAreaWithMeasuringUnitsGet(String PlotSizeMeasurementUnit) {
        //measurement units
        if (PlotSizeMeasurementUnit.equals("Feet")) {
            _PlotTotalAreaWithMeasuringUnits = _PlotTotalArea + "_" + "Square Feet";
            System.out.println("PlotTotalAreaWithMeasuringUnits: " + _PlotTotalAreaWithMeasuringUnits);
        } else if (PlotSizeMeasurementUnit.equals("Metres")) {
            _PlotTotalAreaWithMeasuringUnits = _PlotTotalArea + "_" + "Square Metres";
            System.out.println("PlotTotalAreaWithMeasuringUnits: " + _PlotTotalAreaWithMeasuringUnits);
        } else {
            System.out.println("Invalid Plot Size Measurement Unit: " + PlotSizeMeasurementUnit);
        }
    }

    private void CropSave(HttpServletResponse Response) {

        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //PkCrops, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement, CropCycleDuration,
            // PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes, FkSeeds, FkYields
            String SqlQuery = "INSERT INTO crops(CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement," +
                    " ClimateRequirement, CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes," +
                    " FkFertilizers, FkSeedTypes, FkSeeds, FkYields)"
                    + " VALUES('" + _CultivatedLandArea + "','" + _NurseryTime + "','" + _PlantedDate
                    + "','" + _WaterRequirement + "','" + _ClimateRequirement + "','" + _CropCycleDuration
                    + "','" + _PhotoUrl + "'," + _FkLandDetails + "," + _FkCropTypes + ",1,1,1," + _FkYields + ")";

            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Saved: " + _CropType);
            _IsCropSaved = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }

        //redirect
        ResponseGet(Response);

    }

    private void ResponseGet(HttpServletResponse Response) {

        try {
            if (_IsCropSaved) {
                Response.sendRedirect("LandDetails.jsp?PkLandDetails=" + _FkLandDetails
                        + "&IsCropSaved=true");
            } else {
                System.out.println("IsCropSaved=false");
                Response.sendRedirect("CropAdd.jsp?PkLandDetails=" + _FkLandDetails
                        + "&IsCropSaved=false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void ResponseForInvalidLandAreaGet(HttpServletResponse Response, String LandExtentAvailable) {

        try {
            System.out.println("IsLandAreaInvalid=true");
            Response.sendRedirect("CropAdd.jsp?" +
                    "PkLandDetails=" + _FkLandDetails +
                    "&IsLandAreaInvalid=true" +
                    "&LandExtentAvailable=" + LandExtentAvailable.replace(" ", "_"));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
