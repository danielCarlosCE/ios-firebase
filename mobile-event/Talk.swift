protocol Talk {
    
    var speakerName       : String {get set}
    var talkTitle         : String {get set}
    var time              : NSDate {get set}
    
    func downloadImage( completionHandler: (data: NSData?) -> Void )
    
}