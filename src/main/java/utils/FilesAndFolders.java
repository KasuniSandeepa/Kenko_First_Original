/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import javax.servlet.ServletContext;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import static utils.Strings.TextPrettyPrint;

/**
 * @author njb
 */
public class FilesAndFolders {

    //web.xml parameter values
    public static final String CROPS_FOLDER = "folder.crops";

//    public static void main(String[] args) {
////        FilesInFolderGet("C:\\Users\\NCCS\\Desktop\\X\\crop-images");
//        List<String> FileList = FileListInFolderGet(
//                "C:\\Users\\NCCS\\Documents\\IdeaProjects\\java_ee_context_params\\web\\dist-assets\\images\\crops"
//        );
//        for (String S : FileList
//        ) {
//            System.out.println(S);
//        }
//    }

    public static Map<String, String> FileMapInWebAppFolderGet(ServletContext ServletContext) {
        Map<String, String> FileMap = null;
        try {
            //--path
            String Path = ServletContext.getRealPath("/");
            //target folder in 'webapp' dir [mapped in web.xml]
            String WebAppFolder = ServletContext.getInitParameter(CROPS_FOLDER);
            File Folder = new File(Path + WebAppFolder);
            File[] FileArray = Folder.listFiles();
            int Count = 0;
            String FileName = "";
            //--TreeMap is sorted
            FileMap = new TreeMap<>();
            for (File File : FileArray) {
                if (File.isFile()) {
                    Count++;
                    FileName = File.getName();
//                    System.out.println(Count + ". " +FileName);
                    FileMap.put(TextPrettyPrint(File.getName()), (WebAppFolder + "\\" + FileName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FileMap;
    }

    public static List<String> FileListInWebAppFolderGet(ServletContext ServletContext, String WebXmlParameterName) {
        List<String> FileList = null;
        try {
            //--path
            String Path = ServletContext.getRealPath("/");
            //target folder in 'webapp' dir [mapped in web.xml]
            String WebAppFolder = ServletContext.getInitParameter(WebXmlParameterName);
            File Folder = new File(Path + WebAppFolder);
            File[] FileArray = Folder.listFiles();
            int Count = 0;
            String FileName = "";
            FileList = new LinkedList<>();
            for (File File : FileArray) {
                if (File.isFile()) {
                    Count++;
                    FileName = File.getName();
//                    System.out.println(Count + ". " +FileName);
                    FileList.add(FileName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FileList;
    }

    public static List<String> FileListInFolderGet(String FilePath) {
        List<String> FileList = null;
        try {
            File Folder = new File(FilePath);
            File[] FileArray = Folder.listFiles();
            int Count = 0;
            String FileName = "";
            FileList = new LinkedList<>();
            for (File File : FileArray) {
                if (File.isFile()) {
                    Count++;
                    FileName = File.getName();
//                    System.out.println(Count + ". " +FileName);
                    FileList.add(FileName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FileList;
    }

    //--
    private FilesAndFolders() {
    }

    //--
    public static FilesAndFolders FilesAndFolders;

    //--
    public static FilesAndFolders getFilesAndFolders() {
        if (FilesAndFolders == null) {
            FilesAndFolders = new FilesAndFolders();
        }
        return FilesAndFolders;
    }

    public static void FolderVerify(String file_src) {
        File file = new File(file_src);
        String fileName = file.getName();
        if (file.exists()) {
            System.out.println("Directory: '" + fileName + "' exists!");
        } else {
            file.mkdir();
            System.out.println("Directory: '" + fileName + "' created!");
        }
    }

    public static void FileVerify(String file_src) {
        File file = new File(file_src);
        String fileName = file.getName();
        if (file.exists() && !file.isDirectory()) {
            System.out.println("File: '" + fileName + "' exists!");
        } else {
            System.out.println("File: '" + fileName + "' not found!");
        }
    }

    //storage location of images in local pc
    public static final String PROFILES_IMAGES_UPLOAD_FOLDER
            = "E:\\Tests\\KF\\Uploaded_Images\\Profiles\\";
    public static final String LANDS_IMAGES_UPLOAD_FOLDER
            = "E:\\Tests\\KF\\Uploaded_Images\\Lands\\";
    public static final String CROPS_IMAGES_UPLOAD_FOLDER
            = "E:\\Tests\\KF\\Uploaded_Images\\Crops\\";

    //storage location of json files in local pc
    public static final String FILE_UPLOAD_DIRECTORY
            = "E:\\Work\\Projects\\Kenko-First\\KF-Upload-Directory\\";
    public static final String JSON_TEST_FILE = FILE_UPLOAD_DIRECTORY
            + "contents\\json\\test.json";
    public static final String JSON_APPLICATION_DATA = FILE_UPLOAD_DIRECTORY
            + "contents\\json\\ApplicationData.json";
    public static final String JSON_LOCATION_DATA = FILE_UPLOAD_DIRECTORY
            + "contents\\json\\LocationArrays.json";

    //storage location of geo-lite database in local pc
//    public static final String GEO_LOCATION_DATABASE = FILE_UPLOAD_DIRECTORY
//            + "contents\\databases\\GeoLite2-City.mmdb";

    //storage location of images in project
    public static final String PROFILES_IMAGES_FOLDER = "/contents/profiles/";
    public static final String CROPS_IMAGES_FOLDER = "/contents/crops/";
    public static final String LANDS_IMAGES_FOLDER = "/contents/lands/";

    public static boolean IsFileExists(String FilePath) {
        boolean IsFileExists = false;
        File File;
        try {
            File = new File(FilePath);
            IsFileExists = File.exists();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return IsFileExists;
    }

    public static boolean FileDelete(String FilePath) {
        boolean IsFileDeleted = false;
        try {
            File f = new File(FilePath);
            if (f.delete()) {
                System.out.println(f.getName() + " deleted");
            } else {
                System.out.println("failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return IsFileDeleted;
    }

    private static List<String> FileListInTheFolderGet(String FilePath) {
        List<String> FileList = null;
        try {
            File Folder = new File(FilePath);
            File[] FileArray = Folder.listFiles();
            int Count = 0;
            String FileName = "";
            FileList = new LinkedList<>();
            for (File File : FileArray) {
                if (File.isFile()) {
                    Count++;
                    FileName = File.getName();
//                    System.out.println(Count + ". " +FileName);
                    FileList.add(FileName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FileList;
    }

    private static void FilesInTheFolderGet(String FilePath) {

        try {

            File Folder = new File(FilePath);
            File[] FileArray = Folder.listFiles();
            int Count = 0;
            String FileOriginal = "", FileName = "", FileExtension = "", FileNameCapitalized = "";
            String FileAbsolutePath = "", DateString = "";
            long FileModifiedDateInMilliSeconds = 0;
            Date Date = null;
            SimpleDateFormat SDF = null;
            for (File File : FileArray) {
                if (File.isFile()) {
                    Count++;
                    FileOriginal = File.getName();
                    FileName = File.getName().split("\\.")[0];
                    FileExtension = File.getName().split("\\.")[1];
                    FileNameCapitalized = FileName.substring(0, 1).toUpperCase() + FileName.substring(1);
                    FileAbsolutePath = File.getAbsolutePath();
                    FileModifiedDateInMilliSeconds = File.lastModified();
                    //milliseconds to DateFormat
                    Date = new Date(FileModifiedDateInMilliSeconds);
                    SDF = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
                    DateString = SDF.format(Date);
                    //--------------------------
//                    System.out.println(FileAbsolutePath + " - " +FileName+ " - " + FileExtension + " - " + DateString);
//                    System.out.println(Count + ". " +FileName);
                    System.out.println(Count + ". " + FileOriginal);
//                    System.out.println("\"" + FileNameCapitalized.replaceAll("-", " ") + "\",");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
