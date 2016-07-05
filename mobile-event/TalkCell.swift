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
            pictureContainer.layer.borderColor = accentColor.CGColor
        }
    }
    @IBOutlet weak var descriptionContainer: UIView!{
        didSet{
            descriptionContainer.layer.borderWidth = 0.8
            descriptionContainer.layer.borderColor = accentColor.CGColor
        }
    }
    
    @IBOutlet weak var featurePicture: UIImageView!
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var talkTitle: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func setModel(model: TalkCellModel){
        speakerName.text = model.speakerName
        talkTitle.text = model.talkTitle
        time.text = model.time
        
        featurePicture.image = nil
        model.downloadImage { (image) in
            self.featurePicture.image = image
        }
    }
}

