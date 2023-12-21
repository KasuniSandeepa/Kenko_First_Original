package controllers;

import models.Profiles;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import services.DatabaseConnection;
import services.ProfilesServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import static services.HttpSession.PROFILES;
import static utils.NicDetails.GetNicDetails;

@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, PassWord, Address,
    // PhotoUrl, Province, District, GnArea, LandState, CropState, RegisteredDate,
    // Uuid

    //local variables
    private String FirstName = "", LastName = "";
    private int PkProfiles = 0;
    private String Name = "", NIC = "", DateOfBirth = "", Gender = "";
    private String MobileNumber = "", PassWord = "", Address = "", PhotoUrl = "_PhotoUrl";
    private String Province = "", District = "", GnArea = "";
    private String LandState = "Not_Cultivated", CropState = "Not_Grown";
    private String PhotoUrlExisting = "";
    //image file-path is declared below
    private Profiles Profiles = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDataInitialize(request, response);

    }

    private void RequestDataInitialize(HttpServletRequest request, HttpServletResponse response) {

        try {
            //checks if the uploaded file is of 'multipart' type
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart == true) {
                try {
                    FileItemFactory fi = new DiskFileItemFactory();
                    ServletFileUpload uploadFile = new ServletFileUpload(fi);
                    //--set a 'FileItem' list for uploaded files to get ANY type of file
                    List<FileItem> li = uploadFile.parseRequest(request);

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
                            String Path = request.getServletContext().getRealPath("/");
                            //--MUST
                            Path = Path.replace("\\", "/");
                            //--folder
//                            String Folder = FilesAndFolders.PROFILES_IMAGES_FOLDER;
                            String Folder = getServletContext()
                                    .getInitParameter("profiles_image_upload_location");
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

////                            //--file name
//                            ImageName = FileItem.getName();
//                            //--replace all whitespace chars
//                            ImageName = ImageName.replaceAll("\\s", "_");
//
//                            //--path - outside the project
//                            TargetFolder = FilesAndFolders.PROFILES_IMAGES_UPLOAD_FOLDER;
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
                            PhotoUrl = FilePath;

                        } else {

                            if (FileItem.getFieldName().equals("farmer_id")) {
                                PkProfiles = Integer.parseInt(FileItem.getString());

                            } else if (FileItem.getFieldName().equals("farmer_first_name")) {
                                FirstName = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_last_name")) {
                                LastName = FileItem.getString();
                                //concat both names
                                Name = FirstName + "_" + LastName;

                            } else if (FileItem.getFieldName().equals("farmer_nic")) {
                                NIC = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_mobile_number")) {
                                MobileNumber = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_password_confirm")) {
                                PassWord = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_address")) {
                                Address = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_province")) {
                                Province = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_district")) {
                                District = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_gn_division")) {
                                GnArea = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_land_state")) {
                                LandState = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("farmer_crop_state")) {
                                CropState = FileItem.getString();
                            }

                        }

                    }

                    System.out.println("PkProfiles: " + PkProfiles + ", "
                            + "Name: " + Name + ", "
                            + "NIC: " + NIC + ", "
                            + "MobileNumber: " + MobileNumber + "\n"
                            + "PassWord: " + PassWord + ", "
                            + "Address: " + Address + ", "
                            + "PhotoUrl: " + PhotoUrl + ", "
                            + "FkProvinces: " + Province + "\n"
                            + "FkDistricts: " + District + ", "
                            + "FkGnDivisions: " + GnArea + ", "
                            + "LandState: " + LandState + ", "
                            + "CropState: " + CropState);

                    //update query - done in a separate method
                    RequestDataValidate(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void RequestDataValidate(HttpServletRequest Request, HttpServletResponse Response) {

        try {

            if (IsNicValid(NIC)) {
                if (services.NIC.IsNicExistsInDatabaseWithAnotherUser(NIC, PkProfiles)) {
                    System.out.println("NicPresent=true");
                    Response.sendRedirect("ProfileUpdate.jsp?NicPresent=true");
                } else if (IsProfilesUpdated()) {
                    //updated
                    //update profile in http session
                    Profiles = new ProfilesServices().ProfilesGet(PkProfiles);
                    //set user
                    HttpSession HttpSession = Request.getSession();
                    HttpSession.setAttribute(PROFILES, Profiles);
                    //redirect
                    Response.sendRedirect("ProfileUpdate.jsp?IsProfileUpdated=true");
//                    System.out.println("IsProfileUpdated=true");
                } else {
                    //not updated
                    System.out.println("IsProfileUpdated=false");
                    Response.sendRedirect("ProfileUpdate.jsp?IsProfileUpdated=false");
                }

            } else {
                System.out.println("NicValid=false");
                Response.sendRedirect("ProfileUpdate.jsp?NicValid=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private boolean IsProfilesUpdated() {
        boolean IsProfilesUpdated = false, IsLogInDetailsUpdated = false, IsUpdateCompleted = false;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, Address, PhotoUrl, Province, District, GnArea,
            // LandState, CropState, RegisteredDate, Uuid, FkProfileTypes
            String SqlQuery = "UPDATE profiles" +
                    " SET Name='" + Name + "', NIC='" + NIC + "', DateOfBirth='" + DateOfBirth + "'," +
                    " Gender='" + Gender + "', MobileNumber='" + MobileNumber + "'," +
                    " Address='" + Address + "', PhotoUrl='" + PhotoUrl + "'," +
                    " Province='" + Province + "', District='" + District + "', GnArea='" + GnArea + "'," +
                    " LandState='" + LandState + "', CropState='" + CropState + "'" +
                    " WHERE PkProfiles='" + PkProfiles + "'";
            Connection.createStatement().executeUpdate(SqlQuery);
//            System.out.println("Profiles: " + Name + " updated!");
            IsProfilesUpdated = true;
            //--update log-in details
            IsLogInDetailsUpdated = LogInDetailsUpdate(MobileNumber, PassWord, PkProfiles);
            //--combine update-states
            if (IsProfilesUpdated && IsLogInDetailsUpdated) {
                IsUpdateCompleted = true;
                System.out.println("IsUpdateCompleted=true");
            } else {
                System.out.println("IsUpdateCompleted=false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
//        return IsProfilesUpdated;
        return IsUpdateCompleted;
    }

    private boolean LogInDetailsUpdate(String MobileNumber, String Password, int PkProfiles) {
        boolean IsLogInDetailsUpdated = false;
        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();
            //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
            /*
            String SqlQuery = "UPDATE profiles"
                    + " SET Password='" + Password + "'"
                    + " WHERE PkProfiles='" + PkProfiles + "'";
            */
            String SqlQuery = "UPDATE profilelogindetails "
                    + "SET MobileNumber='" + MobileNumber + "', Password='" + Password + "' "
                    + "WHERE FkProfiles='" + PkProfiles + "'";
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("IsLogInDetailsUpdated=true");
            IsLogInDetailsUpdated = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return IsLogInDetailsUpdated;
    }

    private boolean IsNicValid(String NIC) {
        boolean IsNicValid = false;
        String[] NicDetails = {"0", "0", "0", "0"};
        if (!GetNicDetails(NIC)[0].equals("0")) {
            //change flag
            IsNicValid = true;
            //assign local variable values
            NicDetails = GetNicDetails(NIC);
            DateOfBirth = NicDetails[0] + "-" + NicDetails[1] + "-" + NicDetails[2];
            Gender = NicDetails[3];
//            System.out.println(DateOfBirth + ", " + Gender);
        }
        return IsNicValid;
    }

}
