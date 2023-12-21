package models;

public class LandDetails {

    //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
    // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles

    private int PkLandDetails;
    private String Name;
    private String Address;
    private String Province;
    private String District;
    private String GNArea;
    private String LandType;
    private String LandExtent;
    private String Measurements;
    private String CultivationState;
    private String OwnershipState;
    private String Longitude;
    private String Latitude;
    private String PhotoUrl;
    private Profiles Profiles;

    public int getPkLandDetails() {
        return PkLandDetails;
    }

    public void setPkLandDetails(int pkLandDetails) {
        this.PkLandDetails = pkLandDetails;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        this.Address = address;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String province) {
        this.Province = province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        this.District = district;
    }

    public String getGNArea() {
        return GNArea;
    }

    public void setGNArea(String GNArea) {
        this.GNArea = GNArea;
    }

    public String getLandType() {
        return LandType;
    }

    public void setLandType(String landType) {
        this.LandType = landType;
    }

    public String getLandExtent() {
        return LandExtent;
    }

    public void setLandExtent(String landExtent) {
        this.LandExtent = landExtent;
    }

    public String getMeasurements() {
        return Measurements;
    }

    public void setMeasurements(String measurements) {
        this.Measurements = measurements;
    }

    public String getCultivationState() {
        return CultivationState;
    }

    public void setCultivationState(String cultivationState) {
        this.CultivationState = cultivationState;
    }

    public String getOwnershipState() {
        return OwnershipState;
    }

    public void setOwnershipState(String ownershipState) {
        this.OwnershipState = ownershipState;
    }

    public String getLongitude() {
        return Longitude;
    }

    public void setLongitude(String longitude) {
        this.Longitude = longitude;
    }

    public String getLatitude() {
        return Latitude;
    }

    public void setLatitude(String latitude) {
        this.Latitude = latitude;
    }

    public String getPhotoUrl() {
        return PhotoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.PhotoUrl = photoUrl;
    }

    public models.Profiles getProfiles() {
        return Profiles;
    }

    public void setProfiles(models.Profiles profiles) {
        Profiles = profiles;
    }

    public LandDetails(int PkLandDetails, String Name, String Address, String Province, String District,
            String GNArea, String LandType, String LandExtent, String Measurements, String CultivationState,
            String OwnershipState, String Longitude, String Latitude, String PhotoUrl, models.Profiles profiles) {
        this.PkLandDetails = PkLandDetails;
        this.Name = Name;
        this.Address = Address;
        this.Province = Province;
        this.District = District;
        this.GNArea = GNArea;
        this.LandType = LandType;
        this.LandExtent = LandExtent;
        this.Measurements = Measurements;
        this.CultivationState = CultivationState;
        this.OwnershipState = OwnershipState;
        this.Longitude = Longitude;
        this.Latitude = Latitude;
        this.PhotoUrl = PhotoUrl;
        Profiles = profiles;
    }

}
