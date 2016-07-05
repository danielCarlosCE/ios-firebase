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
        formater.dateFormat    = "HH:mm"
        self.time              = formater.stringFromDate(talk.time)
    }
    
    func downloadImage(completionHandler: (image: UIImage?) -> Void ){
        self.talk.downloadImage { (data) in
           
            guard data != nil else {
                completionHandler(image: nil)
                return
            }
            
            let image = UIImage(data: data!)
            completionHandler(image: image)
        }
    }
    
    
}