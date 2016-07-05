import UIKit

class TalkCoordinator {
    var window : UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let talksController = storyboard.instantiateViewControllerWithIdentifier("TalksViewController") as? TalksViewController {
            //inject dependency
            talksController.dataSource = TalksDataSource(talkApi: FireBTalkApi())
            
            //put controller in a navigation controller
            talksController.title = "Mobile Day"
            let navigationController = UINavigationController()
            navigationController.viewControllers = [talksController]
            
            //show navigation controller
            window.rootViewController = navigationController
        }
       
        
    }
}