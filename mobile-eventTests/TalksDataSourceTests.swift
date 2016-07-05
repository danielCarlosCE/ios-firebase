import XCTest
@testable import mobile_event

class TalksDataSourceTests: XCTestCase {

    //MARK: incoming query (assert result)
    
    func testNumbeOfRowsInSectionReturnsModelsCount(){
        //given
        let dataSource = TalksDataSource(talkApi: TalkApiFake())
        
        //when 
        dataSource.fetchModels{}

        //then
        let numberRows = dataSource.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(numberRows, 2)
    }
    
    func testCellForRowAtIndexPathReturnsSetCell(){
        //given
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewControllerWithIdentifier("TalksViewController") as! TalksViewController
        let tableView = controller.tableView
        let dataSource = TalksDataSource(talkApi: TalkApiFake())
        
        //when
        dataSource.fetchModels{}
        
        //then
        let cell = dataSource.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        XCTAssert(cell is TalkCell)
    }
    
    //MARK: fake classes
    
    class TalkApiFake: TalkApi{
        func all(completionHandler: (models: [Talk]) -> Void) {
            let talks : [Talk] = [ TalkFake(), TalkFake()]
            completionHandler(models: talks)
        }
    }
    
    class TalkFake: Talk{
        var speakerName = ""
        var talkTitle = ""
        var time = NSDate()
        func downloadImage(completionHandler: (data: NSData?) -> Void) {}
    }
}
