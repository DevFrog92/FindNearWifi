package bookmark;

import java.sql.Date;

public class BookmarkDTO {
    private int id;
    private String name;
    private String mgrNo;
    private String groupName;
    private java.sql.Date createdAt;

    public BookmarkDTO() {}

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMgrNo() {
        return mgrNo;
    }

    public String getGroupName() {
        return groupName;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMgrNo(String mgrNo) {
        this.mgrNo = mgrNo;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
