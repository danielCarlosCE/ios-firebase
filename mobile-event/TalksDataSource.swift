import UIKit

class TalksDataSource: NSObject {
    
    //MARK: properties
    var talkApi : TalkApi
    
    private var models : [TalkCellModel] = []
    
    //MARK: inits
    init(talkApi: TalkApi){
        self.talkApi = talkApi
    }
    
    //MARK: funcs
    func fetchModels(completionHandler: (successfully:Bool)->()){
        
        talkApi.all{ models in
            self.models = models.map{talk in
                //map model to a view model representation
                TalkCellModel(talk:talk)
            }
            completionHandler(successfully: true)
        }
    }
}

extension TalksDataSource: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell =  tableView.dequeueReusableCellWithIdentifier("TalkCell") as? TalkCell {
            let model = models[indexPath.row]
            cell.setModel(model)
            return cell
        }
        print("\(#function) did not load cell correctly")
        return TalkCell()
    }
}
