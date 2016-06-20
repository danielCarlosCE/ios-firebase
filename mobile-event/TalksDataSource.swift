//
//  TalksDataSource.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/17/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import UIKit

class TalksDataSource: NSObject {
    
    //Mark: properties
    var talkApi : TalkApi
    
    private var models : [TalkCellModel] = []
    
    //Mark: inits
    init(talkApi: TalkApi){
        self.talkApi = talkApi
    }
    
    //Mark: funcs
    func fetchModels(completionHandler: (successfully:Bool)->()){
        
        talkApi.all{ models in
            self.models = models.map{talk in
                TalkCellModel(talk:talk)
            }
            completionHandler(successfully: true)
        }
        
    }
}

extension TalksDataSource :UITableViewDataSource{
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
