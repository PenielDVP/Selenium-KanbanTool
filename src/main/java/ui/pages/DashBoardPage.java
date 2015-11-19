package ui.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import ui.BasePageObject;

/**
 * Created with IntelliJ IDEA.
 * User: DamianVillanueva
 * Date: 11/19/15
 * Time: 2:41 PM
 * To change this template use File | Settings | File Templates.
 */
public class DashBoardPage extends BasePageObject{

    @FindBy(id = "dashboard_items_list")
    @CacheLookup
    WebElement boardsList;

    @FindBy(className = "actions_pane no_reorder")
    @CacheLookup
    WebElement actionsPane;

    @FindBy(className = "Create new board")
    @CacheLookup
    WebElement createNewBoardLink;

    @FindBy(className = "Create new folder")
    @CacheLookup
    WebElement createNewFolderLink;

    @FindBy(className = "Reorder items")
    @CacheLookup
    WebElement reorderItemsLink;

    @Override
    public void waitUntilPageObjectIsLoaded() {
        wait.until(ExpectedConditions.visibilityOf(boardsList));
    }

    public NewBoardPage clickCreateNewBoardLink(){
        createNewBoardLink.click();
        return new NewBoardPage();
    }
    public FoldersNewPage clickCreateNewFolderLink(){
        createNewFolderLink.click();
        return new FoldersNewPage();
    }

    //revisar
    public void clickReorderItemsLink(){
        reorderItemsLink.click();
    }


    public void clickMoreLink(){
        //li[@id='items_board.184834']/div[2]/a[2]/
        WebElement moreLink=boardsList.findElement(By.xpath("//li[@id='items_board.184834']/div[2]/a[2]/"))  ;

        //WebElement editBtn=tableUsers.findElement(By.xpath("//tr[td[contains(text(),'" + userName + "')]]/td[3]/a[1]"));
        //System.out.println("suspend Button:   "+ editBtn.getText());
        moreLink.click();
    }
    public void setNewBoard(String boardName, String boardDescription, String boardTemplate){
        clickCreateNewBoardLink();

    }





}