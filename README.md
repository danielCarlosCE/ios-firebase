## Setup
We are using *CocoaPods* as our dependency manager.
You should do a ```pod install``` and use the ```.xcworkspace``` file instead of ```.xcodeproj```

### Coordinators
Coordinator are responsible for instantiating view controllers and inject their dependencies.

```
let controller = storyboard
                .instantiateViewControllerWithIdentifier("MyController")
                as? MyController
controller.dependency = DependencyImpl()                
```
They receive a ```UIWindow``` instance and use it to show the controller.

```
window.rootViewController = myController
```
If, for example, the view controller should be inside a navigation controller, the coordinator is the responsible for doing that. The view controller doesn't know about any navigation controller.

### Abstract Factory
We use the design pattern *Abstract Factory* for decoupling our data source from the API implementation. That way, we can change from Firebase to another API implementation without the data source noticing.

We are using *constructor injection* to receive an ```TalkApi``` instance on our ```TalksDataSource```. Our coordinator is responsible for sending an ```TalkApi``` implementation:
```
TalksDataSource(talkApi: FireBTalkApi())
```
If we want change from FireBase to another implementation, we change the coordinator only.
