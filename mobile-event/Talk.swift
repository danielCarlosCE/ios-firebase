//
//  Talk.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/20/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import Foundation

protocol Talk {
    
    var speakerName       : String {get set}
    var talkTitle         : String {get set}
    var time              : NSDate {get set}
    
    func downloadImage( completionHandler: (image: UIImage?) -> Void )
    
 
}