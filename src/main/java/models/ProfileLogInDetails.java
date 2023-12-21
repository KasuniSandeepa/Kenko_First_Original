package models;

public class ProfileLogInDetails {

    //PkProfileLogInDetails, MobileNumber, Password, FkProfiles
    private int PkProfileLogInDetails;
    private String MobileNumber, Password;
    private Profiles Profiles;

    public int getPkProfileLogInDetails() {
        return PkProfileLogInDetails;
    }

    public void setPkProfileLogInDetails(int pkProfileLogInDetails) {
        PkProfileLogInDetails = pkProfileLogInDetails;
    }

    public String getMobileNumber() {
        return MobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        MobileNumber = mobileNumber;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public models.Profiles getProfiles() {
        return Profiles;
    }

    public void setProfiles(models.Profiles profiles) {
        Profiles = profiles;
    }

    public ProfileLogInDetails(int pkProfileLogInDetails, String mobileNumber, String password, models.Profiles profiles) {
        PkProfileLogInDetails = pkProfileLogInDetails;
        MobileNumber = mobileNumber;
        Password = password;
        Profiles = profiles;
    }

}
