import UIKit

class TalksViewController: UITableViewController{
    
    //to be injected
    var dataSource: TalksDataSource!{
        didSet{
            fetchModels()
        }
    }
    
    func fetchModels(){
        self.dataSource?.fetchModels(){ successfully in
            if successfully {
                
                //check if tableView is loaded already
                if self.tableView != nil {
                    self.tableView.dataSource = self.dataSource
                    //back to main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
                
            }
        }
    }
    
    
}