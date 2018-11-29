package jrsample.main;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jrsample.dto.SampleDto;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class JrsampleMain {
    public static void main(String[] args) throws Exception {
        // Create report data source.
        List<SampleDto> dtoLs = new ArrayList<SampleDto>();
        for (int i = 0; i < 3; i++) {
            SampleDto dto = new SampleDto();
            dto.setFoo("foo");
            dto.setBar("bar");
            dto.setBaz(1234);
            dtoLs.add(dto);
        }
        JRDataSource ds = new JRBeanCollectionDataSource(dtoLs);

        // Load report layout.
        InputStream stream = ClassLoader.getSystemResourceAsStream("report/report1.jrxml");

        /*
         * if language="groovy" exist in .jrxml below exception thrown.
         * jasper java.lang.NoClassDefFoundError:
         *   org/codehaus/groovy/control/CompilationFailedException
         */

        // Compile report layout.
        JasperReport report = JasperCompileManager.compileReport(stream);

        // Create parameter.
        Map<String, Object> parameters = new HashMap<String, Object>();

        // Create report.
        JasperPrint print = JasperFillManager.fillReport(report, parameters, ds);

        // Export to PDF.
        JasperExportManager.exportReportToPdfFile(print, "ANY PATH/example.pdf");
    }
}
