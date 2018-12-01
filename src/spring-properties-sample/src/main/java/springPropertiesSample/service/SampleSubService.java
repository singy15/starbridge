package springPropertiesSample.service;

public class SampleSubService {
    public String fooSub;

    public void showSub() {
        System.out.println(fooSub);
    }

    public String getFooSub() {
        return fooSub;
    }

    public void setFooSub(String fooSub) {
        this.fooSub = fooSub;
    }
}
