package controllers;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import services.CropsServices;
import utils.FilesAndFolders;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest Request, HttpServletResponse Response)
            throws ServletException, IOException {

//        String Name = request.getParameter("crop_type");
////        String NameHidden = request.getParameter("crop_type");
////        System.out.println(Name + ", " + NameHidden);
//        System.out.println(Name);
////        response.sendRedirect("_carousel-2.jsp");
//        response.sendRedirect("_carousel-3.jsp");

        String _Name="_Name";

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
//                            _PhotoUrl = FilePath;

                        } else {

//                            if (FileItem.getFieldName().equals("land_id")) {
//                                _FkLandDetails = Integer.parseInt(FileItem.getString());
//
//                            } else

                                if (FileItem.getFieldName().equals("crop_type")) {
                                _Name = FileItem.getString();

                            }

//                            else if (FileItem.getFieldName().equals("crop_extent_number")) {
//                                _CropExtentNumber = FileItem.getString();
//
//                            } else if (FileItem.getFieldName().equals("crop_extent_unit")) {
//                                _CropExtentUnit = FileItem.getString();
//                                //concat both names
//                                _CultivatedLandArea = _CropExtentNumber + "_" + _CropExtentUnit;
//
//                            } else if (FileItem.getFieldName().equals("crop_nursery_grown_number")) {
//                                _NurseryGrownNumber = FileItem.getString();
//
//                            } else if (FileItem.getFieldName().equals("crop_nursery_grown_unit")) {
//                                _NurseryGrownUnit = FileItem.getString();
//                                //concat both names
//                                _NurseryTime = _NurseryGrownNumber + "_" + _NurseryGrownUnit;
//
//                            } else if (FileItem.getFieldName().equals("crop_planted_date")) {
//                                _PlantedDate = FileItem.getString();
//
//                            } else if (FileItem.getFieldName().equals("crop_photo")) {
//                                FilePath = FileItem.getString();
//
//                            }

                        }

                    }

                    //_Name, _PlantedDate, _CultivatedLandArea, _NurseryTime, _WaterRequirement, _ClimateRequirement,
                    //_CropCycleDuration, _PhotoUrl, _FkLandDetails, _FkCropTypes, _FkFertilizers,
                    //_FkSeedTypes, _FkSeeds, _FkYields

                    System.out.println(
//                            "_FkLandDetails: " + _FkLandDetails + ", "
//                            +
                            "_Name: " + _Name
//                                    + ", "
//                            + "_PlantedDate: " + _PlantedDate + ", "
//                            + "_CultivatedLandArea: " + _CultivatedLandArea + ", "
//                            + "_NurseryTime: " + _NurseryTime + "\n"
//                            + "_WaterRequirement: " + _WaterRequirement + ", "
//                            + "_ClimateRequirement: " + _ClimateRequirement + ", "
//                            + "_CropCycleDuration: " + _CropCycleDuration + "\n"
//                            + "_PhotoUrl: " + _PhotoUrl + "\n"
//                            + "_FkCropTypes: " + _FkCropTypes + ", "
//                            + "_FkFertilizers: " + _FkFertilizers + ", "
//                            + "_FkSeedTypes: " + _FkSeedTypes + ", "
//                            + "_FkSeeds: " + _FkSeeds + "\n"
//                            + "_FkYields: " + _FkYields
                    );

//                    //save query - done in a separate method
//                    CropsServices CropsServices = new CropsServices();
//                    String LandExtentAvailable = CropsServices
//                            .LandExtentAvailableGet(_FkLandDetails, _CultivatedLandArea);
//                    System.out.println("LandExtentAvailable: " + LandExtentAvailable);
//                    _IsRequiredLandExtentAvailable = CropsServices.IsRequiredLandExtentAvailable;
//                    System.out.println("_IsRequiredLandExtentAvailable: " + _IsRequiredLandExtentAvailable);
//                    if (_IsRequiredLandExtentAvailable) {
//                        CropSave(Response);
//                    } else {
//                        ResponseForInvalidLandAreaGet(Response, LandExtentAvailable);
//                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        //redirect
        Response.sendRedirect("_modal-4.jsp");

    }
}
