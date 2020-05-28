package test;

import com.pages.LoginPage;
import com.pages.WelcomePage;import org.testng.annotations.Test;

import utils.TestBase;

public class LoginTest  extends TestBase {

        @Test
        public void testLoginTest(){
            LoginPage.clickLogin();
            LoginPage.setUsername("nixsala@gmail.com");
            LoginPage.setPass("hii");
            LoginPage.clickLogin();

        }

    }
