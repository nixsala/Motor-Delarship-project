package com.pages;

import org.openqa.selenium.By;
import utils.PageBase;

import java.util.logging.Logger;

public class WelcomePage extends PageBase {

    private static final Logger LOGGER = Logger.getLogger(String.valueOf(WelcomePage.class));
    private static By linkRegister = By.linkText("Register");




    public static void clickRegister() {
        getDriver().findElement(linkRegister).click();
        LOGGER.info("clicked register");

    }



}
