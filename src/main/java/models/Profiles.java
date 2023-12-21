package models;

public class Profiles {

    //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, PassWord, Address, PhotoUrl, Province, District,
    // GnArea, LandState, CropState, RegisteredDate, Uuid, FkProfileTypes
    private int PkProfiles;
    private String Name, NIC, DateOfBirth, Gender, MobileNumber, Address, PhotoUrl, Province, District;
    private String GnArea, LandState, CropState, RegisteredDate, Uuid;
    private ProfileTypes ProfileTypes;

    public int getPkProfiles() {
        return PkProfiles;
    }

    public void setPkProfiles(int pkProfiles) {
        PkProfiles = pkProfiles;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getMobileNumber() {
        return MobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        MobileNumber = mobileNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPhotoUrl() {
        return PhotoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        PhotoUrl = photoUrl;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String province) {
        Province = province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        District = district;
    }

    public String getGnArea() {
        return GnArea;
    }

    public void setGnArea(String gnArea) {
        GnArea = gnArea;
    }

    public String getLandState() {
        return LandState;
    }

    public void setLandState(String landState) {
        LandState = landState;
    }

    public String getCropState() {
        return CropState;
    }

    public void setCropState(String cropState) {
        CropState = cropState;
    }

    public String getRegisteredDate() {
        return RegisteredDate;
    }

    public void setRegisteredDate(String registeredDate) {
        RegisteredDate = registeredDate;
    }

    public String getUuid() {
        return Uuid;
    }

    public void setUuid(String uuid) {
        Uuid = uuid;
    }

    public models.ProfileTypes getProfileTypes() {
        return ProfileTypes;
    }

    public void setProfileTypes(models.ProfileTypes profileTypes) {
        ProfileTypes = profileTypes;
    }

    public Profiles(int pkProfiles, String name, String NIC, String dateOfBirth, String gender, String mobileNumber,
                    String address, String photoUrl, String province, String district, String gnArea, String landState,
                    String cropState, String registeredDate, String uuid, models.ProfileTypes profileTypes) {
        PkProfiles = pkProfiles;
        Name = name;
        this.NIC = NIC;
        DateOfBirth = dateOfBirth;
        Gender = gender;
        MobileNumber = mobileNumber;
        Address = address;
        PhotoUrl = photoUrl;
        Province = province;
        District = district;
        GnArea = gnArea;
        LandState = landState;
        CropState = cropState;
        RegisteredDate = registeredDate;
        Uuid = uuid;
        ProfileTypes = profileTypes;
    }
}
