package utils;

import models.Profiles;
import services.ProfilesServices;

import static services.DatabaseCheck.ResultGet;

public class Uuid {

//    public static void main(String[] args) {
////        System.out.println(UuidGenerate() + ": " + UuidGenerate().length());
//        System.out.println("UuidOfProfile: " + UuidOfProfileGet("0712222222", "john123"));
//        System.out.println("MobileNumberOfProfile: " + MobileNumberOfProfileGet("87c435f4-5007-43a6-8cf2-2df66c16cffb"));
//        System.out.println("PasswordOfProfile: " + PasswordOfProfileGet("87c435f4-5007-43a6-8cf2-2df66c16cffb"));
//    }

    public static String UuidGenerate() {
        return new String(java.util.UUID.randomUUID().toString());
    }

}
