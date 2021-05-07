//
//  Alert.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import UIKit

class Alert{
    //Show Alert with just a particular message
    class func show(on viewController:UIViewController = UIApplication.topViewController(),title: String? = nil, message:String, actionTitle:String = "OK", completion:(()->Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let attributedText = NSMutableAttributedString(string: message, attributes: [
            NSAttributedString.Key.font: UIFont(name: "SourceSansPro-SemiBold", size: 15.0)!,
            NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        alertController.setValue(attributedText, forKey: "attributedMessage")
        
        if let titleString = title {
            let attributedTitle = NSMutableAttributedString(string: titleString, attributes: [
            NSAttributedString.Key.font: UIFont(name: "SourceSansPro-Bold", size: 17.0)!,
            NSAttributedString.Key.foregroundColor : UIColor.black])
            alertController.setValue(attributedTitle, forKey: "attributedTitle")
        }
        alertController.view.tintColor = .orange
        let okAction=UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            completion?()
        }
        alertController.addAction(okAction)
        alertController.preferredAction = okAction
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    class func show(on viewController:UIViewController = UIApplication.topViewController(), title:String? = nil, message:String? = nil, type:UIAlertController.Style = .alert, action1:(title: String,completion: ()->Void)? = nil, action2: (title: String,completion: ()->Void)? = nil){
        let alertController=UIAlertController(title: title, message: message, preferredStyle: type)
        alertController.view.tintColor = .orange
        if let alertMassage = message {
            let attributedText = NSMutableAttributedString(string: alertMassage, attributes: [
                NSAttributedString.Key.font: UIFont(name: "SourceSansPro-SemiBold", size: 15.0)!,
                NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            alertController.setValue(attributedText, forKey: "attributedMessage")
        }
        if let titleString = title {
            let attributedTitle = NSMutableAttributedString(string: titleString, attributes: [
            NSAttributedString.Key.font: UIFont(name: "SourceSansPro-Bold", size: 17.0)!,
            NSAttributedString.Key.foregroundColor : UIColor.black])
            alertController.setValue(attributedTitle, forKey: "attributedTitle")
        }
        
        if let action1 = action1{
            let action=UIAlertAction(title: action1.title, style: UIAlertAction.Style.default) { (action) in
                alertController.dismiss(animated: true, completion: nil)
                action1.completion()
            }
            alertController.addAction(action)
            alertController.preferredAction = action
        }
        
        if let action2 = action2{
            let action=UIAlertAction(title: action2.title, style: UIAlertAction.Style.default) { (action) in
                alertController.dismiss(animated: true, completion: nil)
                action2.completion()
            }
            alertController.addAction(action)
//            alertController.preferredAction = action
        }
//        let cancelAction=UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (action) in
//            alertController.dismiss(animated: true, completion: nil)
//        }
//        alertController.addAction(cancelAction)
//        alertController.preferredAction = cancelAction
        viewController.present(alertController, animated: true, completion: nil)
    }

    //Pressent Action sheet with completion
    class func showActionsheet(vc:UIViewController = UIApplication.topViewController(), message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
        let alertViewController = UIAlertController(title: "", message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        vc.present(alertViewController, animated: true, completion: nil)
    }
}
