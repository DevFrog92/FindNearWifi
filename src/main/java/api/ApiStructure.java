package api;

public class ApiStructure {
    private  TbPublicWifiInfoObject TbPublicWifiInfo;
    public ApiStructure() {}

    public long getTotalAmount() {
        return TbPublicWifiInfo.getList_total_count();
    }

    public WIFIInfoDetail[] getRow() {
        return TbPublicWifiInfo.getRow();
    }
}

class TbPublicWifiInfoObject {
    private long list_total_count;
    private WIFIInfoDetail[] row;
    public TbPublicWifiInfoObject() {}

    public long getList_total_count() {
        return list_total_count;
    }

    public WIFIInfoDetail[] getRow() {
        return row;
    }
}
