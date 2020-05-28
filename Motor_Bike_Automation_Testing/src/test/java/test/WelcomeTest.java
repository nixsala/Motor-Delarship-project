package test;

import com.pages.WelcomePage;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.testng.annotations.Test;
import utils.TestBase;

public class WelcomeTest extends TestBase {
    @Test
    public void testWelcome(){
        WelcomePage.clickRegister();

    }

}
