package springPropertiesSample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class SampleService {
    @Autowired
    @Qualifier("sampleSubService")
    private SampleSubService sampleSubService;

    public SampleSubService getSampleSubService() {
        return sampleSubService;
    }

    public void setSampleSubService(SampleSubService sampleSubService) {
        this.sampleSubService = sampleSubService;
    }

    public String foo;

    public int bar;

    public void show() {
        System.out.println(String.format("%s %d", foo, bar));
        sampleSubService.showSub();
    }

    public String getFoo() {
        return foo;
    }

    public void setFoo(String foo) {
        this.foo = foo;
    }

    public int getBar() {
        return bar;
    }

    public void setBar(int bar) {
        this.bar = bar;
    }

}
