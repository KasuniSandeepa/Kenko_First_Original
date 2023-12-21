package models;

public class CropTypeVariety {

    //PkCropTypeVarieties, Name, FkCropTypes
    private int _PkCropTypeVarieties;
    private String _Name;
    private int _FkCropTypes;

    public int get_PkCropTypeVarieties() {
        return _PkCropTypeVarieties;
    }

    public void set_PkCropTypeVarieties(int _PkCropTypeVarieties) {
        this._PkCropTypeVarieties = _PkCropTypeVarieties;
    }

    public String get_Name() {
        return _Name;
    }

    public void set_Name(String _Name) {
        this._Name = _Name;
    }

    public int get_FkCropTypes() {
        return _FkCropTypes;
    }

    public void set_FkCropTypes(int _FkCropTypes) {
        this._FkCropTypes = _FkCropTypes;
    }

    public CropTypeVariety(int _PkCropTypeVarieties, String _Name, int _FkCropTypes) {
        this._PkCropTypeVarieties = _PkCropTypeVarieties;
        this._Name = _Name;
        this._FkCropTypes = _FkCropTypes;
    }

}
