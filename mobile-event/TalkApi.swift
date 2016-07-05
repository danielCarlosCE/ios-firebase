import Foundation

protocol TalkApi {
    func all( completionHandler: (models: [Talk]) -> Void )
}