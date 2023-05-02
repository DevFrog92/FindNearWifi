package bookmark;

import java.sql.Date;

public class BookmarkGroupDTO {
    private int id;
    private String name;
    private String level;
    private java.sql.Date createdAt;
    private java.sql.Date editedAt;

    public BookmarkGroupDTO() {}

    public int getId() {
        return id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getEditedAt() {
        return editedAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setEditedAt(Date editedAt) {
        this.editedAt = editedAt;
    }

    public String getName() {
        return name;
    }

    public String getLevel() {
        return level;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
