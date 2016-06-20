//
//  FireBStorage.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/20/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import Foundation

struct FireBStorage {
    
    func downloadFile(child: String, completionHandler: (data: NSData?) -> Void){
        let reference = FIRStorage.storage().reference().child(child)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        reference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) in
            guard error == nil else {
                print(error)
                completionHandler(data: nil)
                return
            }
            completionHandler(data: data)
        }

    }
}