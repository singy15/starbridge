package springPropertiesSample.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import springPropertiesSample.service.SampleService;

public class SpringPropSampleMain {
    public static void main(String[] args) {
        System.out.println("*** spring-properties-sample ***");

        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        SampleService service = (SampleService) context.getBean("sampleService");
        service.show();
    }
}
