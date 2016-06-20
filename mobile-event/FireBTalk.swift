//
//  FireBTalk.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/20/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import Foundation

class FireBTalk: Talk {
    var speakerName       : String
    var talkTitle         : String
    var time              : NSDate
    
    private var featurePictureUrl : String

    
    private let speakerNameKey    = "speakerName"
    private let titleKey          = "title"
    private let speakerPictureKey = "speakerPicture"
    private let timeKey           = "time"
    private let timedDateFormat   = "MM-dd-yyyy HH:mm"
    
    init?( snapShot: FIRDataSnapshot){
        
        guard let speakerNameValue       = snapShot.value?[speakerNameKey]    as? String,
              let talkTitleValue         = snapShot.value?[titleKey]          as? String,
              let featurePictureUrlValue = snapShot.value?[speakerPictureKey] as? String,
              let timeValue              = snapShot.value?[timeKey]            as? String else{
                
                print("invalid snapShot values")
                return nil
                
        }
        
        self.speakerName = speakerNameValue
        self.talkTitle = talkTitleValue
        self.featurePictureUrl = featurePictureUrlValue
        
        let formater           = NSDateFormatter()
        formater.dateFormat    = timedDateFormat
        guard let timeDate = formater.dateFromString(timeValue) else{
            print("invalid time value")
            return nil
        }
        self.time = timeDate
    }
    
    func downloadImage( completionHandler: (image: UIImage?) -> Void ){
        FireBStorage().downloadFile(featurePictureUrl) { (download) in
           
            guard let data = download else {
                completionHandler(image: nil)
                return
            }
            
            let image = UIImage(data: data)
            completionHandler(image: image)
        }
        
    }
    
}
