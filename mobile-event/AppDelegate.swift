import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        FIRApp.configure()
        
        window = UIWindow()
        
        let talkCoordinator = TalkCoordinator(window: window!)
        talkCoordinator.start()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

