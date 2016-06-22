import Firebase


struct FireBTalkApi: TalkApi {
    
    func all(completionHandler: (models: [Talk]) -> Void) {

        let reference = FIRDatabase.database().reference().child("talks")
        
        //read data once and don't listen for changes
        reference.observeSingleEventOfType(.Value, withBlock: { snapshot in
           
            guard let talks = snapshot.children.allObjects as? [FIRDataSnapshot] else{
                completionHandler(models: [])
                return
            }
            
            var models = [Talk]()
            for talk  in talks{
                //map talk to a FireBTalk object
                if let fireBTalk = FireBTalk(snapShot: talk) {
                  models.append(fireBTalk)
                }
            }
            completionHandler(models: models)
            
        }, withCancelBlock: { error in
            print(error)
        })
       
    }

}