package mybatisSample.entity;

public class MUser {
    private String userCd;
    private String name;

    public String getUserCd() {
        return userCd;
    }

    public void setUserCd(String userCd) {
        this.userCd = userCd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "MUser [userCd=" + userCd + ", name=" + name + "]";
    }
}
