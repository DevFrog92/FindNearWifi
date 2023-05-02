package wifi.data;

public class WifiApiJsonDTO {
    private TbPublicWifiInfoObjectDTO TbPublicWifiInfo;

    public WifiApiJsonDTO() {}

    public long getTotalAmount() {
        return TbPublicWifiInfo.getListTotalCount();
    }

    public WIFIInfoDetailDTO[] getRow() {
        return TbPublicWifiInfo.getRow();
    }
}
