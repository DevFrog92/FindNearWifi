package wifi.data;

class TbPublicWifiInfoObjectDTO {
    private long list_total_count;
    private WIFIInfoDetailDTO[] row;
    public TbPublicWifiInfoObjectDTO() {}

    public long getListTotalCount() {
        return list_total_count;
    }

    public WIFIInfoDetailDTO[] getRow() {
        return row;
    }
}
