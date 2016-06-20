import UIKit

class TalksViewController: UITableViewController{
    
    var dataSource: TalksDataSource!{
        didSet{
            fetchModels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add top inset
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    
    func fetchModels(){
        self.dataSource?.fetchModels(){ successfully in
            if successfully {
                self.tableView.dataSource = self.dataSource
                //back to main thread
                dispatch_async(dispatch_get_main_queue(), { 
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    
}