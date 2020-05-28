package com.pages;

import org.openqa.selenium.By;
import utils.PageBase;

import java.util.logging.Logger;

public class LoginPage extends PageBase {


        private static final Logger LOGGER = Logger.getLogger(String.valueOf(com.pages.LoginPage.class));
        private static By linkLogin = By.linkText("Sign in");

        private static By txtUsername = By.className("UserName");
        private static By txtPass = By.className("PassWord");
         private static By butSubmit = By.className("Submit");






        public static void clickLogin() {
            getDriver().findElement(linkLogin).click();
            LOGGER.info("clicked login");

        }

    public static void setUsername(String uname) {
        getDriver().findElement(txtUsername).sendKeys(uname);
        LOGGER.info("entered username");

    }

    public static void setPass(String upass) {
        getDriver().findElement(txtPass).sendKeys(upass);
        LOGGER.info("entered password");

    }


    public static void cllickSubmit() {
        getDriver().findElement(butSubmit).click();
        LOGGER.info("clicked Submit");

    }




}


