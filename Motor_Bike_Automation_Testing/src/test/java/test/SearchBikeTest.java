package test;

import com.pages.LoginPage;
import com.pages.SearchBike;
import org.testng.annotations.Test;
import utils.TestBase;

public class SearchBikeTest extends TestBase {


    @Test
    public void testSearchBike(){
        SearchBike.clickMenuSearch();

    }

}
