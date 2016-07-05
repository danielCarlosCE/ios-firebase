class FireBTalk: Talk {
    //MARK: public properties
    var speakerName : String
    var talkTitle : String
    var time : NSDate
    
    //MARK: privated properties
    private var featurePictureUrl : String
    
    private let speakerNameKey = "speakerName"
    private let titleKey = "title"
    private let speakerPictureKey = "speakerPicture"
    private let timeKey = "time"
    
    private let timedDateFormat = "MM-dd-yyyy HH:mm"
    
    //MARK: inits
    init?( snapShot: FIRDataSnapshot){
        
        let formater = NSDateFormatter()
        formater.dateFormat = timedDateFormat

        guard let speakerNameValue       = snapShot.value?[speakerNameKey]     as? String,
              let talkTitleValue         = snapShot.value?[titleKey]           as? String,
              let featurePictureUrlValue = snapShot.value?[speakerPictureKey]  as? String,
              let timeValue              = snapShot.value?[timeKey]            as? String,
              let timeDate               = formater.dateFromString(timeValue) else{
                
                print("invalid snapShot values")
                return nil
                
        }
        
        self.speakerName = speakerNameValue
        self.talkTitle = talkTitleValue
        self.featurePictureUrl = featurePictureUrlValue
        self.time = timeDate
    }
    //MARK: protocol methods
    func downloadImage(completionHandler: (data: NSData?) -> Void ){
        
        FireBStorage().downloadFile(featurePictureUrl) { (data) in
           
            guard let imageData = data else {
                completionHandler(data: nil)
                return
            }
            
            completionHandler(data: imageData)
        }
        
    }
    
}
