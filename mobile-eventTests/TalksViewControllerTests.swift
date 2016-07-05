import XCTest
@testable import mobile_event

class TalksViewControllerTests: XCTestCase {
    
    
    //incoming commands (assert direct public side effects)
    func testViewDidLoadReloadsData(){
        //given
        let controller = TalksViewController()
        let tableView = TableViewFake()
        controller.tableView = tableView
        controller.dataSource = DataSourceFake(talkApi: TalkApiFake())
        
        //when
        controller.viewDidLoad()
        
        //then
        XCTAssert(tableView.calledReloadData)
    }
    
    
    //mocks - fake classes
    class DataSourceFake : TalksDataSource{
        
        override func fetchModels(completionHandler: () -> Void) {
            completionHandler()
        }
    }
    
    class TalkApiFake: TalkApi{
        func all(completionHandler: (models: [Talk]) -> Void) {}
    }
    
    class TableViewFake : UITableView{
        
        var calledReloadData = false
        
        override func reloadData() {
            calledReloadData = true
        }
    }
    
}