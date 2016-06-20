//
//  TalkApi.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/20/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import Foundation

protocol TalkApi {
    func all( completionHandler: (models: [Talk]) -> Void )
}