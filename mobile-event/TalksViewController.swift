import UIKit

class TalksViewController: UITableViewController{
    
    //to be injected
    var dataSource: TalksDataSource!
    
    override func viewDidLoad() {
        guard dataSource != nil else {
            return
        }
        
        tableView.dataSource = dataSource
        dataSource!.fetchModels {
            self.tableView.reloadData()
        }
    }
    
}