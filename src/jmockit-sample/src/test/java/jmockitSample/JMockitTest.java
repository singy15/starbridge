package jmockitSample;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;

import jmockitSample.Calc;
import jmockitSample.Foo;
import jmockitSample.Logic;
import mockit.Expectations;
import mockit.Mock;
import mockit.MockUp;
import mockit.Mocked;
import mockit.integration.junit4.JMockit;

@RunWith(JMockit.class)
public class JMockitTest {
//    @Mocked
//    Foo foo;
//
//    @Test
//    public void canGetString() {
//        new Expectations() {{
//            foo.getString();
//            result = "this is mocked";
//        }};
//
//        String actual = foo.getString();
//
//        assertThat(actual, is("this is mocked"));
//    }

    @Test
    public void canGetStringVariant(@Mocked final Foo foo) {
        new Expectations() {{
            foo.getString();
            result = "this is mocked";
        }};

        String actual = foo.getString();

        assertThat(actual, is("this is mocked"));
    }

    @Test
    public void testAsUsual() throws Exception {
        Logic logic = new Logic(new Calc());
        int[] result = logic.getDivisibleNumbers();
        assertTrue(result[0] % result[1] == 0);
    }

    @Test
    public void testInJMockitWithMockups() throws Exception {
        new MockUp<Calc>() {
            @Mock()
            public int remainder(int dividend, int divisor) {
                return divisor == 5 ? 0 : 1;
            }
        };
        Logic logic = new Logic(new Calc());
        int[] result = logic.getDivisibleNumbers();
        assertTrue(result[1] == 5);
    }

    // Cause error
    //    @Test
    //    public void testInJMockit(@Mocked Calc calc) throws Exception {
    //        new Expectations() {
    //            {
    //                calc.remainder(anyInt, 5);
    //                result = 0;
    //                calc.remainder(anyInt, anyInt);
    //                result = 1;
    //            }
    //        };
    //        Logic logic = new Logic(calc);
    //        int[] result = logic.getDivisibleNumbers();
    //        new Verifications() {
    //            {
    //                calc.remainder(anyInt, 5);
    //                minTimes = 1;
    //            }
    //        };
    //        assertTrue(result[1] == 5);
    //    }
}
