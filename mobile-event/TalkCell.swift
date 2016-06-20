//
//  TalkCell.swift
//  mobile-event
//
//  Created by Daniel Carlos on 6/17/16.
//  Copyright © 2016 danielcarlosce. All rights reserved.
//

import UIKit

class TalkCell : UITableViewCell{
    
    @IBOutlet weak var dot: UIView!{
        didSet{
            dot.layer.cornerRadius = dot.frame.width/2
        }
    }
    @IBOutlet weak var pictureContainer: UIView!{
        didSet{
            pictureContainer.layer.borderWidth = 0.8
            pictureContainer.layer.borderColor = UIColor(red: 236/255, green: 115/255, blue: 87/255, alpha: 1).CGColor
        }
    }
    @IBOutlet weak var descriptionContainer: UIView!{
        didSet{
            descriptionContainer.layer.borderWidth = 0.8
            descriptionContainer.layer.borderColor = UIColor(red: 236/255, green: 115/255, blue: 87/255, alpha: 1).CGColor
        }
    }
    
    @IBOutlet weak var featurePicture: UIImageView!
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var talkTitle: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func setModel(model: TalkCellModel){
        speakerName.text = model.speakerName
        talkTitle.text   = model.talkTitle
        time.text        = model.time
        self.featurePicture.image = nil
        model.downloadImage { (image) in
            self.featurePicture.image = image
        }
    }
}

