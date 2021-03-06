import UIKit

class TalksDataSource: NSObject {
    
    //MARK: properties
    private var talkApi : TalkApi
    private var models : [TalkCellModel] = []
    
    //MARK: inits
    init(talkApi: TalkApi){
        self.talkApi = talkApi
    }
    
    //MARK: funcs
    func fetchModels(completionHandler: () -> Void ){
        
        talkApi.all{ models in
            self.models = models.map{ talk in
                //map model to a view model representation
                TalkCellModel(talk:talk)
            }
            completionHandler()
        }
    }
}

extension TalksDataSource: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //make sure we are loading the cell correctly
        guard let cell =  tableView.dequeueReusableCellWithIdentifier("TalkCell") as? TalkCell else {
            print("ERROR: \(#function) did not load cell correctly")
            return TalkCell()
        }
        
        let model = models[indexPath.row]
        cell.setModel(model)
        return cell
        
    }
}
