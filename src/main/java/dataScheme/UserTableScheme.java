package dataScheme;

// TODO: just test case. will be remove.
public class UserTableScheme {
    private String name;
    private int age;
    private String joinDate;

    public UserTableScheme() {}

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public UserTableScheme(String name, int age, String joinDate) {
        this.name = name;
        this.age = age;
        this.joinDate = joinDate;
    }
}
