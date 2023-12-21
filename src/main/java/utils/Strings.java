package utils;

import configs.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Strings {

//    public static void main(String[] args) {
//        SortItemsByName(CROPS_ENGLISH);
//        TextArrayToJavaStringArray(TEXT_ARRAY);
//        for (String S : TEXT.split("\n")
//        ) {
////            System.out.println("\"" + S + "ha" + "\",");
////            System.out.println("\"" + S + "\",");
//            System.out.println(S + "\",");
//        }
//        StringArraysCompare(CROPS, YIELDS);
//        List TemPList = Arrays.asList(YIELDS);
//        Collections.sort(TemPList);
//        for (int i = 0; i < TemPList.size(); i++) {
//            System.out.println(TemPList.get(i));
//        }
//        TraverseThreeStringArrays(CROPS_ENGLISH, CROPS_SINHALESE, CROPS_TAMIL);
//    }

    //variables
    public static String APPLICATION_NAME = Config.Read("ApplicationName");

    private static void TraverseThreeStringArrays(String[] Array_01, String[] Array_02, String[] Array_03) {
        for (int i = 0; i < Array_01.length && i < Array_02.length && i < Array_03.length; i++) {
            //["Carrot", "කැරට්", "கேரட்"],
//            System.out.println("[\"" + Array_01[i] + "\", \"" + Array_02[i] + "\", \"" + Array_03[i] + "\"],");
            /*
            } else if (cropName === "Leeks" || cropName === "ලීක්ස්" || cropName === "லீக்ஸ்") {
            cropNumber = 1;
            */
            System.out.println("} else if (cropName === \"" + Array_01[i] + "\" || cropName === \"" + Array_02[i]
                    + "\" || cropName === \"" + Array_03[i] + "\") {\n" +
                    "            cropNumber = "+i+";");
        }
    }

    private static void TextArrayToJavaStringArray(String[] TextArray) {
        String X = "";
        for (String S : TextArray
        ) {
            X += S.replaceAll("\n", "");
        }
//        System.out.println("X: " + X);
        //--
        String[] Temp = X.split("ha");
        List TemPList = Arrays.asList(Temp);
        Collections.sort(TemPList);
        for (int i = 0; i < TemPList.size(); i++) {
//            System.out.println("\"" + TemPList.get(i) + "ha" + "\",");
            System.out.println("\"" + TemPList.get(i) + "\",");
        }
    }

    private static void StringArraysCompare(String[] crops, String[] yields) {
        String X = "";
        int C = 0;
        for (int i = 0; i < Math.max(crops.length, yields.length); i++) {
            if (i < crops.length && i < yields.length) {
//                System.out.println("* "+yields[i]);
            } else if (i < crops.length) {
                C++;
                System.out.println(crops[i] + ",Standard,6-8 t/ha");
            } else {
                System.out.println("* " + yields[i]);
            }
        }
        System.out.println("New: " + C);
    }

    public static final String TEXT =
            "[\"Apple\", \"ඇපල්\", \"\n" +
                    "[\"Artichoke\", \"අර්ටිචෝක්\", \"\n" +
                    "[\"Asparagus\", \"ඇස්පරගස්\", \"\n" +
                    "[\"Avocado\", \"අලිගැටපේර\", \"\n" +
                    "[\"Banana\", \"කෙසෙල්\", \"\n" +
                    "[\"Beans\", \"බෝංචි\", \"\n" +
                    "[\"Beetroot\", \"බීට්රූට්\", \"\n" +
                    "[\"Bell Pepper\", \"බෙල් පෙපර්\", \"\n" +
                    "[\"Berries\", \"බෙරි\", \"\n" +
                    "[\"Bitter Gourd\", \"කරවිල\", \"\n" +
                    "[\"Brinjal\", \"බටු\", \"\n" +
                    "[\"Broccoli\", \"බ්රොකොලී\", \"\n" +
                    "[\"Cabbage\", \"ගෝවා\", \"\n" +
                    "[\"Capsicum\", \"මාළු මිරිස්\", \"\n" +
                    "[\"Carrot\", \"කැරට්\", \"\n" +
                    "[\"Cauliflower\", \"මල්ගෝවා\", \"\n" +
                    "[\"Celery\", \"සැල්දිරි\", \"\n" +
                    "[\"Cherry\", \"චෙරි\", \"\n" +
                    "[\"Chili\", \"මිරිස්\", \"\n" +
                    "[\"Coconut\", \"පොල්\", \"\n" +
                    "[\"Corn\", \"ඉරිඟු\", \"\n" +
                    "[\"Cucumber\", \"පිපිඤ්ඤා\", \"\n" +
                    "[\"Durian\", \"දූරියන්\", \"\n" +
                    "[\"Eggplant\", \"වම්බටු\", \"\n" +
                    "[\"Garlic\", \"සුදුළුනු\", \"\n" +
                    "[\"Gooseberry\", \"ගූස්බෙරි\", \"\n" +
                    "[\"Grapes\", \"මිදි\", \"\n" +
                    "[\"Green Chili\", \"හරිත මිරිස්\", \"\n" +
                    "[\"Kiwi\", \"කීවි\", \"\n" +
                    "[\"Knokhol\", \"නොකොල්\", \"\n" +
                    "[\"Leeks\", \"ලීක්ස්\", \"\n" +
                    "[\"Lemon\", \"දෙහි\", \"\n" +
                    "[\"Lettuce\", \"ලෙටිස්\", \"\n" +
                    "[\"Lime\", \"දෙහි\", \"\n" +
                    "[\"Long Beans\", \"දිගු බෝංචි\", \"\n" +
                    "[\"Mango\", \"අඹ\", \"\n" +
                    "[\"Melon\", \"කොමඩු\", \"\n" +
                    "[\"Mint Leaves\", \"මින්ට් කොළ\", \"\n" +
                    "[\"Mushroom\", \"හතු\", \"\n" +
                    "[\"Okra\", \"බණ්ඩක්කා\", \"\n" +
                    "[\"Onion\", \"ලූනු\", \"\n" +
                    "[\"Orange\", \"දොඩම්\", \"\n" +
                    "[\"Papaya\", \"පැපොල්\", \"\n" +
                    "[\"Pear\", \"පෙයා\", \"\n" +
                    "[\"Peas\", \"කඩල\", \"\n" +
                    "[\"Pineapple\", \"අන්නාසි\", \"\n" +
                    "[\"Plum\", \"වියලි මිදි\", \"\n" +
                    "[\"Pomegranate\", \"දෙළුම්\", \"\n" +
                    "[\"Potato\", \"අල\", \"\n" +
                    "[\"Pumpkin\", \"වට්ටක්කා\", \"\n" +
                    "[\"Radish\", \"රාබු\", \"\n" +
                    "[\"Raspberry\", \"රාස්බෙරි\", \"\n" +
                    "[\"Red Cabbage\", \"රතු ගෝවා\", \"\n" +
                    "[\"Spinach\", \"නිවිති\", \"\n" +
                    "[\"Strawberry\", \"ස්ට්රෝබෙරි\", \"\n" +
                    "[\"Sweet Pepper\", \"මිහිරි ගම්මිරිස්\", \"\n" +
                    "[\"Tomato\", \"තක්කාලි\", \"\n" +
                    "[\"Turmeric\", \"කහ\", \"\n" +
                    "[\"Watermelon\", \"කොමඩු\", \"\n" +
                    "[\"Zucchini\", \"සුකිනි\", \"";

    public static String[] YIELDS = {
            "Apple,Standard,6-8 t/ha",
            "Artichoke,Standard,6-8 t/ha",
            "Asparagus,Standard,6-8 t/ha",
            "Avocado,Standard,6-8 t/ha",
            "Banana,Standard,6-8 t/ha",
            "Beans,Bush Bean,6-10 t/ha",
            "Beans,Pole Bean,9-12 t/ha",
            "Beetroot,Hybrid,16-18 t/ha",
            "Beetroot,Non Hybrid,12-15 t/ha",
            "Bell Pepper,Standard,6-8 t/ha",
            "Berries,Standard,6-8 t/ha",
            "Bitter Gourd,Standard,15 t/ha",
            "Brinjal,Amanda(F1 Hybrid),30-35 t/ha",
            "Brinjal,Anjalee(F1 Hybrid),30-40 t/ha",
            "Brinjal,SM-64,15-18 t/ha",
            "Broccoli,Standard,6-8 t/ha",
            "Cabbage,Standard,18.03 t/ha",
            "Capsicum,C.A. - 8 (Dry Zone),10-15 t/ha",
            "Capsicum,C.A. - 8 (Wet Zone),6-8 t/ha",
            "Capsicum,H.Y.W.,10-15 t/ha",
            "Carrot,Hybrid,55-60 t/ha",
            "Carrot,Non Hybrid,30-35 t/ha",
            "Cauliflower,Standard,6-8 t/ha",
            "Celery,Standard,6-8 t/ha",
            "Cherry,Standard,6-8 t/ha",
            "Chili,Standard,6-8 t/ha",
            "Coconut,Standard,6-8 t/ha",
            "Corn,Standard,6-8 t/ha",
            "Cucumber,Standard,6-8 t/ha",
            "Durian,Standard,6-8 t/ha",
            "Eggplant,Standard,6-8 t/ha",
            "Garlic,Standard,6-8 t/ha",
            "Gooseberry,Standard,6-8 t/ha",
            "Grapes,Standard,6-8 t/ha",
            "Green Chili,Standard,6-8 t/ha",
            "Kiwi,Standard,6-8 t/ha",
            "Knokhol,Standard,6-8 t/ha",
            "Leeks,Standard,30-40 t/ha",
            "Lemon,Standard,6-8 t/ha",
            "Lettuce,Standard,6-8 t/ha",
            "Lime,Standard,6-8 t/ha",
            "Long Beans,Standard,6-8 t/ha",
            "Mango,Standard,6-8 t/ha",
            "Melon,Standard,6-8 t/ha",
            "Mint Leaves,Standard,6-8 t/ha",
            "Mushroom,Standard,6-8 t/ha",
            "Okra,Standard,10-15 t/ha",
            "Onion,Standard,6-8 t/ha",
            "Orange,Standard,6-8 t/ha",
            "Papaya,Standard,6-8 t/ha",
            "Pear,Standard,6-8 t/ha",
            "Peas,Standard,6-8 t/ha",
            "Pineapple,Standard,6-8 t/ha",
            "Plum,Standard,6-8 t/ha",
            "Pomegranate,Standard,6-8 t/ha",
            "Potato,Standard,6-8 t/ha",
            "Pumpkin,Standard,15000-25000 kg/ha",
            "Radish,Beeralu,20-30 t/ha",
            "Radish,Japanese Ball,40-50 t/ha",
            "Raspberry,Standard,6-8 t/ha",
            "Red Cabbage,Standard,6-8 t/ha",
            "Spinach,Standard,6-8 t/ha",
            "Strawberry,Standard,6-8 t/ha",
            "Sweet Pepper,Standard,6-8 t/ha",
            "Tomato,Standard,20-30 t/ha",
            "Turmeric,Standard,6-8 t/ha",
            "Watermelon,Standard,6-8 t/ha",
            "Zucchini,Standard,6-8 t/ha"
    };

    public static final String[] CROPS_ENGLISH = {
            "Apple",
            "Artichoke",
            "Asparagus",
            "Avocado",
            "Banana",
            "Beans",
            "Beetroot",
            "Bell Pepper",
            "Berries",
            "Bitter Gourd",
            "Brinjal",
            "Broccoli",
            "Cabbage",
            "Capsicum",
            "Carrot",
            "Cauliflower",
            "Celery",
            "Cherry",
            "Chili",
            "Coconut",
            "Corn",
            "Cucumber",
            "Durian",
            "Eggplant",
            "Garlic",
            "Gooseberry",
            "Grapes",
            "Green Chili",
            "Kiwi",
            "Knokhol",
            "Leeks",
            "Lemon",
            "Lettuce",
            "Lime",
            "Long Beans",
            "Mango",
            "Melon",
            "Mint Leaves",
            "Mushroom",
            "Okra",
            "Onion",
            "Orange",
            "Papaya",
            "Pear",
            "Peas",
            "Pineapple",
            "Plum",
            "Pomegranate",
            "Potato",
            "Pumpkin",
            "Radish",
            "Raspberry",
            "Red Cabbage",
            "Spinach",
            "Strawberry",
            "Sweet Pepper",
            "Tomato",
            "Turmeric",
            "Watermelon",
            "Zucchini"
            //--
//            "Leeks",
//            "Tomato",
//            "Banana",
//            "Beans",
//            "Papaya",
//            "Green chili",
//            "Turmeric",
//            "Onion",
//            "Carrot",
//            "Okra",
//            "Long beans",
//            "Cabbage"
    };

    public static final String[] CROPS_SINHALESE = {
            "ඇපල්",
            "අර්ටිචෝක්",
            "ඇස්පරගස්",
            "අලිගැටපේර",
            "කෙසෙල්",
            "බෝංචි",
            "බීට්රූට්",
            "බෙල් පෙපර්",
            "බෙරි",
            "කරවිල",
            "බටු",
            "බ්රොකොලී",
            "ගෝවා",
            "මාළු මිරිස්",
            "කැරට්",
            "මල්ගෝවා",
            "සැල්දිරි",
            "චෙරි",
            "මිරිස්",
            "පොල්",
            "ඉරිඟු",
            "පිපිඤ්ඤා",
            "දූරියන්",
            "වම්බටු",
            "සුදුළුනු",
            "ගූස්බෙරි",
            "මිදි",
            "හරිත මිරිස්",
            "කීවි",
            "නොකොල්",
            "ලීක්ස්",
            "දෙහි",
            "ලෙටිස්",
            "දෙහි",
            "දිගු බෝංචි",
            "අඹ",
            "කොමඩු",
            "මින්ට් කොළ",
            "හතු",
            "බණ්ඩක්කා",
            "ලූනු",
            "දොඩම්",
            "පැපොල්",
            "පෙයා",
            "කඩල",
            "අන්නාසි",
            "වියලි මිදි",
            "දෙළුම්",
            "අල",
            "වට්ටක්කා",
            "රාබු",
            "රාස්බෙරි",
            "රතු ගෝවා",
            "නිවිති",
            "ස්ට්රෝබෙරි",
            "මිහිරි ගම්මිරිස්",
            "තක්කාලි",
            "කහ",
            "කොමඩු",
            "සුකිනි"
    };

    public static final String[] CROPS_TAMIL = {
            "ஆப்பிள்",
            "கூனைப்பூ",
            "அஸ்பாரகஸ்",
            "வெண்ணெய்",
            "வாழை",
            "பீன்ஸ்",
            "பீட்ரூட்",
            "பெல்பெப்பர்",
            "பெர்ரி",
            "பாகற்காய்",
            "கத்திரிக்காய்",
            "ப்ரோக்கோலி",
            "முட்டைக்கோஸ்",
            "கேப்சிகம்",
            "கேரட்",
            "காலிஃபிளவர்",
            "செலரி",
            "செர்ரி",
            "மிளகாய்",
            "தேங்காய்",
            "சோளம்",
            "வெள்ளரிக்காய்",
            "துரியன்",
            "கத்திரிக்காய்",
            "பூண்டு",
            "நெல்லிக்காய்",
            "திராட்சை",
            "பச்சை மிளகாய்",
            "கிவி",
            "நோகோல்",
            "லீக்ஸ்",
            "எலுமிச்சை",
            "கீரை",
            "சுண்ணாம்பு",
            "நீண்ட பீன்ஸ்",
            "மாங்கனி",
            "முலாம்பழம்",
            "புதினா இலைகள்",
            "காளான்",
            "ஓக்ரா",
            "வெங்காயம்",
            "ஆரஞ்சு",
            "பப்பாளி",
            "பேரிக்காய்",
            "பட்டாணி",
            "அன்னாசி",
            "பிளம்",
            "மாதுளை",
            "உருளைக்கிழங்கு",
            "பூசணி",
            "முள்ளங்கி",
            "ராஸ்பெர்ரி",
            "சிவப்பு முட்டைக்கோஸ்",
            "கீரை",
            "ஸ்ட்ராபெரி",
            "இனிப்பு மிளகு",
            "தக்காளி",
            "மஞ்சள்",
            "தர்பூசணி",
            "சுரைக்காய்"
    };

    //getters and setters

    //constructors

    //operators

    public static String TextPrettyPrintInverse(String File) {
        //remove extension and hyphens - remove
        String FileName = File.toLowerCase().replaceAll(" ", "-");
        return FileName;
    }

    public static String TextPrettyPrint(String File) {
        String FirstName = "", SecondName = "", TextUpperCased = "";
        //remove extension and hyphens
        String FileName = File.split("\\.")[0].replaceAll("-", " ");
        try {
            FirstName = FileName.split(" ")[0];
        } catch (Exception e) {
//            System.out.println(e);
        }
        try {
            SecondName = FileName.split(" ")[1];
        } catch (Exception e) {
//            System.out.println(e);
        }
        if (SecondName.isEmpty()) {
            TextUpperCased = UppercaseFirstLetter(FirstName);
        } else {
            TextUpperCased = UppercaseFirstLetter(FirstName) + " " + UppercaseFirstLetter(SecondName);
        }
        return TextUpperCased;
    }

    private static String UppercaseFirstLetter(String Text) {
        String UpperCasedFirstLetter = Text.substring(0, 1).toUpperCase() + Text.substring(1);
        return UpperCasedFirstLetter;
    }

    public static String RenamePrimaryKey(String tableName) {
        String TrimmedName = RemoveFirstTwoLetters(tableName);
        int Index = 0;
        char CharacterToUppercase = Character.toUpperCase(tableName.charAt(0));
        String RenamedPrimaryKey = TrimmedName.replace(TrimmedName.charAt(Index),
                CharacterToUppercase);
        return RenamedPrimaryKey;
    }

    public static String RemoveFirstTwoLetters(String tableName) {
        String TrimmedName = tableName.substring(3, tableName.length() - 1);
        return TrimmedName;
    }

    public static String UnderscoresReplace(String Name) {
        String NewName = Name.replaceAll("_", " ");
        return NewName;
    }

    public static String StringShorten(String DateString) {
        //2021-05-27 17:03:43.633
        return new String(DateString.substring(0, 16));
    }

    public static String PhotoUrlRename(String PhotoUrl) {
        return PhotoUrl.replaceAll("\\\\", "\\\\\\\\");
    }

    public static void SortItemsByName(String[] ItemArray) {
        List<String> List = Arrays.asList(ItemArray);
        Collections.sort(List);
        for (String s : List
        ) {
            System.out.println(s);
        }
    }

}
