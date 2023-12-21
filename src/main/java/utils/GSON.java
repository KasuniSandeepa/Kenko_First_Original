package utils;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.servlet.ServletContext;
import java.io.FileReader;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import static utils.Strings.TextPrettyPrint;

public class GSON {

    //web.xml parameter values
    public static final String CROPS_JSON = "json.Crops";

//    public static void main(String[] args) {
//        for (String s : JsonArrayTraverse()) {
//            System.out.println(s);
//        }
//    }

    public static Map<String, String> CropsMapGet(ServletContext ServletContext) {
        //get a specific string array .json file
        JsonParser JsonParser = new JsonParser();
        Map<String, String> CropMap = null;
        try {
            //--path
            String Path = ServletContext.getRealPath("/");
            //.json file in 'webapp' dir [mapped in web.xml]
            String CropsFile = ServletContext.getInitParameter(CROPS_JSON);
//            System.out.println(Path + CropsFile);
            //.json file in web root folder[mapped in web.xml]
            Object Object = JsonParser.parse(new FileReader(Path + CropsFile));
            //object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //specific string array in the .json file
            JsonArray JsonArray = JsonObject.getAsJsonArray("Crops");
            CropMap = new HashMap<>();
            for (JsonElement e : JsonArray) {
                CropMap.put(TextPrettyPrint(e.getAsString()), TextPrettyPrint(e.getAsString()));
//                System.out.println(e.getAsString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return CropMap;
    }

    public static List<String> JsonArrayListGet(ServletContext ServletContext) {
        //get a specific string array .json file
        JsonParser JsonParser = new JsonParser();
        List CropList = null;
        try {
            //--path
            String Path = ServletContext.getRealPath("/");
            //.json file in 'webapp' dir [mapped in web.xml]
            String CropsFile = ServletContext.getInitParameter(CROPS_JSON);
//            System.out.println(Path + CropsFile);
            //.json file in web root folder[mapped in web.xml]
            Object Object = JsonParser.parse(new FileReader(Path + CropsFile));
            //object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //specific string array in the .json file
            JsonArray JsonArray = JsonObject.getAsJsonArray("Crops");
            CropList = new LinkedList<>();
            for (JsonElement e : JsonArray) {
                CropList.add(e.getAsString());
//                System.out.println(e.getAsString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return CropList;
    }

    public static List<String> JsonArrayListGet(String FileName) {
        //get a specific string array .json file
        JsonParser JsonParser = new JsonParser();
        List CropList = null;
        try {
            //.json file in web root folder[mapped in web.xml]
            Object Object = JsonParser.parse(new FileReader(FileName));
            //object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //specific string array in the .json file
            JsonArray JsonArray = JsonObject.getAsJsonArray("Crops");
            CropList = new LinkedList<>();
            for (JsonElement e : JsonArray) {
                CropList.add(e.getAsString());
//                System.out.println(e.getAsString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return CropList;
    }

    public static List<String> JsonArrayTraverse() {
        //get a specific string array .json file
        JsonArray JsonArray = null;
        JsonParser JsonParser = new JsonParser();
        List CropList = null;
        try {
            //'.json' file exists in the 'project' directory as a peer of 'src' folder
            Object Object = JsonParser.parse(new FileReader("Crops.json"));
            //--
//            Context initContext = new InitialContext();
//            String log4jConfigFile = context.getInitParameter("json-crops");
            //--
            //get cast object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //get a specific string array .json file
            JsonArray = JsonObject.getAsJsonArray("Crops");
            CropList = new LinkedList<>();
            for (JsonElement e : JsonArray) {
                CropList.add(e.getAsString());
//                System.out.println(e.getAsString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        return JsonArray;
        return CropList;
    }

//    private static void JsonObjectStringRead() {
//        Gson Gson = new Gson();
//        Guest Guest = Gson.fromJson(JsonStringOfGuestObjectGet(), Guest.class);
//        System.out.println("Name: " + Guest.getName() + "\n"
//                        + "Number: " + Guest.getNumber() + "\n"
//                        + "Is VIP: " + Guest.isVip() + "\n"
//                        + "Entrance Fee: " + Guest.getEntranceFee());
//    }

//    private static String JsonStringOfGuestObjectGet() {
//        //Name, Number, IsVip, EntranceFee;
//        Guest Guest = new Guest("Nick", 5, true, 2500.00);
//        //to string
//        Gson Gson = new Gson();
//        String JsonString = Gson.toJson(Guest);
//        System.out.println(JsonString);
//        return JsonString;
//    }

}
