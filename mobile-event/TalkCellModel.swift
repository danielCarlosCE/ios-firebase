//
//  TalkCellModel.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/17/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import UIKit

class TalkCellModel {
    
    var speakerName       : String
    var talkTitle         : String
    var time              : String
    
    private var talk : Talk
    
    init(talk: Talk){
        self.talk = talk
        self.speakerName       = talk.speakerName
        self.talkTitle         = talk.talkTitle
        let formater           = NSDateFormatter()
        formater.dateFormat    = "hh:mm"
        self.time              = formater.stringFromDate(talk.time)
    }
    
    func downloadImage(completionHandler: (image: UIImage?) -> Void ){
        self.talk.downloadImage(completionHandler)
    }
    
    
}