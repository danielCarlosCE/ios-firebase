//
//  TalkCoordinator.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/20/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import UIKit

class TalkCoordinator {
    var window : UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let talksController = storyboard.instantiateViewControllerWithIdentifier("TalksViewController") as? TalksViewController
        talksController?.dataSource = TalksDataSource(talkApi: FireBTalkApi())
        
        window.rootViewController = talksController
        
    }
}